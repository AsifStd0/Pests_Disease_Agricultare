import 'dart:convert';
import 'dart:developer';

import 'package:agricultare_weather_pests/Model/base_view_model.dart';
import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Model/userdata_model.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/repository/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class SignupProvider extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  UserDataModel userDataModel = UserDataModel();

  Future<void> signUp(BuildContext context) async {
    setState(ViewState.busy);

    final Map<String, String> userData = {
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    };

    try {
      final response = await http.post(
        Uri.parse('https://testproject.famzhost.com/api/register'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(userData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
print('Success ${response.body}');
        final responseData = json.decode(response.body);

        // Extract user details from API response
        final userJson = responseData['user'];
        final token = responseData['token'];
        print('User: $userJson   token: ------ $token');

        // Populate UserDataModel
userDataModel = UserDataModel(
  id: userJson['id'] is int ? userJson['id'] : int.tryParse(userJson['id'].toString()),
  username: userJson['username'],
  email: userJson['email'],
  password: userJson['password'],
);

        log('User data: $userDataModel');

        // Save user data locally (SharedPreferences)
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user_id', userJson['id'].toString());
        prefs.setString('user_token', token);
        prefs.setString('user_data', json.encode(userDataModel.toJson()));
        log('User data saved to SharedPreferences');

        LocalStorageService storageService = LocalStorageService(prefs);

        // Check and apply language preference
        String? currentLanguage = storageService.loadLanguage();
        log('11111111');
        if (currentLanguage == null) {
          String languageCode = 'en';
          await storageService.saveLanguage(languageCode);
          log('Setting default language: $languageCode');
          currentLanguage = languageCode;
        } else {
          log('Language preference: $currentLanguage');
        }
log('22222222222');
        Get.updateLocale(Locale(currentLanguage));

        // Navigate to HomeScreen
        Get.offAll(() => HomeScreen());

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('SignUp Successful')),
        );
      } else {
        log('Error: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign up: ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    } finally {
      setState(ViewState.idle);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }
}
