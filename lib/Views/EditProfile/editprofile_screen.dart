import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/EditProfile/editprofile_provider.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/constant/testfield.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/style/constant/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

// class EditprofileScreen extends StatefulWidget {
//   @override
//   State<EditprofileScreen> createState() => _EditprofileScreenState();
// }

// class _EditprofileScreenState extends State<EditprofileScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<EditprofileProvider>(context, listen: false).loadUserData();
//   }
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();


//   @override
//   Widget build(BuildContext context) {
    
//     return SafeArea(
//       child: Scaffold(
//           appBar: AppBar(
//               title: Text('editProfile'.tr,style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.bold),),
//               centerTitle: true),
//           body: Consumer<EditprofileProvider>(
//               builder: (context, model, child) => Scaffold(
//                   body: ModalProgressHUD(
//                       inAsyncCall: model.state == ViewState.busy,
//                       child: SingleChildScrollView(
//                           child: Padding(
//                               padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 60.h),
//                               child: Form(
//                                   key: formKey,
//                                   child: Column(
//                                       crossAxisAlignment:CrossAxisAlignment.start,
//                                       children: [
//                                         CustomText(text: "firstname".tr,customstyle:KlTexts.fieldName),
//                                         KlTextInputField(
//                                           controller: model.firstNameControllerEdit,
//                                             style:KlTextInputFieldStyle.firstName,
//                                             validator: KlValidators.firstNameValidator),
//                                         SizedBox(height: 10.h),
                                         
                                         
//                                              CustomText(text: "lastname".tr,customstyle:KlTexts.fieldName),
//                                         KlTextInputField(
//                                           controller: model.lastNameControllerEdit,
//                                             style:KlTextInputFieldStyle.firstName,
//                                             validator: KlValidators.firstNameValidator),


//                                         SizedBox(height: 10.h),
//                                         CustomText(text: "email".tr,customstyle:KlTexts.fieldName),
//                                         KlTextInputField(
//                                           controller: model.emailController,
//                                             validator: (value) =>KlValidators.emailValitador(
//                                                     value)),
//                                         SizedBox(height: 10.h),
//                                         CustomText(text: "password".tr,customstyle:KlTexts.fieldName),
//                                         KlTextInputField(
//                                           controller: model.passwordControllerEdit,
//                                             style: KlTextInputFieldStyle.password,
//                                             validator: (value) => KlValidators.logInPasswordValidator(value)),
//                                         SizedBox(height: 10.h),
//                                         CustomText(text: "reenterPassword".tr,customstyle:KlTexts.fieldName),
//                                         KlTextInputField(
//                                           controller: model.confirmpasswordControllerEdit,
//                                             style: KlTextInputFieldStyle.password,
//                                             hintText: "reenterPassword".tr,
//                                             validator: (value) => KlValidators.logInPasswordValidator(value)),
//                                              SizedBox(height: 30.h),
//                                         Align(
//                                             alignment: Alignment.center,
//                                             child: 
//                                              KlButton(
//                                          style: KlButtonStyle.detect,
//                                                 borderRadius: BorderRadius.circular(30.r),
//                                                 label: 'Save',
//                                                   onPressed: () {
//                                                   if (formKey.currentState!.validate()) {
//                                                            if (model.passwordControllerEdit.text == model.confirmpasswordControllerEdit.text) {
//                                                     model.editprofile(context);
//                                                     }
//                                                     else{
//                                                      Get.snackbar(
//                                                         "Error!",
//                                                         "Passwords must be identical",
//                                                         backgroundColor:Colors.amber,
//                                                         snackPosition:SnackPosition.BOTTOM);
                                                     
//                                                     }
//                                                   }
//                             })
// )
      
//                                       ]))))))))
//     );
//   }
// }
