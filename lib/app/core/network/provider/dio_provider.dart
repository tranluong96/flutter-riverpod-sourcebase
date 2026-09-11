import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/configs/env_config.dart';
import 'package:myapp/app/core/network/interceptors/app_interceptor.dart';
import 'package:myapp/app/core/network/logs/app_logger_provider.dart';

final dioProvider = Provider<Dio>((ref) {
  final logger = ref.watch(appLoggerProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: EnvConfig.baseUrl,
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
    ),
  );

  dio.interceptors.add(AppInterceptor(ref));
  dio.interceptors.add(NetworkInterceptor(ref));

  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        responseHeader: true,
        requestBody: true,
        responseBody: true,
        logPrint: logger.i,
      ),
    );
  }

  return dio;
});
