import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("privacy".tr),
        ),
           body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 20,left: 10.w,right: 10.w), 
          child: Column(children: [
            CustomText(
              text: "privacyPolicy".tr,
              fontsize: 28.sp,
            ),
            
             SizedBox(height: 20.h),
              Align(
              alignment: Alignment.center,
               child: Text(
                overflow: TextOverflow.visible,
             "privacyDummy".tr,
                  style: TextStyle(
                fontSize: 16.sp,
                    ),
                       ),

                       
              ),

SizedBox(height: 30.h,),
               Align(
              alignment: Alignment.center,
               child: CustomText(
                text: "informationCollectionUse".tr,
                fontsize: 20.sp,
                       ),
             ),
             SizedBox(height: 20.h),
              Align(
              alignment: Alignment.center,
               child: Text(
                overflow: TextOverflow.visible,
                 "privacyDummy".tr,
                 style: TextStyle(
                fontSize: 16.sp,
                    ),
                       ),),
              SizedBox(height: 30.h,),
               Align(
              alignment: Alignment.center,
               child: CustomText(
                text: "serviceProviders".tr,
                fontsize: 20.sp,
                       ),
             ),
                          SizedBox(height: 20.h),

                Align(
              alignment: Alignment.center,
               child: Text(
                overflow: TextOverflow.visible,
                 "privacyDummy".tr,
                   style: TextStyle(
                fontSize: 16.sp,
                    ),
                       ),),
             SizedBox(height: 30.h,),
               Align(
              alignment: Alignment.center,
               child: CustomText(
                text: "soilFertilityMapping".tr,
                fontsize: 20.sp,
                       ),
             ),
                          SizedBox(height: 20.h),

                Align(
              alignment: Alignment.center,
               child: Text(
                overflow: TextOverflow.visible,
              "privacyDummy".tr,
                  style: TextStyle(
                fontSize: 16.sp,
                    ),
                       ),),
              
              ],),
        ),
      ),
    );
  }
}