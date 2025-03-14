import 'dart:convert';
import 'package:agricultare_weather_pests/Model/userdata_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferences _prefs;

  LocalStorageService(this._prefs);


  // Save language preference
  Future<void> saveLanguage(String languageCode) async {
    await _prefs.setString('language', languageCode);
  }

  // Load saved language
  String? loadLanguage() {
    return _prefs.getString('language');
  }


  
// ! ****************************************************************************
  // Save user data
  Future<void> saveUser(UserDataModel user) async {
    await _prefs.setString('user_data', json.encode(user.toJson()));
  }

  // Load user data
  UserDataModel? loadUser() {
    final String? userJson = _prefs.getString('user_data');
    if (userJson != null) {
      return UserDataModel.fromJson(json.decode(userJson));
    }
    return null;
  }
}

