import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/domain/models/user/user.dart';
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
  static const _userKey = 'user';
  static const _datetimeDoNotShowUpdateKey = 'datetime_do_not_show_update';
  static const _languageCodeKey = 'language_code';

  Future<void> saveToken(String token) async {
    await prefs.setString(_tokenKey, token);
  }

  Future<void> saveUser(String user) async {
    await prefs.setString(_userKey, user);
  }

  User? getUser() {
    final jsonString = prefs.getString(_userKey);
    if (jsonString == null) return null;

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return User.fromJson(jsonMap);
  }

  String? get token => prefs.getString(_tokenKey);

  String? get languageCode => prefs.getString(_languageCodeKey);

  Future<void> setLanguageCode(String code) async {
    await prefs.setString(_languageCodeKey, code);
  }

  Future<void> skipUpdate() async {
    final until = DateTime.now().add(const Duration(days: 1));
    await prefs.setString(_datetimeDoNotShowUpdateKey, until.toIso8601String());
  }

  bool get isUpdateSkipped {
    final raw = prefs.getString(_datetimeDoNotShowUpdateKey);
    if (raw == null) return false;
    final until = DateTime.tryParse(raw);
    if (until == null) return false;
    return DateTime.now().isBefore(until);
  }

  Future<void> clear() async {
    await prefs.clear();
  }

  Future<void> clearSession() async {
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
  }
}
