import 'dart:convert';
import 'package:agricultare_weather_pests/Model/userdata_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferences _prefs;

  LocalStorageService(this._prefs);

  // Save user data
  Future<void> saveUser(UserDataModel user) async {
    await _prefs.setString('user', json.encode(user.toJson()));
  }

  // Retrieve user data
  Future<UserDataModel?> getUser() async {
    final userString = _prefs.getString('user');
    if (userString == null) return null;
    return UserDataModel.fromJson(json.decode(userString));
  }

  // Save authentication token
  Future<void> saveToken(String token) async {
    await _prefs.setString('user_token', token);
  }

  // Load authentication token
  String? loadToken() {
    return _prefs.getString('user_token');
  }

  // Save language preference
  Future<void> saveLanguage(String languageCode) async {
    await _prefs.setString('language', languageCode);
  }

  // Load saved language
  String? loadLanguage() {
    return _prefs.getString('language');
  }
}
