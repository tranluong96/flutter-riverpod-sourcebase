import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/data/models/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final appPrefsProvider = Provider<AppPrefs>((ref) {
  return AppPrefs(ref.watch(sharedPrefsProvider));
});

class AppPrefs {
  final SharedPreferences prefs;

  AppPrefs(this.prefs);

  static const _tokenKey = 'token';
  static const _userKey = 'user';
  static const _doNotShowUpdateUntilKey = 'do_not_show_update_until';
  static const _isFirstOpenAppKey = 'is_first_open_app';
  static const _isInitCameraKey = 'is_init_camera';
  static const _languageCodeKey = 'language_code';

  Future<void> saveToken(String token) async {
    await prefs.setString(_tokenKey, token);
  }

  Future<void> saveUser(String user) async {
    await prefs.setString(_userKey, user);
  }

  UserModel? getUser() {
    final jsonString = prefs.getString(_userKey);
    if (jsonString == null) return null;

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return UserModel.fromJson(jsonMap);
  }

  String? get token => prefs.getString(_tokenKey);

  String? get languageCode => prefs.getString(_languageCodeKey);

  Future<void> setLanguageCode(String code) async {
    await prefs.setString(_languageCodeKey, code);
  }

  Future<void> skipUpdate() async {
    final until = DateTime.now().add(const Duration(days: 1));
    await prefs.setString(_doNotShowUpdateUntilKey, until.toIso8601String());
  }

  bool get isUpdateSkipped {
    final raw = prefs.getString(_doNotShowUpdateUntilKey);
    if (raw == null) return false;
    final until = DateTime.tryParse(raw);
    if (until == null) return false;
    return DateTime.now().isBefore(until);
  }

  bool get isFirstOpenApp => prefs.getBool(_isFirstOpenAppKey) ?? true;

  Future<void> markAppAsOpened() async {
    await prefs.setBool(_isFirstOpenAppKey, false);
  }

  bool get isInitCamera => prefs.getBool(_isInitCameraKey) ?? true;

  Future<void> markCameraAsInit() async {
    await prefs.setBool(_isInitCameraKey, false);
  }

  Future<void> clear() async {
    await prefs.clear();
  }
}
