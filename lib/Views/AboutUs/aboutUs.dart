import 'package:agricultare_weather_pests/style/CustomText/custom_back_button.dart';
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
                      title: Text('About Us',),
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
              text: 'About us',
              fontsize: 28.sp,
            ),
             Align(
              alignment: Alignment.center,
               child: CustomText(
                text: 'WEATHER  & PEST DISEASE \nCONTROL APP',
                fontsize: 20.sp,
                       ),
             ),
             SizedBox(height: 20.h),
              Align(
              alignment: Alignment.center,
               child: Text(
                overflow: TextOverflow.visible,
                 '''Our app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest  alerts, crop disease management Our app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest  alerts, crop disease managementOur app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest  alerts, crop disease managementOur app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest  alerts, crop disease managementOur app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest  alerts, crop disease managementOur app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest  alerts, crop disease managementOur app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest  alerts, crop disease managementOur app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest  alerts, crop disease managementOur app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest  alerts, crop disease managementOur app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest  alerts, crop disease management''',
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