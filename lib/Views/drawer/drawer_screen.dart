import 'package:agricultare_weather_pests/Views/AboutUs/aboutUs.dart';
import 'package:agricultare_weather_pests/Views/ContactUs/contact_us.dart';
import 'package:agricultare_weather_pests/Views/dialogs/custom_dialog.dart';
import 'package:agricultare_weather_pests/Views/education/education_screen.dart';
import 'package:agricultare_weather_pests/Views/history/history_main.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    'Home',
    'About us',
    'Edit Profile',
    'History',
    'Education',
    'Logout'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.only(top: 50),
        child: Column(children: [
          // Padding(
          //     padding:  EdgeInsets.only(bottom: 10.h,top: 10.h,left: 20.h),
          //     child: Row(children: [
          //       CircleAvatar(
          //         radius: 30,
          //         backgroundColor: Colors.grey,
          //         child: Icon(Icons.person, size: 40, color: Colors.white),
          //       ),
          //       SizedBox(width: 10),
          //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //         Text("Name",
          //             style: TextStyle(
          //                 fontSize: 20.sp, fontWeight: FontWeight.bold)),
          //         SizedBox(height: 4),
          //         GestureDetector(
          //             onTap: () {
          //               Get.to(()=> EditprofileScreen());
          //             },
          //             child: Text("Edit",
          //                 style:
          //                     TextStyle(color: Colors.blue, fontSize: 14.sp)))
          //       ])
          //     ])),
          // Divider(),
          Container(
            height: 100,
            width: double.infinity,
            color: mainColor,
            child: Align(
              alignment: Alignment.center,
              child: CustomText(text: 'Pest Detection',fontsize: 22.sp,color: whiteColor,fontweight: FontWeight.bold,)),
          ),
          SizedBox(height: 60.h),
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
                        showLogout(context); 
                      }
                    else  if(index == 0 ){
                        print('home');

                        Get.to(()=>HomeScreen());
                      }
                        else  if (index == 1) {
                        print('About Us');


                        Get.to(()=>Aboutus());
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
                                  fontFamily: 'Roboto',
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
        ]));
  }
}
