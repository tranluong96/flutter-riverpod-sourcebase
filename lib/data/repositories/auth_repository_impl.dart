import 'package:myapp/data/services/prefs_local_storage/app_prefs.dart';
import 'package:myapp/data/services/push_notification/fcm_service.dart';
import 'package:myapp/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._appPrefs, this._fcmService);

  final PrefsLocalStorage _appPrefs;
  final FCMService _fcmService;

  @override
  bool get hasSession => _appPrefs.token?.isNotEmpty ?? false;

  @override
  Future<void> logout() async {
    await _appPrefs.clearSession();
    try {
      await _fcmService.cancelAllNotifications();
    } catch (_) {
      // Notification cleanup must not prevent a local logout.
    }
  }
}
