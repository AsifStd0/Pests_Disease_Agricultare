
import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/drawer/drawer_screen.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/home_provider.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/snap_tips.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/shared_pref.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadLanguagePreference();
  }

  // Load language preference when the app starts
  void _loadLanguagePreference() async {
    final prefs = await SharedPreferences.getInstance(); // Get the instance asynchronously
    final languageCode = LocalStorageService(prefs).loadLanguage();
    if (languageCode != null && languageCode == 'ur') {
      isUrdu.value = true;
      Get.updateLocale(const Locale('ur', 'PK'));
    } else {
      isUrdu.value = false;
      Get.updateLocale(const Locale('en', 'US'));
    }
  }

  // final  _drawerKey = GlobalKey();
  List<String> images = [
    // MepaImage.home2,
    MepaImage.home3,
    MepaImage.home4,
  ];
  // List<String> listText = ["identifyDisease".tr,"snapTips".tr];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

            RxBool isUrdu = false.obs; // Reactive state for toggle.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    key: scaffoldKey,
        drawer: new MenuWidget(),
appBar: AppBar(
      leading:  GestureDetector(
        onTap: (){    scaffoldKey.currentState?.openDrawer();},
        child: Icon(Icons.menu, color: greyColor)),
      actions: [
        Container(child: 
               Obx(() {
            return Row(
              children: [
                Text(
                  "language_toggle".tr, // Dynamic language text
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Switch(
                  value: isUrdu.value,
                   onChanged: (value) async {
                      isUrdu.value = value;
                      // Save language preference
                      String languageCode = isUrdu.value ? 'ur' : 'en';
                          final prefs = await SharedPreferences.getInstance(); // Get the instance asynchronously

                      LocalStorageService(prefs)
                          .saveLanguage(languageCode);
                      // Update locale based on toggle value
                      if (isUrdu.value) {
                        Get.updateLocale(const Locale('ur', 'PK'));
                      } else {
                        Get.updateLocale(const Locale('en', 'US'));
                      }
                    },
                  // onChanged: (value) {
                  //   isUrdu.value = value;
                  //   // Update locale based on toggle value
                  //   if (isUrdu.value) {
                  //     Get.updateLocale(const Locale('ur', 'PK'));
                  //   } else {
                  //     Get.updateLocale(const Locale('en', 'US'));
                  //   }
                  // },
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.grey,
                ),
            ]);
    
        })      
                          
    ),
    ]),
        body: Consumer<HomeProvider>(builder: (context, provider, child) {
      return ModalProgressHUD(
          inAsyncCall: provider.state == ViewState.busy,
          // child: 
          
        //   SliderDrawer(
        //       key: _drawerKey,
        //       appBar: SliderAppBar(
        //           drawerIcon: IconButton(
        //               icon: Icon(Icons.menu, color: greyColor),
        //               onPressed: () {
        //                 _drawerKey.currentState?.toggle();
        //               }),
        //           appBarColor: whiteColor,
        //           title: Text("pests".tr,
        //               style: TextStyle(
        //                   color: blackColor,
        //                   fontSize: 24.sp,
        //                   fontWeight: FontWeight.w700,
        //                   fontFamily: 'Roboto')),
        //                   trailing:    
        //                       Obx(() {
        //     return Row(
        //       children: [
        //         Text(
        //           "language_toggle".tr, // Dynamic language text
        //           style: TextStyle(
        //             color: blackColor,
        //             fontSize: 16.sp,
        //             fontWeight: FontWeight.w500,
        //           ),
        //         ),
        //         Switch(
        //           value: isUrdu.value,
        //           onChanged: (value) {
        //             isUrdu.value = value;
        //             // Update locale based on toggle value
        //             if (isUrdu.value) {
        //               Get.updateLocale(const Locale('ur', 'PK'));
        //             } else {
        //               Get.updateLocale(const Locale('en', 'US'));
        //             }
        //           },
        //           activeColor: Colors.green,
        //           inactiveThumbColor: Colors.grey,
        //         ),
        //     ]);
    
        // })      
        //                   ),
        //       slider: MenuWidget(),
              child:
               Container(
                  color: whiteColor,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.h, top: 30.h, bottom: 60.h),
                          child: Image.asset(MepaImage.home1)),
                          Container(
                      height: 140.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Obx(() {
                        // Reactive data used here
       final listText = isUrdu.value
      ? ["snap_tips_urdu".tr, "identifyDiseaseHome_urdu".tr]  // Fetch different Urdu translations
      : ["identifyDiseaseHome".tr, "snapTips".tr];  // Fetch different English translations
    
                        return ListView.builder(
                          shrinkWrap: false,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: InkWell(
                                onTap: () {
                                  if (index == 0) {
                                    context
                                        .read<HomeProvider>()
                                        .pickedImage(context, 'disease');
                                  } else {
                                    Get.to(() => SnapTips());
                                  }
                                },
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        images[index],
                                        height: 80.h,
                                        width: 160.w,
                                      ),
                                      CustomText(text: listText[index]),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            // ),
          );
        }),
      );
  }
}
                        // Container(
                        //     height: 140.h,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(20.r)),
                        //     child: ListView.builder(
                        //         shrinkWrap: false,
                        //         physics: BouncingScrollPhysics(),
                        //         scrollDirection: Axis.horizontal,
                        //         itemCount: images.length,
                        //         itemBuilder: (context, index) {
                        //           return Padding(
                        //               padding: EdgeInsets.only(left: 5.w),
                        //               child: InkWell(
                        //                   onTap: () {
                        //                     // provider.pickedImage(context);
                        //                     // if(index ==0){
                                              
                        //                     //   provider.pickedImage(context,'crops');
                        //                     // }
                        //                     // else
                        //                      if(index == 0){
                        //                                   context.read<HomeProvider>().pickedImage(context, 'disease');
                        //                       // provider.pickedImage(context,'disease');
                        //                     }
                        //                     else{
                        //                     Get.to(() => SnapTips());
                        //                     }
                        //                   },
                        //                   child: Card(
                        //                       elevation: 5,
                        //                       child: Column(children: [
                        //                         Image.asset(
                        //                           images[index],
                        //                           height: 80.h,
                        //                           width: 160.w),
                        //                         CustomText(text: listText[index])]))));}))]))));})));}}
