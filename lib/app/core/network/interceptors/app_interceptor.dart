import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/enums/enums.dart';
import 'package:myapp/app/core/network/controller/network_controller.dart';
import 'package:myapp/app/core/network/logs/app_logger_provider.dart';
import 'package:myapp/app/core/prefs/app_prefs.dart';
import 'package:myapp/app/core/services/push_notification/provider/fcm_provider.dart';
import 'package:myapp/app/core/utils/error_utils.dart';
import 'package:myapp/app/helpers/message_helper.dart';
import 'package:myapp/app/helpers/toast_helper.dart';
import 'package:myapp/app/widgets/loading_overlay/providers/loading_provider.dart';

class AppInterceptor extends Interceptor {
  final Ref ref;

  AppInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _addAuthHeader(options);
    _logRequest(options);
    _setLoading(options, isLoading: true);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logResponse(response);
    _setLoading(response.requestOptions, isLoading: false);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logError(err);
    _setLoading(err.requestOptions, isLoading: false);

    // Request was intentionally cancelled (tab switch, screen dispose, etc.):
    // swallow silently — no unauthorized handling, no error toast.
    if (err.type == DioExceptionType.cancel) {
      return handler.next(err);
    }

    final statusCode = err.response?.statusCode;
    switch (statusCode) {
      case 401:
        _handleUnauthorized(err);
      default:
        _handleGenericError(err);
    }

    super.onError(err, handler);
  }

  // --- Helper Methods ---

  void _addAuthHeader(RequestOptions options) {
    final token = ref.read(appPrefsProvider).token;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
  }

  void _setLoading(RequestOptions options, {required bool isLoading}) {
    final showLoading = options.extra['showLoading'] == true;
    if (showLoading) {
      ref.read(globalLoadingProvider.notifier).state = isLoading;
    }
  }

  void _logRequest(RequestOptions options) {
    if (kDebugMode) {
      ref
          .read(appLoggerProvider)
          .i(
            '➡️ REQUEST\n'
            'URL: ${options.uri}\n'
            'METHOD: ${options.method}\n'
            'HEADERS: ${options.headers}\n'
            'DATA: ${options.data}',
          );
    }
  }

  void _logResponse(Response response) {
    if (kDebugMode) {
      ref
          .read(appLoggerProvider)
          .i(
            '⬅️ RESPONSE\n'
            'STATUS: ${response.statusCode}\n'
            'DATA: ${response.data}',
          );
    }
  }

  void _logError(DioException err) {
    if (kDebugMode) {
      ref
          .read(appLoggerProvider)
          .e(
            '⛔ ERROR\n'
            'TYPE: ${err.type}\n'
            'MESSAGE: ${err.message}\n'
            'URL: ${err.requestOptions.uri}\n'
            'DATA: ${err.response?.data}',
          );
    }
  }

  void _handleUnauthorized(DioException err) {
    ref.read(appPrefsProvider).clear();
    final message = err.response?.data['message']?.toString() ?? '';
    ToastHelper.showError(ref, message);
    ref.read(fcmServiceProvider).cancelAllNotifications();
    // ref.read(appRouterProvider).replaceAll([const LoginRoute()]);
  }

  void _handleGenericError(DioException err) {
    final skipShowError = err.requestOptions.extra['skipShowError'] == true;
    if (!skipShowError) {
      ToastHelper.showError(ref, getApiErrorMessage(err));
    }
  }
}

class NetworkInterceptor extends Interceptor {
  final Ref ref;

  NetworkInterceptor(this.ref);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var status = ref.read(networkControllerProvider);

    // On cold start the status can still be [unknown] (the first reachability
    // check hasn't completed yet). Resolve it authoritatively before letting
    // the request through, so we fail fast with a clean offline message
    // instead of leaking a request that dies with a raw socket error.
    if (status == NetworkStatus.unknown) {
      status = await ref.read(networkControllerProvider.notifier).recheck();
    }

    if (status == NetworkStatus.offline) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: MessageHelper.internetDisconnected,
        ),
        true,
      );
    }

    handler.next(options);
  }
}
