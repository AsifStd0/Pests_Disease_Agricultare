import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/Forgot_Password/forgot_otp.dart';
import 'package:agricultare_weather_pests/Views/login_screen.dart/login_provider.dart';
import 'package:agricultare_weather_pests/Views/login_screen.dart/login_screen.dart';
import 'package:agricultare_weather_pests/style/CustomText/custom_back_button.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/constant/testfield.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/style/constant/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ForgotScreen extends StatefulWidget {
   ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(       
         leading: CircularBackButton(onPressed: (){
            print('AAAAAAAAAAAAAAAAA ddddddddddddd');
Navigator.of(context).push(
  MaterialPageRoute(builder: (context) =>  Loginscreen())
);
          },),
),

         body: Consumer<LoginProvider>(
              builder: (context, model, child) =>
               Scaffold(
                  body: SingleChildScrollView(
                    child: ModalProgressHUD(
                        inAsyncCall: model.state == ViewState.busy,
                        child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //  Text('Enter your email to reset your password'),
                                    CustomText(text: "forgot".tr,customstyle:TextStyle(
                                            fontSize: 23.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',)),
                                    Padding(
                    padding:  EdgeInsets.only(top: 80.h,bottom: 90.h),
                    child: KlTextInputField(
                                  // controller: model.forgotemailController,
                                   validator: (value) =>KlValidators.emailValitador(value)
                    ),
                                    ),
                     Align(
                      alignment: Alignment.center,
                       child: KlButton(
                                  style: KlButtonStyle.fullButton,
                                  borderRadius: BorderRadius.circular(30.r),
                                  label: "sendemail".tr,
                                  onPressed: () {
                                    print('Clicked');
                                                        // if (formKey.currentState!.validate()) {
                                                                //  if (model.forgotemailController.text.isNotEmpty) {
                                                          // model.SignUp(context);
                                                          Get.offAll(()=>ForgotOtp());
                                                          // }
                                                          // else{
                                                          //  Get.snackbar(
                                                          //     "Error!",
                                                          //     "passidentical".tr,
                                                          //     backgroundColor:Colors.amber,
                                                          //     snackPosition:SnackPosition.BOTTOM);} }
                                                          }),
                     )  
                                  ]),
                              ))
                    ),
                  )))
    );
  }
}