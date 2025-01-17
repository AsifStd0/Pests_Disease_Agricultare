
import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/Views/login_screen.dart/login_screen.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
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
  bool isLoading = true; // To manage loading state
@override
void initState() {
  super.initState();
  checkUserExists();
}

// Function to check if the user exists by checking user ID
Future<void> checkUserExists() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('user_id');

  await Future.delayed(Duration(seconds: 2)); // Delay to simulate loading

  if (userId != null) {
    // User exists, check language preference and navigate to HomeScreen
    String? languageCode = prefs.getString('language'); // Get the language from SharedPreferences

    // Set the app's locale based on the stored language preference
    if (languageCode != null) {
      if (languageCode == 'ur') {
        Get.updateLocale(const Locale('ur', 'PK'));
      } else {
        Get.updateLocale(const Locale('en', 'US'));
      }
    } else {
      // Default language is English if no preference is found
      Get.updateLocale(const Locale('en', 'US'));
    }

    // Navigate to HomeScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  } else {
    // User does not exist, navigate to LoginScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Loginscreen()),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Center(
          child: isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      MepaImage.splashLogo),
                    SizedBox(height: 20.h),
                   CustomText(
  text: "splash_head".tr,
  fontsize: 24.sp,
  fontweight: FontWeight.bold,
  maxlines: 2, // Display only one line
),
                    SizedBox(height: 20.h),
                  ],
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}