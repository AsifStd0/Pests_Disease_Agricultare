import 'package:agricultare_weather_pests/Views/Forgot_Password/successful_done.dart';
import 'package:agricultare_weather_pests/style/CustomText/custom_back_button.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(
           leading: CircularBackButton(onPressed: (){
            print('AAAAAAAAAAAAAAAAA ddddddddddddd');
Navigator.of(context).push(
  MaterialPageRoute(builder: (context) =>  SuccessfulDone())
);
          },),
),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(left: 30.w,right: 30.w,top: 150.h),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            CustomText(text: 'Success!'.tr,customstyle:TextStyle(
                                              fontSize: 23.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',)),
                Padding(
                  padding: EdgeInsets.only(top: 20.h,bottom: 60.h),
                  child: CustomText(text: "congratulation".tr,maxlines: 2,),
                ),
                
                   Align(
                    alignment: Alignment.center,
                     child: KlButton(
                      onPressed: (){
                        Get.to(()=> SuccessfulDone());
                      },
                                style: KlButtonStyle.fullButton,
                                label: "confirm".tr

                     ),),
          ],),
        ),
      ),
    );
  }
}