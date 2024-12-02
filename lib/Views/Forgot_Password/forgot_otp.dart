import 'package:agricultare_weather_pests/Views/Forgot_Password/forgot_screen.dart';
import 'package:agricultare_weather_pests/Views/Forgot_Password/reset_password.dart';
import 'package:agricultare_weather_pests/style/CustomText/custom_back_button.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotOtp extends StatefulWidget {
  const ForgotOtp({super.key});

  @override
  State<ForgotOtp> createState() => _ForgotOtpState();
}

class _ForgotOtpState extends State<ForgotOtp> {
    TextEditingController snmController = TextEditingController();
  String? currentText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          leading: CircularBackButton(
            onPressed: (){
            print('AAAAAAAAAAAAAAAAA ddddddddddddd');
Navigator.of(context).push(
  MaterialPageRoute(builder: (context) =>  ForgotScreen())
);
          },),
),
body: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),

  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    CustomText(text: MepaText.verificaionCode,customstyle:TextStyle(
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
                      padding:  EdgeInsets.only(top: 30.h,right: 40.w,left: 40,bottom: 60.h),

        child: PinCodeTextField(
                            length: 4,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 45.h,
                                fieldWidth: 40.w,
                                activeFillColor: Colors.white,
                                inactiveColor: greyColor.withOpacity(0.5),
                                activeColor: greyColor.withOpacity(0.5),
                                selectedColor: mainColor),
                            animationDuration: Duration(milliseconds: 300),
                            backgroundColor: Colors.white,
                            enableActiveFill: false,
                            controller: snmController,
                            onCompleted: (v) {
                              print("Completed");
                            },
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                currentText = value;
                              });
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              return true;
                            },
                            appContext: context),
      ),
         Align(
                    alignment: Alignment.center,
                    
                    
                     child: KlButton(
                    onPressed: (){
                      Get.to(()=>ResetPassword());
                    },
                                style: KlButtonStyle.fullButton,
                    label: MepaText.confirm,

                     ),),
  ],),
),
    );
  }
}