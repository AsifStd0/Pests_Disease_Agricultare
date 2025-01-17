import 'package:agricultare_weather_pests/style/CustomText/custom_back_button.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                    appBar:AppBar(
                      title: Text("aboutUs".tr,),
                      centerTitle: true,
          leading: CircularBackButton(
            
            onPressed: (){
            Get.back();
          },),
),
      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back,color: blackColor,),
      //   title: Text('About Us'),
      //   ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 20,left: 10.w,right: 10.w), 
          child: Column(children: [
            CustomText(
              text: "aboutUs".tr,
              fontsize: 28.sp,
            ),
            SizedBox(height: 20.h,),
             Align(
              alignment: Alignment.center,
               child: CustomText(
                text: "splash_head".tr,
                maxlines: 2,
                // 'WEATHER  & PEST DISEASE \nCONTROL APP',
                softwrap: false,
                fontsize: 20.sp,
                       ),
             ),
             SizedBox(height: 20.h),
              Align(
              alignment: Alignment.center,
               child: Text(
                overflow: TextOverflow.visible,
                 "aboutUsData".tr,
                     style: TextStyle(
                fontSize: 16.sp,
                    ),
                       ),
              )],),
        ),
      ),
    );
  }
}