import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/Views/signup/signup.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, 
            centerTitle: true,
            title: Text(MepaText.pests)
          ),
         body: Center(
                 child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 KlButton(
          style: KlButtonStyle.skip,
          label: MepaText.signUp,
          borderRadius: BorderRadius.circular(30.r),
          onPressed: () => Get.to(()=> Signup())
         
                 ),
                 SizedBox(height: 60.h),
                 KlButton(
          style: KlButtonStyle.skip,
          label: MepaText.skip,
          borderRadius: BorderRadius.circular(30.r),
          onPressed: () => Get.to(()=> HomeScreen())
                 )
               ]
                 )
               )
      
      )
    );
  }
}