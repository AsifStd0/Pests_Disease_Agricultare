
import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/drawer/drawer_screen.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/home_provider.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<SliderDrawerState> _drawerKey = GlobalKey<SliderDrawerState>();
  List<String> images = [
    MepaImage.home2,
    MepaImage.home3,
    MepaImage.home4,
  ];
  List<String> listText = [
    'Identify Crops',
    'Identify Disease',
    'Snap Tips',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: Consumer<HomeProvider>(builder: (context, provider, child) {
      return ModalProgressHUD(
          inAsyncCall: provider.state == ViewState.busy,
          child: SliderDrawer(
              key: _drawerKey,
              appBar: SliderAppBar(
                  drawerIcon: IconButton(
                      icon: Icon(Icons.menu, color: greyColor),
                      onPressed: () {
                        _drawerKey.currentState?.toggle();
                      }),
                  appBarColor: whiteColor,
                  title: Text(MepaText.pests,
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto'))),
              slider: MenuWidget(),
              child: Container(
                  color: whiteColor,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.h, top: 30.h, bottom: 60.h),
                          child: Image.asset(MepaImage.home1),
                        ),
                        Container(
                            height: 140.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r)
                            ),
                            child: ListView.builder(
                                shrinkWrap: false,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: images.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: EdgeInsets.only(left: 5.w),
                                      child: InkWell(
                                          onTap: () {
                                            // provider.pickedImage(context);
                                            if(index ==0){
                                              
                                              provider.pickedImage(context,'crops');
                                            }
                                            else if(index == 1){
                                              provider.pickedImage(context,'disease');
                                            }
                                            else{
                                            //   Disease
                                            // Get.to(() => DiseaseInfoScreen());
                                            }
                                          },
                                          child: Card(
                                              elevation: 5,
                                              child: Column(children: [
                                                Image.asset(
                                                  images[index],
                                                  height: 80.h,
                                                  width: 160.w,
                                                ),
                                                CustomText(
                                                    text: listText[index])
                                              ]))));
                                }))
                      ]))));
    })));
  }
}
