import 'package:agricultare_weather_pests/Views/splashscreen/option_screen.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false, 
            centerTitle: true,
          title: Text("pests".tr),
        ),
        body: Container(
            color: whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  textAlign: TextAlign.center,
                  text: "welcome".tr,
                  fontsize: 58.sp,
                  color: Color(0xffA0B622)
                )
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 30.h),
                child: Image.asset(MepaImage.leaf,width: 195.w,height: 195.h),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: 30.h),
                child: CustomText(
                  text: "pestsDisease".tr,
                  color: mainColor,
                  fontsize: 32.sp
                )
              ),
              KlButton(
                label: "continueTxt".tr,
                // textstyle: TextStyle(fontSize: 20.sp),
                // bordercol: mainColor,
                borderRadius: BorderRadius.circular(10.r),
                style: KlButtonStyle.continueBtn,
                onPressed: ()=>
                  
                  Get.to(()=>OptionScreen()))
            ]
          )
        )
      )
    );
  }
}