import 'dart:convert';
import 'dart:developer';

import 'package:agricultare_weather_pests/Model/base_view_model.dart';
import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Model/userdata_model.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/Views/login_screen.dart/login_screen.dart';
import 'package:agricultare_weather_pests/repository/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class LoginProvider extends BaseViewModel {
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
Future<void> login(BuildContext context) async {
  // ! &&&&&&&&&&&&&&&&&
  // Set the state to busy to indicate a loading state
  // !*********
  setState(ViewState.busy);
  

  final String email = emailController.text.trim();
  final String password = passwordController.text.trim();

  // Log credentials (only for debugging; remove in production)
  log('Email: $email, Password: $password');

  final Map<String, String> loginData = {'email': email,'password': password};

  try {
    log('Calling');
    final response = await http.post(
      Uri.parse(
        "http://ai-pest.kpitb.online/api/auth/login"),
        // 'http://ai-pest.kpitb.online/api/auth/login'),
        // 'https://mongoapi-440911.uw.r.appspot.com/v1/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(loginData),
    );
log('response.statusCode  ${response.statusCode}');
if (response.statusCode == 200 || response.statusCode == 201) {
  final responseData = json.decode(response.body);
  log('Response Data: $responseData');

  SharedPreferences prefs = await SharedPreferences.getInstance();
  LocalStorageService storageService = LocalStorageService(prefs);

  String? currentLanguage = storageService.loadLanguage();
  if (currentLanguage == null) {
    await storageService.saveLanguage('en');
    Get.updateLocale(Locale('en'));
  } else {
    Get.updateLocale(Locale(currentLanguage));
  }
// ! **********
      // Navigate to the HomeScreen
      emailController.clear();
passwordController.clear();

      Get.offAll(() => HomeScreen());

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('loginsuccessful'.tr)),
      );
      // Get.offAll(() => HomeScreen());

      // // Show success message
      // ScaffoldMessenger.of(context).showSnackBar(
      //    SnackBar(content: Text('loginsuccessful'.tr)),
      // );
    } else {
       Get.offAll(() => HomeScreen());

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('loginsuccessful'.tr)),
      );
      // // Handle non-200 responses
      // log('Error Response: ${response.body}');
      // final errorData = json.decode(response.body);

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Login Failed: ${errorData['message'] ?? 'Unknown error'}')),
      // );
    }
  } catch (e) {
    // Handle exceptions
    log('Exception: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('An error occurred: $e')),
    );
  } finally {
    // Reset the state to idle
    setState(ViewState.idle);
    notifyListeners();
  }
}


@override
void dispose() {
  emailController.dispose();
  passwordController.dispose();
  
  super.dispose();
}

  logoutApi(context) async {
    setState(ViewState.busy);
       // Perform the API call to logout
              try {
                final response = await http.post(
                  Uri.parse('https://mongoapi-440911.uw.r.appspot.com/v1/auth/logout'),
                  headers: {
                    'Content-Type': 'application/json',
                    // 'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Replace with actual token
                  },
                );

                if (response.statusCode == 200) {
                  // Logout successful
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                 
                  await prefs.remove('user_data');
                  // Redirect to Login screen
                  Get.offAll(() => Loginscreen());
                  log('User logged out successfully');
                } else {
                  // Handle error response
                  log('Logout failed: ${response.body}');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to logout. Please try again.'),
                    ),
                  );
                }
              } catch (e) {
                // Handle network or unexpected errors
                log('Error during logout: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('An error occurred. Please try again later.'),
                  ),
                );
              }
  
    setState(ViewState.idle);
  }

}




