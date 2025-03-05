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
      Uri.parse('http://ai-pest.kpitb.online/api/auth/login'),
        // 'https://mongoapi-440911.uw.r.appspot.com/v1/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(loginData),
    );

    if (response.statusCode == 200) {
      log('status');
      final responseData = json.decode(response.body);

      // Log response for debugging
      log('Response Data: $responseData');

      // Access the first item in the 'data' array
      var user = responseData['data'][0];
      userdata_model = UserDataModel(
        id: user['_id'] ?? '',
        email: user['email'] ?? '',
        firstName: user['first_name'] ?? '',
        lastName: user['last_name'] ?? '',
      );

      // Save user data to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // ! ************
            LocalStorageService storageService = LocalStorageService(prefs);

            
            // ! *********


      // Save individual fields for quick access
      prefs.setString('user_id', user['_id'] ?? '');
      prefs.setString('user_email', user['email'] ?? '');
      prefs.setString('user_first_name', user['first_name'] ?? '');
      prefs.setString('user_last_name', user['last_name'] ?? '');
      prefs.setString('user_role', user['role'] ?? '');

      // Optionally save the entire response for later use
      prefs.setString('user_data', json.encode(responseData));
      // ! *******
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

// ! **********
      // Navigate to the HomeScreen
      Get.offAll(() => HomeScreen());

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('loginsuccessful'.tr)),
      );
    } else {
      // Handle non-200 responses
      log('Error Response: ${response.body}');
      final errorData = json.decode(response.body);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Failed: ${errorData['message'] ?? 'Unknown error'}')),
      );
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
  // Future<void> login(BuildContext context) async {
  //   setState(ViewState.busy);

  //   final String email = emailController.text;
  //   final String password = passwordController.text;

  //   // Log the credentials
  //   log('Email: $email, Password: $password');

  //   final Map<String, String> loginData = {
  //     'email': email,
  //     'password': password,
  //   };

  //   try {
  //     // API Call
  //     final response = await http.post(
  //       Uri.parse('https://mongoapi-440911.uw.r.appspot.com/v1/auth/login'),
  //       headers: {"Content-Type": "application/json"},
  //       body: json.encode(loginData),
  //     );

  //     if (response.statusCode == 200) {
  //       final responseData = json.decode(response.body);

  //       // Save user data locally (SharedPreferences)
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setString('user_data', json.encode(responseData));

  //       // Navigate to the next screen
  //       Get.to(() => HomeScreen());

  //       // Show success message
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Login Successful')),
  //       );
  //     } else {
  //       // Log the error response
  //       log('Error Response: ${response.body}');
        
  //       // Show error message
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Login Failed: ${response.body}')),
  //       );
  //     }
  //   } catch (e) {
  //     // Log and handle exceptions
  //     log('Exception: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('An error occurred: $e')),
  //     );
  //   } finally {
  //     setState(ViewState.idle);
  //     notifyListeners();
  //   }
  // }


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
                  // await prefs.clear(); // Clear all user data from local storage
//  prefs.setString('user_data', json.encode(responseData));
await prefs.remove('user_data');
await prefs.remove('user_id');
await prefs.remove('user_email');
await prefs.remove('user_first_name');
await prefs.remove('user_last_name');
await prefs.remove('user_role');
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
