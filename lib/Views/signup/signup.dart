import 'dart:ui';

import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/signup/signup_provider.dart';
import 'package:agricultare_weather_pests/Views/login_screen.dart/login_screen.dart';
import 'package:agricultare_weather_pests/style/CustomText/customtext_navigation.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/constant/testfield.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/style/constant/validator.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

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
        body: Form(
          key: formKey,
          child: Consumer<SignupProvider>(
            builder: (context, provider, child) {
              return  ModalProgressHUD(
                inAsyncCall: provider.state == ViewState.busy,
                child: SingleChildScrollView(
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
                        
                            validator: KlValidators.firstNameValidator,
                        controller: provider.firstNameController,
                          style: KlTextInputFieldStyle.firstName,
                          prefixIcon: Icon(Icons.person_2, color: greyColor)),
                          SizedBox(height: 8.h),
                           KlTextInputField(
                            validator: KlValidators.secondNameValidator,
                            controller: provider.lastNameController,
                          style: KlTextInputFieldStyle.firstName,
                          hintText:"lastName".tr,
                          prefixIcon: Icon(Icons.person_2, color: greyColor)),
                          SizedBox(height: 8.h),
                          
                      KlTextInputField(
                        
                            validator: KlValidators.logInPasswordValidator,
                        controller: provider.passwordController,
                          style: KlTextInputFieldStyle.password,
                           hintText:"enterPassword".tr,
                          prefixIcon: Icon(Icons.lock, color: greyColor)),
                          SizedBox(height: 8.h),
                      KlTextInputField(
                        
                            validator: KlValidators.emailValitador,
                        controller: provider.emailController,
                          style: KlTextInputFieldStyle.email,
                          prefixIcon: Icon(Icons.email, color: greyColor)),
                          SizedBox(height: 8.h),
                      Padding(
                          padding: EdgeInsets.only(top: 40.h, bottom: 25.h),
                          child: KlButton(
                              onPressed: () {
                                print("pressed");
                              if(formKey.currentState!.validate()){
                                provider.signUp(context);
                              }
                              },
                              label: "signUp".tr,
                              style: KlButtonStyle.login)),
                     
                      CustomTextWithNavigation(
                          questionText: "alreadyAccount".tr,
                          actionText: "loginSmall".tr,
                          navigateToScreen: Loginscreen())
                    ])))
                  ])),
              );
              }
              ),
        ),
    );
  }
}





// {
//      "first_name":"sllll",
//     "last_name":"khan",
// 	 "email":"ullah@gmail.com",
//     "password":"Akram1111111a1"
// }