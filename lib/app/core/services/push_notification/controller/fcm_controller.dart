import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/app.dart';
import 'package:myapp/app/core/prefs/app_prefs.dart';
import 'package:myapp/app/core/services/push_notification/fcm_degate.dart';
import 'package:myapp/app/core/services/push_notification/fcm_service.dart';
import 'package:myapp/app/core/services/push_notification/provider/fcm_provider.dart';
import 'package:myapp/app/core/services/push_notification/state/fcm_state.dart';
// import 'package:myapp/app/core/services/device_info/device_info_service.dart';
// import 'package:myapp/data/models/notification/device_token_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// import 'package:myapp/data/repositories/provider/auth_repository_provider.dart';

part 'fcm_controller.g.dart';

@riverpod
class FCMController extends Notifier<FCMState>
    implements FCMPushNotificationDelegate {
  late final FCMService _service;

  @override
  FCMState build() {
    _service = ref.read(fcmServiceProvider);
    _service.setDelegate(this);
    _syncState();
    return const FCMState();
  }

  Future<void> _syncState() async {
    await _fetchTokenWithRetry();

    // Handle initial message when app is started from terminated state
    try {
      final initialMessage = await _service.getInitialMessage();
      if (initialMessage != null) {
        onOpenFromNotification(initialMessage.data, isTerminated: true);
      }
    } catch (_) {}
  }

  Future<void> _fetchTokenWithRetry({int maxRetries = 3}) async {
    for (var i = 0; i < maxRetries; i++) {
      try {
        final token = await _service.getToken();
        if (token != null) {
          onTokenChanged(token);
          return;
        }
      } catch (e) {
        debugPrint('[FCM] getToken error (attempt ${i + 1}): $e');
      }

      if (i < maxRetries - 1) {
        await Future.delayed(Duration(seconds: 2 << i));
      }
    }
  }

  // FCMPushNotificationDelegate
  // ===============================
  @override
  void onTokenChanged(String token) {
    if (token.isNotEmpty) {
      state = state.copyWith(deviceToken: token, permissionGranted: true);
      _syncTokenToServer(token);
    }
  }

  Future<void> _syncTokenToServer(String token) async {
    try {
      final appPrefs = ref.read(appPrefsProvider);
      final accessToken = appPrefs.token;
      if (accessToken == null || accessToken.isEmpty) {
        return;
      }

      // final deviceInfo = await DeviceInfoService.getDeviceInfo();
      // final repository = ref.read(authRepositoryProvider);

      // Call API Update deviceToken
    } catch (e) {
      debugPrint('[FCM] _syncTokenToServer error: $e');
    }
  }

  @override
  void onForegroundMessage(Map<String, dynamic> data) {
    final accessToken = ref.read(appPrefsProvider).token;
    if (accessToken == null || accessToken.isEmpty) return;

    state = state.copyWith(lastMessage: data);
    // Update list locally
  }

  @override
  void onOpenFromNotification(
    Map<String, dynamic> data, {
    bool isTerminated = false,
  }) {
    state = state.copyWith(lastMessage: data, openedFromNotification: true);

    final String typeRoute = data['route']?.toString() ?? '';
    final token = ref.read(appPrefsProvider).token;
    final isLoggedIn = token != null && token.isNotEmpty;
    final router = ref.read(appRouterProvider);

    PageRouteInfo? targetRoute;

    switch (typeRoute) {
      case 'setting':
        break;
      default:
        targetRoute = null;
    }
    if (targetRoute == null) return;

    // Close all dialog/modal before navigate
    final navigatorContext = router.navigatorKey.currentContext;
    if (navigatorContext != null) {
      Navigator.of(
        navigatorContext,
        rootNavigator: true,
      ).popUntil((route) => route is! PopupRoute);
    }

    if (isTerminated) {
      if (isLoggedIn) {
        // router.replaceAll([const BottomBarRoute()]);
        Future.delayed(const Duration(milliseconds: 1500), () {
          router.push(targetRoute!);
        });
      } else {
        // router.replaceAll([const StartRoute()]);
      }
      return;
    }
    router.push(targetRoute);
  }
}
