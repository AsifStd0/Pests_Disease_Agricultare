import 'dart:io';

import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/EditProfile/editprofile_provider.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
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

class EditprofileScreen extends StatefulWidget {
  @override
  State<EditprofileScreen> createState() => _EditprofileScreenState();
}

class _EditprofileScreenState extends State<EditprofileScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<EditprofileProvider>(context, listen: false).loadUserData();
  }
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: Text('editProfile'.tr),
              centerTitle: true),
          body: Consumer<EditprofileProvider>(
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
                                        Row(mainAxisAlignment:MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 90.h,
                                                  width: 100.w,
                                                  decoration: BoxDecoration(color: greyliteColor, shape: BoxShape.circle),
                                                  child: InkWell(
                                                      onTap: () =>model.pickImage(),
                                                      child:
                                                       model.getpath != null
                                                          ? ClipOval(
                                                              child: Image.file(
                                                                  model.getpath!))
                                                          :
                                                          model.imgName != null ?
                                          ClipOval(child: Image.file(File(model.imgName!))) : 
                                                          
                                                           Icon(Icons.camera_alt)))
                                            ]),
                                        CustomText(text: "firstname".tr,customstyle:KlTexts.fieldName),
                                        KlTextInputField(
                                          controller: model.firstNameController,
                                            style:KlTextInputFieldStyle.firstName,
                                            validator: KlValidators.firstNameValidator),
                                        SizedBox(height: 10.h),
                                         
                                         
                                             CustomText(text: "lastname".tr,customstyle:KlTexts.fieldName),
                                        KlTextInputField(
                                          controller: model.lastNameController,
                                            style:KlTextInputFieldStyle.firstName,
                                            validator: KlValidators.firstNameValidator),


                                        SizedBox(height: 10.h),
                                        CustomText(text: "email".tr,customstyle:KlTexts.fieldName),
                                        KlTextInputField(
                                          controller: model.emailController,
                                            validator: (value) =>KlValidators.emailValitador(
                                                    value)),
                                        SizedBox(height: 10.h),
                                        CustomText(text: "password".tr,customstyle:KlTexts.fieldName),
                                        KlTextInputField(
                                          controller: model.passwordController,
                                            style: KlTextInputFieldStyle.password,
                                            validator: (value) => KlValidators.logInPasswordValidator(value)),
                                        SizedBox(height: 10.h),
                                        CustomText(text: "reenterPassword".tr,customstyle:KlTexts.fieldName),
                                        KlTextInputField(
                                          controller: model.confirmpasswordController,
                                            style: KlTextInputFieldStyle.password,
                                            hintText: "reenterPassword".tr,
                                            validator: (value) => KlValidators.logInPasswordValidator(value)),
                                        SizedBox(height: 10.h),
                                        CustomText(text: "location".tr,customstyle:KlTexts.fieldName),
                                        KlTextInputField(
                                          controller: model.locationController,
                                            style: KlTextInputFieldStyle.firstName,
                                            hintText: "enterLocation".tr,
                                            validator: (value) => KlValidators.locationNameValidator(value)),
                                        SizedBox(height: 30.h),
                                        Align(
                                            alignment: Alignment.center,
                                            child: 
                                             KlButton(
                                         style: KlButtonStyle.detect,
                                                borderRadius: BorderRadius.circular(30.r),
                                                label: 'Save',
                                                  onPressed: () {
                                                  if (formKey.currentState!.validate()) {
                                                           if (model.passwordController.text == model.confirmpasswordController.text) {
                                                    model.SignUp(context);
                                                    }
                                                    else{
                                                     Get.snackbar(
                                                        "Error!",
                                                        "Passwords must be identical",
                                                        backgroundColor:Colors.amber,
                                                        snackPosition:SnackPosition.BOTTOM);
                                                     
                                                    }
                                                  }
                            })
)
      
                                      ]))))))))
    );
  }
}
