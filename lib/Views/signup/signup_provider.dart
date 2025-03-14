import 'dart:convert';
import 'dart:developer';
import 'package:agricultare_weather_pests/Model/base_view_model.dart';
import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Model/userdata_model.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/repository/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SignupProvider extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  UserDataModel? userDataModel;

  Future<void> signUp(BuildContext context) async {
    setState(ViewState.busy);
    final Map<String, String> userData = {
      "first_name": firstNameController.text.trim(),
      "last_name": lastNameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text,
    };

    try {
      final response = await http.post(
        Uri.parse('https://testproject.famzhost.com/api/register'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(userData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(response.body);
        final userJson = responseData['user'];
        final token = responseData['token'];

      // ✅ Now use copyWith to update the token
      userDataModel = UserDataModel.fromJson(userJson).copyWith(token: token);
        // ! ***************
              SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('user_id', userJson['id'].toString());
       await prefs.setString('user_data', json.encode(userDataModel!.toJson())); // ✅ Save full user data

        await prefs.setString('user_token', token);
        log('Saved User Data: 00000000000000000000 ${json.encode(userDataModel!.toJson())}');


        // Set language preference
        LocalStorageService storageService = LocalStorageService(prefs);
        String? currentLanguage = storageService.loadLanguage() ?? 'en';
        await storageService.saveLanguage(currentLanguage);
        Get.updateLocale(Locale(currentLanguage));

        // Navigate to HomeScreen
        Get.offAll(() => HomeScreen());

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('SignUp Successful')),
        );
      } else {
        _handleError(response, context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
        setState(ViewState.idle);

    notifyListeners();
  }

  void _handleError(http.Response response, BuildContext context) {
    final errorData = json.decode(response.body);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Signup Failed: ${errorData['message']}')),
    );
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
