import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/AboutUs/aboutUs.dart';
import 'package:agricultare_weather_pests/Views/ContactUs/contact_us.dart';
import 'package:agricultare_weather_pests/Views/EditProfile/editprofile_screen.dart';
import 'package:agricultare_weather_pests/Views/dialogs/custom_dialog.dart';
import 'package:agricultare_weather_pests/Views/education/education_screen.dart';
import 'package:agricultare_weather_pests/Views/history/history_main.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../login_screen.dart/login_provider.dart';
// class MenuWidget extends StatelessWidget {
//   List<IconData> listIcons = [
//     Icons.home,
//     Icons.person,
//     Icons.edit,
//     Icons.history,
//     Icons.cast_for_education,
//     Icons.logout,
//   ];

//   List menuData = [
//     "home".tr,
//     "aboutUs".tr,
//     "editProfile".tr,
//     "history".tr,
//     "education".tr,
//     "logout".tr,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body:
      
//        ListView.builder(
//         itemCount: menuData.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
//             child: GestureDetector(
//               onTap: () {
//                 print('$index  ${menuData.length}');
//                 if (index == menuData.length - 1) {
//                   showLogout(context); // Replace with your logout logic
//                 } else {
//                   navigateToScreen(index, context);
//                 }
//               },
//               child: Row(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: mainColor,
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(8.sp),
//                       child: Icon(listIcons[index], color: whiteColor, size: 22.sp),
//                     ),
//                   ),
//                   SizedBox(width: 10.w),
//                   Text(
//                     menuData[index],
//                     style: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void navigateToScreen(int index, BuildContext context) {
//     switch (index) {
//       case 0:
//         Get.offAll(() => HomeScreen());
//         break;
//       case 1:
//         Get.to(() => Aboutus());
//         break;
//       case 3:
//         Get.to(() => HistoryMain());
//         break;
//       case 4:
//         Get.to(() => EducationScreen());
//         break;
//       case 5:
//         Get.to(() => ContactUsPage());
//         break;
//       default:
//         break;
//     }
//   }

//   void showLogout(BuildContext context) {
//     // Implement logout logic here
//   }
// }

class MenuWidget extends StatelessWidget {
  List<IconData> listIcons = [
    Icons.home,
    Icons.person,
    Icons.edit,
    Icons.history,
    Icons.cast_for_education,
    Icons.logout,
  ];
  List menuData = [
  "home".tr,
  "aboutUs".tr,
  "editProfile".tr,
  "history".tr,
  "education".tr,
  "logout".tr
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: whiteColor,
        child: Consumer(
                builder: (context, LoginProvider provider, child) {
                  return ModalProgressHUD(
                    inAsyncCall: provider.state == ViewState.busy,
                    progressIndicator: CircularProgressIndicator(color: mainColor),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30.h,right: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                          GestureDetector(
                            onTap: () {
                                  Get.off(() => HomeScreen());
                            },
                            child: Icon(
                              Icons.highlight_remove_outlined,
                            ),
                          )
                        ],),
                      ),
     
  Padding(

    padding:  EdgeInsets.only(top: 10.h),
    child: ClipOval(
    child: Container(
      width: 130,
      height: 130, // Ensures the container is a square
      decoration: BoxDecoration(
        color: Colors.transparent, // Optional: Background color if needed
      ),
      child: Image.asset(
        MepaImage.splashLogo,
        fit: BoxFit.cover, // Ensures the image covers the container uniformly
      ),
    ),
    ),
  ),

                // Container(
                //   height: 100,
                //   width: double.infinity,
                //   color: mainColor,
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: CustomText(text:"pestDetection".tr,fontsize: 22.sp,color: whiteColor,fontweight: FontWeight.bold,)),
                // ),
                 Expanded(
                  child: ListView.builder(
                    itemCount: menuData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                        child: GestureDetector(
                          onTap: () {
                            print('$index  ${menuData.length}');
                            if(index == menuData.length-1){
        
                              // ! logout
                              showLogout(context,provider); 
                            }
                         else if (index == 0) {
        print('home');
        // Ensure progress is not blocking navigation
        if (provider.state != ViewState.busy) {
          Get.offAll(() => HomeScreen());
        }
          }
                              else  if (index == 1) {
                              print('About Us');
          
          
                              Get.to(()=>Aboutus());
                            }
                            else if(index == 2){
                              Get.to(()=> EditprofileScreen());
                            }
                            else  if (index == 3) {
                                                      print('HistoryScreen 111');
          
                              Get.to(()=>HistoryMain());
                            }
                              else  if (index == 4) {
                                                        print('No Screen');
                                                        Get.to(()=> EducationScreen());
                            }
          
                                 else  if (index == 5) {
                                                        print('ContactUsPage');
          
                              Get.to(()=>ContactUsPage());
                            }},
                          child:
                          
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: mainColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.sp),
                                  child: Icon(listIcons[index],color: whiteColor,size: 22.sp,),
                                )),
                                SizedBox(width: 10.w),
                              Text(
                                      menuData[index],
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        // fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black
                                      )
                                    ),
                            ],
                          )
                        )
                      );
                    }
                  )
                 )
              ]
              
              )
          
          );
          }
        ),
      ),
    );
  }
}
