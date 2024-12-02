import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/style/CustomText/custom_back_button.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessfulDone extends StatelessWidget {
  const SuccessfulDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(
          // leading: CircularBackButton(onPressed: ()=>Get.back(),)
           leading: CircularBackButton(onPressed: (){
            print('AAAAAAAAAAAAAAAAA ddddddddddddd');
Navigator.of(context).push(
  MaterialPageRoute(builder: (context) =>  HomeScreen())
);
          },),
),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(left: 30.w,right: 30.w,top: 70.h),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            // Image.asset(MepaImage.success,width: 90.w,height: 90.h,)
              Image.asset(MepaImage.success,width: 110.w,height: 110.h,),
SizedBox(height: 20.h,),
            CustomText(text: 'Success!',customstyle:TextStyle(
                                              fontSize: 23.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',)),
                Padding(
                  padding: EdgeInsets.only(top: 20.h,bottom: 60.h),
                  child: CustomText(text: MepaText.congratulation,maxlines: 2,),
                ),
                
                   Align(
                    alignment: Alignment.center,
                     child: KlButton(
                      onPressed: (){
                        Get.to(()=>HomeScreen());
                      },
                                style: KlButtonStyle.fullButton,
                                label: MepaText.confirm

                     ),),
          ],),
        ),
      ),
    );
  }
}