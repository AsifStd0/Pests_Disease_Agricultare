import 'dart:ui';

import 'package:agricultare_weather_pests/bottom_navbar.dart';
import 'package:agricultare_weather_pests/Views/login_screen.dart/login_screen.dart';
import 'package:agricultare_weather_pests/style/CustomText/customtext_navigation.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/constant/testfield.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
   Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: [
      Image.asset(
        MepaImage.splash_1,
        fit: BoxFit.cover,
      ),
      BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: Container(color: Colors.black.withOpacity(0.1))),

      Align(
          alignment: Alignment.center,
          child: Container(
              margin: EdgeInsets.only(top: 200.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.w),
                      topRight: Radius.circular(50.w)), // Circular corners
              ),
              child: Column(children: [
                 
                lets_started(),
                SizedBox(height:20.h),
                KlTextInputField(
                    style: KlTextInputFieldStyle.firstName,
                    prefixIcon: Icon(Icons.person_2, color: greyColor)),
                    SizedBox(height: 8.h),
                KlTextInputField(
                    style: KlTextInputFieldStyle.email,
                    prefixIcon: Icon(Icons.email, color: greyColor)),
                    SizedBox(height: 8.h),

                KlTextInputField(
                    style: KlTextInputFieldStyle.phoneNumber,
                    prefixIcon: Icon(Icons.phone, color: greyColor)),
                    SizedBox(height: 8.h),

                KlTextInputField(
                    style: KlTextInputFieldStyle.password,
                    prefixIcon: Icon(Icons.lock, color: greyColor)),
                    SizedBox(height: 8.h),

                KlTextInputField(
                  hintText: 'Re-Enter Password',
                    style: KlTextInputFieldStyle.password,
                    prefixIcon: Icon(Icons.lock, color: greyColor)),
                Padding(
                    padding: EdgeInsets.only(top: 40.h, bottom: 25.h),
                    child: KlButton(
                        onPressed: () {
                          Get.to(()=>BottomNavBar());
                        },
                        label: MepaText.signUp,
                        style: KlButtonStyle.login)),
               
                CustomTextWithNavigation(
                    questionText: MepaText.dontAccount,
                    actionText: MepaText.loginSmall,
                    navigateToScreen: Loginscreen())
              ])))
    ])));
  }
}
