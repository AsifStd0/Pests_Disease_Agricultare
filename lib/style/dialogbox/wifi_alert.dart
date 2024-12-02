import 'package:agricultare_weather_pests/Views/splashscreen/splashscreen.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              MepaImage.noInterNetConnection,
              // noInterNetConnection,
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
            CustomText(
              text: 'No Internet Connection',
              fontsize: 18,
              fontweight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.offAll(() => Splashscreen());
              },
              child: CustomText(text: 'Retry'),
            ),
          ],
        ),
      ),
    );
  }
}



