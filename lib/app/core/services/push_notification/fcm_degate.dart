abstract class FCMPushNotificationDelegate {
  void onTokenChanged(String token);

  void onOpenFromNotification(Map<String, dynamic> data);

  void onForegroundMessage(Map<String, dynamic> data);
}
