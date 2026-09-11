import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/prefs/app_prefs.dart';
import 'package:myapp/app/core/services/push_notification/fcm_service.dart';
import 'package:myapp/app/core/services/push_notification/provider/fcm_provider.dart';

final sessionRepositoryProvider = Provider<SessionRepository>((ref) {
  return SessionRepository(
    ref.watch(appPrefsProvider),
    ref.watch(fcmServiceProvider),
  );
});

class SessionRepository {
  const SessionRepository(this._appPrefs, this._fcmService);

  final AppPrefs _appPrefs;
  final FCMService _fcmService;

  bool get hasSession => _appPrefs.token?.isNotEmpty ?? false;

  Future<void> logout() async {
    await _appPrefs.clearSession();
    try {
      await _fcmService.cancelAllNotifications();
    } catch (_) {
      // Notification cleanup must not prevent a local logout.
    }
  }
}
