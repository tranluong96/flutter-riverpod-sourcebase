import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final appPrefsProvider = Provider<PrefsLocalStorage>((ref) {
  return PrefsLocalStorage(ref.watch(sharedPrefsProvider));
});

class PrefsLocalStorage {
  final SharedPreferences prefs;

  PrefsLocalStorage(this.prefs);

  static const _tokenKey = 'token';
  static const _languageCodeKey = 'language_code';

  /// Token
  Future<void> saveToken(String token) async {
    await prefs.setString(_tokenKey, token);
  }

  String? get token => prefs.getString(_tokenKey);


  /// Language code
  String? get languageCode => prefs.getString(_languageCodeKey);

  Future<void> setLanguageCode(String code) async {
    await prefs.setString(_languageCodeKey, code);
  }

  /// Clear Session and authen when logout
  Future<void> clear() async {
    await prefs.clear();
  }

  Future<void> clearSession() async {
    await prefs.remove(_tokenKey);
  }
}
