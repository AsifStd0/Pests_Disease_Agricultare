import 'dart:developer';

import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/AboutUs/aboutUs.dart';
import 'package:agricultare_weather_pests/Views/dialogs/custom_dialog.dart';
import 'package:agricultare_weather_pests/Views/education/education_screen.dart';
import 'package:agricultare_weather_pests/Views/history/history_main.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_screen.dart/login_provider.dart';
class MenuWidget extends StatelessWidget {
  final List<IconData> allIcons = [
    Icons.home,
    Icons.person,
    // Icons.edit,
    Icons.history,
    Icons.cast_for_education,
    Icons.logout,
  ];

  final List allMenuData = [
    "home".tr,
    "aboutUs".tr,
    // "editProfile".tr,
    "history".tr,
    "education".tr,
    "logout".tr,
  ];


  Future<List<Map<String, dynamic>>> getFilteredMenuData() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? userId = prefs.getString('user_id');

    List<Map<String, dynamic>> menuList = [];
    for (int i = 0; i < allMenuData.length; i++) {
      // if (userId == null && (i == 2 || i == 4 )) {
        // Skip Edit Profile, History, and Logout if ID is null
      //   continue;
      // }
      menuList.add({'title': allMenuData[i], 'icon': allIcons[i]});
    }
    return menuList;
  }
  // Future<List<Map<String, dynamic>>> getFilteredMenuData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userId = prefs.getString('user_id');

  //   List<Map<String, dynamic>> menuList = [];
  //   for (int i = 0; i < allMenuData.length; i++) {
  //     if (userId == null && (i == 2 || i == 4 )) {
  //       // Skip Edit Profile, History, and Logout if ID is null
  //       continue;
  //     }
  //     menuList.add({'title': allMenuData[i], 'icon': allIcons[i]});
  //   }
  //   return menuList;
  // }

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
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: getFilteredMenuData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError || !snapshot.hasData) {
                    return Center(child: Text("Error loading menu"));
                  }

                  final menuList = snapshot.data!;

                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30.h, right: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                log('Close Drawer');
          Navigator.of(context).pop(); 
          Get.off(() => HomeScreen());
                                     },
                              child: Icon(Icons.highlight_remove_outlined,color: mainColor,),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: ClipOval(
                          child: Container(
                            width: 150.w,
                            height: 130.h,
                            child: Image.asset(
                              MepaImage.splashLogo,
                              fit: BoxFit.cover)))),
                      Expanded(
                        child: ListView.builder(
                          itemCount: menuList.length,
                          itemBuilder: (context, index) {
                            final item = menuList[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 25.w),
                              child: GestureDetector(
                                onTap: () {
                                  switch (index) {
                                    case 0:
                                      Get.offAll(() => HomeScreen());
                                      break;
                                    case 1:
                                      Get.to(() => Aboutus());
                                      break;
                                    case 2:
                                      Get.to(() => HistoryMain());
                                      break;
                                    case 3:
                                      Get.to(() => EducationScreen());
                                      break;
                                    case 4:
                                      showLogout(context, provider);
                                      break;
                                  }
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: mainColor),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.sp),
                                        child: Icon(
                                          item['icon'],
                                          color: whiteColor,
                                          size: 22.sp))),
                                    SizedBox(width: 10.w),
                                    Text(
                                      item['title'],
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black))])));
                          }))]);
                }));
          })));
  }
}