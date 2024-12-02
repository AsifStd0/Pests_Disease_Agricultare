import 'package:agricultare_weather_pests/Model/base_view_model.dart';
import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/signup/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginProvider extends BaseViewModel {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    Future<bool> checkUserExists(String uid) async {
    try {
      final DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      final data = doc.data() as Map<String, dynamic>;
      if (data.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error checking user existence: $e');
      return false;
    }
  }
  TextEditingController forgotemailController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) {
    setState(ViewState.busy); 
      String email = emailController.text;
      String password = passwordController.text;
      print('Email: $email, Password: $password');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login Successful')));
          Get.to(()=>Signup());

    setState(ViewState.idle); 
  }
}
