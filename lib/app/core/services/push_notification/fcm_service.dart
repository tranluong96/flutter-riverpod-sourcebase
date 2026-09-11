// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_badge_plus/app_badge_plus.dart';

import 'package:myapp/firebase_options.dart';
import 'package:myapp/app/core/services/push_notification/fcm_degate.dart';

/// Top-level function for handling background messages.
/// It must be a top-level function or a static method.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Ensure Firebase is initialized if not already
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  // Update badge count
  final unreadCountStr = message.data['unreadCount'];
  if (unreadCountStr != null) {
    final unreadCount = int.tryParse(unreadCountStr) ?? 0;
    AppBadgePlus.updateBadge(unreadCount);
  }

  if (kDebugMode) {
    print('Handling a background message: ${message.messageId}');
  }
}

class FCMService {
  final FlutterLocalNotificationsPlugin _localNotification =
      FlutterLocalNotificationsPlugin();

  final AndroidNotificationChannel _androidChannel =
      const AndroidNotificationChannel(
        'com.app.notification.channel',
        'ES Kitchen',
        description: 'ES Kitchen Notification Channel',
        importance: Importance.max,
        playSound: false,
      );

  FCMPushNotificationDelegate? _delegate;

  void setDelegate(FCMPushNotificationDelegate delegate) {
    _delegate = delegate;
  }

  // ===============================
  // INIT
  // ===============================

  Future<void> init() async {
    await _initFirebase();
    _setupCrashlytics();

    // Set background handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await _setupLocalNotification();
    _setupFCMListener();

    // Handle token changes
    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      _delegate?.onTokenChanged(token);
    });
  }

  // ===============================
  // FIREBASE
  // ===============================

  Future<void> _initFirebase() async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      if (kDebugMode) {
        await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
          false,
        );
      }
    }
  }

  // ===============================
  // PERMISSION
  // ===============================

  Future<void> requestPermission() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    if (Platform.isAndroid) {
      final status = await Permission.notification.status;
      if (status.isDenied) {
        await Permission.notification.request();
      }
    }
  }

  // ===============================
  // LOCAL NOTIFICATION
  // ===============================

  Future<void> _setupLocalNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: false,
        );

    await _localNotification
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_androidChannel);

    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await _localNotification.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (details) {
        final payload = details.payload;
        if (payload != null) {
          final data = jsonDecode(payload)['data'] as Map<String, dynamic>;
          _handleNotificationClick(data);
        }
      },
    );
  }

  void _setupFCMListener() {
    // Foreground messages
    FirebaseMessaging.onMessage.listen((message) {
      if (_delegate != null) {
        _delegate!.onForegroundMessage(message.data);
      }

      // Update badge count

      final unreadCountStr = message.data['unreadCount'];
      if (unreadCountStr != null) {
        final unreadCount = int.tryParse(unreadCountStr) ?? 0;
        AppBadgePlus.updateBadge(unreadCount);
      }

      if (Platform.isAndroid) {
        _showLocalNotification(message);
      }
    });

    // Interaction when app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleNotificationClick(message.data);
    });
  }

  void _handleNotificationClick(Map<String, dynamic> data) {
    if (_delegate != null) {
      _delegate!.onOpenFromNotification(data);
    }
    if (kDebugMode) {
      print('Notification clicked with data: $data');
    }
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    final body = notification.body;
    final title = notification.title;

    final androidDetails = AndroidNotificationDetails(
      _androidChannel.id,
      _androidChannel.name,
      channelDescription: _androidChannel.description,
      playSound: false,
      importance: Importance.max,
      priority: Priority.high,
      visibility: NotificationVisibility.public,
      number: int.tryParse(message.data['unreadCount']) ?? 0,
      styleInformation: BigTextStyleInformation(body ?? ''),
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: false,
    );

    await _localNotification.show(
      id: notification.hashCode,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      ),
      payload: jsonEncode({'data': message.data}),
    );
  }

  // ===============================
  // CRASHLYTICS
  // ===============================
  void _setupCrashlytics() {
    final previousFlutterError = FlutterError.onError;
    FlutterError.onError = (details) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      previousFlutterError?.call(details);
    };

    final previousPlatformError = PlatformDispatcher.instance.onError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return previousPlatformError?.call(error, stack) ?? true;
    };
  }

  // ===============================
  // UTILS
  // ===============================

  Future<void> cancelAllNotifications() async {
    await _localNotification.cancelAll();
  }

  Future<String?> getToken() {
    return FirebaseMessaging.instance.getToken();
  }

  Stream<RemoteMessage> onMessage() {
    return FirebaseMessaging.onMessage;
  }

  Stream<RemoteMessage> onMessageOpenedApp() {
    return FirebaseMessaging.onMessageOpenedApp;
  }

  Future<RemoteMessage?> getInitialMessage() {
    return FirebaseMessaging.instance.getInitialMessage();
  }
}
