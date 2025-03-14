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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserDataModel? userDataModel; // Store user data

  Future<void> login(BuildContext context) async {
    setState(ViewState.busy);

    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    log('Email: $email, Password: $password');

    final Map<String, String> loginData = {'email': email, 'password': password};

    try {
      log('Calling API...');
      final response = await http.post(
        Uri.parse("https://testproject.famzhost.com/api/login"), 
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: json.encode(loginData),
      );

      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}'); 

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(response.body);

        if (responseData == null || !responseData.containsKey('user') || responseData['user'] == null) {
          throw Exception('User data is missing in API response');
        }

        final userJson = responseData['user'];
        final token = responseData['token'];

        // Map API response to UserDataModel
      userDataModel = UserDataModel.fromJson(userJson).copyWith(token: token);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('user_id', userJson['id'].toString());
        await prefs.setString('user_token', token);
      await prefs.setString('user_data', json.encode(userDataModel!.toJson())); // Save user data

        log('User ID: ${userJson['id']}  Token: $token ');
        log('Saved User Data: 000000000000000 ${json.encode(userDataModel!.toJson())}');


        LocalStorageService storageService = LocalStorageService(prefs);
        String? currentLanguage = storageService.loadLanguage() ?? 'en';
        await storageService.saveLanguage(currentLanguage);
        Get.updateLocale(Locale(currentLanguage));

        // Clear fields
        emailController.clear();
        passwordController.clear();

        // Navigate to HomeScreen
        Get.offAll(() => HomeScreen());

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login Successful')),
        );
      } else {
        log('Login Failed. Response: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login Failed. Please check your credentials.')),
        );
      }
    } catch (e) {
      log('Exception: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    } finally {
      setState(ViewState.idle);
      notifyListeners();
    }
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}







  // Future<void> logout(BuildContext context) async {
  //   setState(ViewState.busy);

  //   try {
  //     final response = await http.post(
  //       Uri.parse('https://testproject.famzhost.com/api/logout'),
  //       headers: {'Content-Type': 'application/json'},
  //     );

  //     if (response.statusCode == 200) {
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       await prefs.clear(); 

  //       Get.offAll(() => Loginscreen());
  //       log('User logged out successfully');
  //     } else {
  //       log('Logout failed: ${response.body}');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Failed to logout. Please try again.')),
  //       );
  //     }
  //   } catch (e) {
  //     log('Error during logout: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('An error occurred. Please try again later.')),
  //     );
  //   } finally {
  //     setState(ViewState.idle);
  //   }
  // }
