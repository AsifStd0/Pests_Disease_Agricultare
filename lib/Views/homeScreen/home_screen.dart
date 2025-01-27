
import 'dart:math';

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
    RxBool isUrdu = false.obs; // Reactive state for language toggle.

  @override
  void initState() {
    super.initState();
    _loadLanguagePreference();
  }

  void _loadLanguagePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = LocalStorageService(prefs).loadLanguage();
    print('Language loaded: $languageCode');  // Debugging

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    key: scaffoldKey,
        drawer: new MenuWidget(),
appBar: AppBar(
      leading:  GestureDetector(
        onTap: (){    scaffoldKey.currentState?.openDrawer();},
        child: Icon(Icons.menu, color: greyColor)),
        // centerTitle: true,
        title:  Text("pests".tr,style: TextStyle(color: blackColor,fontSize: 16.sp,
                          fontWeight: FontWeight.w700,fontFamily: 'Roboto')),
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
                  trackColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return mainColor;
    }
    return mainColor;
  }),

                  thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return Colors.orange;
    }
    return Colors.orange;
  }),
                  onChanged: (value) async {
  // Update the value of the language toggle
  isUrdu.value = value;

  // Determine the language code based on the toggle value
  String languageCode = isUrdu.value ? 'ur' : 'en';

  // Get the SharedPreferences instance
  final prefs = await SharedPreferences.getInstance();
  LocalStorageService storageService = LocalStorageService(prefs);

  // Save the language preference
  await storageService.saveLanguage(languageCode);

  // Log the saved language for debugging
  print("Language saved: $languageCode");

  // Update the app locale based on the selected language
  if (isUrdu.value) {
    Get.updateLocale(const Locale('ur', 'PK'));
  } else {
    Get.updateLocale(const Locale('en', 'US'));
  }
},
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
      ? ["identifyDiseaseHome_urdu".tr, "snap_tips_urdu".tr]  // Fetch different Urdu translations
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
                                    context.read<HomeProvider>().pickedImage(context, 'disease');
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
                                      CustomText(text: listText[index])]
                                  ))));
                          });}))])));}));}}
                       