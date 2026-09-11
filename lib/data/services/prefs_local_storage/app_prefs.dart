import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/domain/models/auth/auth_model.dart';
import 'package:myapp/domain/models/auth/session_model.dart';
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
  static const _authKey = 'auth';
  static const _sessionKey = 'session';
  static const _languageCodeKey = 'language_code';

  /// Token
  Future<void> saveToken(String token) async {
    await prefs.setString(_tokenKey, token);
  }

  String? get token => prefs.getString(_tokenKey);

  /// Information Authen
  Future<void> saveAuthInfo(AuthModel value) async {
    final result = jsonEncode(value.toJson());
    await prefs.setString(_authKey, result);
  }

  AuthModel? getAuthInfo() {
    final jsonString = prefs.getString(_authKey);
    if (jsonString == null) return null;

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return AuthModel.fromJson(jsonMap);
  }

  /// Session
  Future<void> saveSession(SessionModel value) async {
    final result = jsonEncode(value.toJson());
    await prefs.setString(_sessionKey, result);
  }

  SessionModel? getSession() {
    final jsonString = prefs.getString(_sessionKey);
    if (jsonString == null) return null;

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return SessionModel.fromJson(jsonMap);
  }

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
    await prefs.remove(_authKey);
    await prefs.remove(_sessionKey);
  }
}
