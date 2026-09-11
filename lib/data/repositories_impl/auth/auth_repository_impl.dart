import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/data/models/auth/employee_request.dart';
import 'package:myapp/data/models/auth/verify_company_request.dart';
import 'package:myapp/data/services/api/providers/remote_api_provider.dart';
import 'package:myapp/data/services/api/rest_api.dart';
import 'package:myapp/data/services/prefs_local_storage/app_prefs.dart';
import 'package:myapp/data/services/push_notification/fcm_controller.dart';
import 'package:myapp/data/services/push_notification/fcm_service.dart';
import 'package:myapp/domain/models/auth/auth_model.dart';
import 'package:myapp/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remoteApi, this._appPrefs, this._fcmService);

  final RestAPI _remoteApi;
  final PrefsLocalStorage _appPrefs;
  final FCMService _fcmService;

  @override
  bool get hasSession => _appPrefs.token?.isNotEmpty ?? false;

  @override
  Future<void> logout() async {
    try {
      await _appPrefs.clearSession();
      await _fcmService.cancelAllNotifications();
    } catch (_) {
      // Notification cleanup must not prevent a local logout.
    }
  }

  @override
  Future<AuthModel> verifyCompanyCode(VerifyCompanyRequest input) async {
    try {
      final response = await _remoteApi.verifyCompanyApi(input);
      return response.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> login(EmployeeRequest input) async {
    try {
      final response = await _remoteApi.loginApi(input);
      return response.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveAuth(AuthModel auth) async {
    await _appPrefs.saveAuthInfo(auth);
    await _appPrefs.saveToken(auth.token);
  }
}

/// Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.watch(remoteApiProvider),
    ref.watch(appPrefsProvider),
    ref.watch(fcmServiceProvider),
  );
});
