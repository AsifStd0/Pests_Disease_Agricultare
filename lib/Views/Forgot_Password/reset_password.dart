import 'package:agricultare_weather_pests/Views/Forgot_Password/SuccessScreen.dart';
import 'package:agricultare_weather_pests/Views/Forgot_Password/forgot_otp.dart';
import 'package:agricultare_weather_pests/style/CustomText/custom_back_button.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/constant/testfield.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/style/constant/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar:AppBar(
          leading: CircularBackButton(
            onPressed: (){
            print('AAAAAAAAAAAAAAAAA ddddddddddddd');
Navigator.of(context).push(
  MaterialPageRoute(builder: (context) =>  ForgotOtp())
);
          },),
),
      body: SingleChildScrollView(
        child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CustomText(text: MepaText.newPassword,customstyle:TextStyle(
                                            fontSize: 23.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',)),
            Padding(
                padding:  EdgeInsets.only(top: 30.h,right: 50.w),
        
        child: CustomText(
          text: MepaText.verificaionCodeText,
          textAlign: TextAlign.start,
          color: greyColor,
          maxlines: 2,
        ),
        
            ),
        Padding(
          padding:  EdgeInsets.only(top: 60.h,left: 40.w,right: 40.w),
          child: Column(
            children: [
             KlTextInputField(
  style: KlTextInputFieldStyle.password, // Set the style to password
  prefixIcon: Icon(Icons.lock, color: greyColor),
  padding: EdgeInsets.all(0),
  hintText: MepaText.confirmPassword,
  validator: (value) => KlValidators.logInPasswordValidator(value),
),
SizedBox(height: 20.h,),
   
          KlTextInputField(
  style: KlTextInputFieldStyle.password, // Set the style to password
  prefixIcon: Icon(Icons.lock, color: greyColor),
  padding: EdgeInsets.all(0),
  hintText: MepaText.confirmPassword,
  validator: (value) => KlValidators.logInPasswordValidator(value),
),

          SizedBox(height: 30.h,),
          
                                        // ! (((((((((((((())))))))))))))
          
           Align(
                          alignment: Alignment.center,
                           child: KlButton(
                                      style: KlButtonStyle.fullButton,
                                      borderRadius: BorderRadius.circular(30.r),
                                      label: MepaText.confirm,
                                      onPressed: () {
                                        Get.to(()=>SuccessScreen());
                                      }),
                         )  
                         
            ],
          ),
        ),
                   
        
            ])),
      )
    
    );
  }
}