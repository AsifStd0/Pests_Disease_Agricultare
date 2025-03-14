
import 'dart:convert';
import 'dart:developer';

import 'package:agricultare_weather_pests/Model/dummy_api_model.dart';
import 'package:agricultare_weather_pests/Model/userdata_model.dart';
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
  UserDataModel? user; // Define the user model

  @override
  void initState() {
    super.initState();
    setLanguageAndCheckUser();
  }

  Future<void> setLanguageAndCheckUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language');

    // Set language before UI builds
    if (languageCode != null) {
      Get.updateLocale(Locale(languageCode, languageCode == 'ur' ? 'PK' : 'US'));
    } else {
      Get.updateLocale(const Locale('en', 'US')); // Default to English
    }

    await checkUserExists();
  }


  Future<void> checkUserExists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      String? userDataString = prefs.getString('user_data');
      if (userDataString != null) {
        Map<String, dynamic> userDataMap = json.decode(userDataString);
        setState(() {
          user = UserDataModel.fromJson(userDataMap);
        });
      }
      Get.offAll(() => HomeScreen(user: user));  // Pass user data
    } else {
      Get.offAll(() => Loginscreen()); // Navigate to Login if not logged in
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