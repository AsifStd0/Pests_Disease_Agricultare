import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        title: const Text('Privacy '),
        ),
           body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 20,left: 10.w,right: 10.w), 
          child: Column(children: [
            CustomText(
              text: 'Privacy Policy',
              fontsize: 28.sp,
            ),
            
             SizedBox(height: 20.h),
              Align(
              alignment: Alignment.center,
               child: Text(
                overflow: TextOverflow.visible,
                 '''
Our app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest alerts, crop disease management''',
                    style: TextStyle(
                fontSize: 16.sp,
                    ),
                       ),

                       
              ),

SizedBox(height: 30.h,),
               Align(
              alignment: Alignment.center,
               child: CustomText(
                text: 'Information collection & use ',
                fontsize: 20.sp,
                       ),
             ),
             SizedBox(height: 20.h),
              Align(
              alignment: Alignment.center,
               child: Text(
                overflow: TextOverflow.visible,
                 '''Our app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest alerts, crop disease management''',
                    style: TextStyle(
                fontSize: 16.sp,
                    ),
                       ),),
              SizedBox(height: 30.h,),
               Align(
              alignment: Alignment.center,
               child: CustomText(
                text: 'Service providers ',
                fontsize: 20.sp,
                       ),
             ),
                          SizedBox(height: 20.h),

                Align(
              alignment: Alignment.center,
               child: Text(
                overflow: TextOverflow.visible,
                 '''Our app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest alerts, crop disease management''',
                    style: TextStyle(
                fontSize: 16.sp,
                    ),
                       ),),
             SizedBox(height: 30.h,),
               Align(
              alignment: Alignment.center,
               child: CustomText(
                text: 'Soil fertility mapping this app  ',
                fontsize: 20.sp,
                       ),
             ),
                          SizedBox(height: 20.h),

                Align(
              alignment: Alignment.center,
               child: Text(
                overflow: TextOverflow.visible,
                 '''Our app provides farmers with up-to-date weather forecasts and real-time pest disease alerts to help improve productivity.Weather updates, pest alerts, crop disease management''',
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