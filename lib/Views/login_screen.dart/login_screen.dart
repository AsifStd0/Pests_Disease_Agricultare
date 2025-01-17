import 'dart:ui';

import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/Views/login_screen.dart/login_provider.dart';
import 'package:agricultare_weather_pests/bottom_navbar.dart';
import 'package:agricultare_weather_pests/Views/Forgot_Password/forgot_screen.dart';
import 'package:agricultare_weather_pests/Views/signup/signup.dart';
import 'package:agricultare_weather_pests/style/CustomText/customtext_navigation.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/constant/testfield.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/style/constant/validator.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class Loginscreen extends StatefulWidget {
  State<Loginscreen> createState() => _LoginscreenState();
}
class _LoginscreenState extends State<Loginscreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: formKey,
          child: Consumer(
            builder: (context, LoginProvider provider, child) {
              return ModalProgressHUD(
                inAsyncCall: provider.state == ViewState.busy,
                child: SingleChildScrollView(
                  child: Stack(children: [
                    Image.asset(MepaImage.splash_1, fit: BoxFit.cover),
                    BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                child: Container(color: Colors.black.withOpacity(0.1))),
                    Align(
                alignment: Alignment.center,
                child: Container(
                    margin: EdgeInsets.only(top: 200.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.w),
                            topRight: Radius.circular(50.w))),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                       
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding:  EdgeInsets.only(right: 32.w,bottom: 10.h),
                              child: KlButton(
                                label: "skip".tr,
                                style: KlButtonStyle.smallSkip,
                                onPressed: () {
                                  Get.to(() => HomeScreen());
                                },
                                textStyle: TextStyle(color: whiteColor,fontSize: 11.sp)
                              )
                            )
                          ),
                          lets_started(),
                          SizedBox(height: 40.h),
                          KlTextInputField(
                            controller: provider.emailController,
                            validator: KlValidators.emailValitador,
                              style: KlTextInputFieldStyle.email,
                              prefixIcon: Icon(Icons.email, color: greyColor)),
                          SizedBox(height: 20.h),
                          KlTextInputField(
                            controller: provider.passwordController,
                            validator: KlValidators.logInPasswordValidator,
                            style: KlTextInputFieldStyle.password,
                            prefixIcon: Icon(Icons.lock, color: greyColor)),
                          SizedBox(height: 40.h),
                          KlButton(
                              onPressed: () {
                                if(formKey.currentState!.validate()){
                                  provider.login(context);
                                }
                              },
                              label: "login".tr,
                              style: KlButtonStyle.login),
                          SizedBox(height: 10.h),
                          Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                  onTap: () => Get.to(() => ForgotScreen()),
                                  child: CustomText(text: "forgotPassword".tr))),
                          SizedBox(height: 20.h),
                          Row(children: [
                            Expanded(child: Divider(thickness: 1, color: blackColor)),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: CustomText(text: "or".tr)),
                            Expanded(child: Divider(thickness: 1, color: blackColor))
                          ]),
                          SizedBox(height: 20.h),
                          CustomTextWithNavigation(
                              questionText: "dontAccount".tr,
                              actionText: "signUp".tr,
                              navigateToScreen: Signup())
                        ])))
                  ])
                ),
              );
              }
                ),
          ),
        );
  }
}
