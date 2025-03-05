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

    // Prepare user data
    final Map<String, String> userData = {
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    };
    log("${userData}");

    try {
      // API call
      final response = await http.post(
        Uri.parse('http://ai-pest.kpitb.online/api/auth/register'),
          
          // 'https://mongoapi-440911.uw.r.appspot.com/v1/auth/register'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(userData),
      );

      // Handle API response
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        // Extract the user ID from the response
        final String userId = responseData['data'][0]['_id'];
        log('User ID: $userId');
        
        // Populate the UserDataModel
        userDataModel = UserDataModel.fromJson(responseData['data'][0]);

        // Save user data locally (SharedPreferences)
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user_id', userId);  // Save user ID
        prefs.setString('user_data', json.encode(userDataModel.toJson()));  // Save full user data

            LocalStorageService storageService = LocalStorageService(prefs);

  // Check and apply language preference
      String? currentLanguage = storageService.loadLanguage();

      if (currentLanguage == null) {
        String languageCode = 'en'; // Default to English
        await storageService.saveLanguage(languageCode);
        log('Language preference not found. Setting default to: $languageCode');
        currentLanguage = languageCode;
      } else {
        log('Language preference already exists: $currentLanguage');
      }

      // Apply the language preference
      if (currentLanguage == 'ur') {
        log('Setting language to Urdu');
        Get.updateLocale(Locale('ur'));
      } else {
        log('Setting language to English');
        Get.updateLocale(Locale('en'));
      }

  // // Check if a language preference is already saved
      // String? currentLanguage = prefs.getString('language');
      // if (currentLanguage == null) {
      //   // Set default language preference if not already set
      //   String languageCode = 'en'; // Or dynamically detect language
      //   prefs.setString('language', languageCode);
      //   log('Language preference set to: $languageCode');
      // } else {
      //   log('Language preference already exists: $currentLanguage');
      // }
        // Navigate to the next screen (HomeScreen)
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
      // Handle any exceptions
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
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    
    super.dispose();
  }
}
