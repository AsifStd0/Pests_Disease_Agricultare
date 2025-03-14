import 'package:agricultare_weather_pests/Views/login_screen.dart/login_provider.dart';
import 'package:agricultare_weather_pests/Views/login_screen.dart/login_screen.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

showLogout(BuildContext context,LoginProvider provider) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: CustomText(
          text: 'Configuration'.tr,
          fontsize: 20.sp,
          fontweight: FontWeight.w600,
        ),
        content: CustomText(
          text: "logout_confirmation".tr,
          fontsize: 18.sp,
          textAlign: TextAlign.start,
          overflow: TextOverflow.visible,
        ),
        actions: [
          TextButton(
            child: CustomText(
              text: 'cancel'.tr,
              fontweight: FontWeight.w700,
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: CustomText(
              text: 'logout'.tr,
              color: colorBlue,
              fontweight: FontWeight.w700,
            ),
            onPressed: () async {
                            Navigator.of(context).pop(); 
             SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('isLoggedIn');
  await prefs.remove('user_id');

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('User Successfull Logout'),
                    ),
                  );
                            Get.offAll(() => Loginscreen());
              // provider.logoutApi(context);
           
            },
          ),
        ],
      );
    },
  );
}


// showLogout(context){
//         showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: CustomText(text: 'Configration',  fontsize: 20.sp,
//                     fontweight: FontWeight.w600,),
                    
//                     content: CustomText(text:'Are you sure you want to Logout ?',
//                     fontsize: 18.sp,
//                     textAlign: TextAlign.start,
//                     overflow: TextOverflow.visible),
//                     actions: [
//                       TextButton(
//                         child: CustomText(text: 'Cancel', fontweight: FontWeight.w700,),
//                         onPressed: () {
//                           // Get.back(); // Close the dialog
//                           Navigator.of(context).pop();
//                         }
//                       ),
//                       TextButton(
//                         child: CustomText( text:'Logout',color: colorBlue, fontweight: FontWeight.w700),
//                         onPressed: () {
//                          Get.to(()=>Loginscreen());})]);});
// }