import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/signup/signup_provider.dart';
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

// ignore: must_be_immutable
class ContactUsPage extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Specify the FormState type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("contactUs".tr),
        backgroundColor: Colors.green[700], // Customize AppBar color
      ),
  body: Consumer<SignupProvider>(
              builder: (context, model, child) => Scaffold(
                  body: ModalProgressHUD(
                      inAsyncCall: model.state == ViewState.busy,
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Form(
                                  key: formKey,
                                  child: Column(
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(top: 40.h,bottom: 20.h),
                                          child:Align(
                                            alignment: Alignment.center,
                                            child: CustomText(text: "contactUs".tr,fontsize: 26.sp,fontweight: FontWeight.bold,))
                                        ),
                                      
                                        CustomText(text: "name".tr),
                                        KlTextInputField(
                                          // controller: model.nameController,
                                            style:
                                                KlTextInputFieldStyle.firstName,
                                            validator: KlValidators.firstNameValidator),
                                        SizedBox(height: 20.h),
                                        CustomText(text: "email".tr),
                                        KlTextInputField(
                                          controller: model.emailController,
                                            validator: (value) =>KlValidators.emailValitador(
                                                    value)),
                                        SizedBox(height: 20.h),
                                         CustomText(text:"phone".tr),
                                        KlTextInputField(
                                          // controller: model.confirmpasswordController,
                                            style: KlTextInputFieldStyle.firstName,
                                            hintText:"enterPhone".tr,
                                            validator: (value) => KlValidators.logInPasswordValidator(value)),
                                        SizedBox(height: 20.h),
                                        CustomText(text: "location".tr),
                                        KlTextInputField(
                                          // controller: model.locationController,
                                            style: KlTextInputFieldStyle.firstName,
                                            hintText: "enterLocation".tr,
                                            validator: (value) => KlValidators.locationNameValidator(value)),
                                        SizedBox(height: 30.h),
                                        Align(
                                            alignment: Alignment.center,
                                            child: KlButton(
                            style: KlButtonStyle.sndmessage,
                            borderRadius: BorderRadius.circular(30.r),
                            label: "sendMessage".tr,
                            onPressed: () {
                                             Get.back();
                            })
                                             
                                 
                                        )
                                      ]
                                  )
                              )
                          )))))
    );
  }
}
