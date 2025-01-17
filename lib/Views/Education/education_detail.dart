import 'package:agricultare_weather_pests/style/CustomText/custom_back_button.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EducationDetail extends StatefulWidget {
  const EducationDetail({super.key});

  @override
  State<EducationDetail> createState() => _EducationDetailState();
}

class _EducationDetailState extends State<EducationDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                       appBar:AppBar(
          leading: CircularBackButton(
            onPressed: (){
            Get.back();
          },),),
          body: Padding(
            padding:  EdgeInsets.only(top: 20.h,right: 15.w,left: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Image.asset(MepaImage.crop_2,height: 200.h,width: double.infinity,fit: BoxFit.fill,),
                  Padding(
                    padding:  EdgeInsets.only(top: 25.h,bottom: 15.h),
                    child: CustomText(text: "aloeVera".tr,fontsize: 18.sp,fontweight: FontWeight.w700),
                  ),

                  Text("educationDummy".tr,style: TextStyle(fontSize: 14.sp,),)
            ],),
          ),
    );
  }
}