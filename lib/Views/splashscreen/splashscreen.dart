
import 'dart:developer';

import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/Views/login_screen.dart/login_screen.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Splashscreen extends StatefulWidget {
   Splashscreen({super.key});
  

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
   bool isLoading = true;

  @override
  void initState() {
    super.initState();
    setLanguageAndCheckUser();
  }

  Future<void> setLanguageAndCheckUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language');

    // Set language immediately before UI builds
    if (languageCode != null) {
      Get.updateLocale(Locale(languageCode, languageCode == 'ur' ? 'PK' : 'US'));
    } else {
      Get.updateLocale(const Locale('en', 'US')); // Default to English
    }
    checkUserExists();
  }

  Future<void> checkUserExists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');
    
log('userId $userId');
    await Future.delayed(const Duration(milliseconds: 1500));

    if (userId != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loginscreen()),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: isLoading
          ? Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 80.h,bottom: 40.h),
                    child: CustomText(
                      text: 'Welcome'.tr,
                      fontsize: 36.sp,
                      fontweight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  Image.asset(
                    MepaImage.leaf_search,
                    height: 180.h,
                    width: 230.w,
                    ),
    
                    Padding(
                      padding:  EdgeInsets.only(top: 40.h,bottom: 60.h),
                      child: CustomText(
                        text: 'pestdisease'.tr,
                        fontsize: 28.sp,
                        fontweight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                    CustomText(
                        text: 'detectcropus'.tr,
                        fontsize: 19.sp,
                        fontweight: FontWeight.bold,
                        color: mainColor.withOpacity(0.7),
                      ),
                ],
              ),
          )
          : SizedBox(),
    );
  }
}