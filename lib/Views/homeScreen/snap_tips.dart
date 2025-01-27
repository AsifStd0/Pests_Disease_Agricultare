import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SnapTips extends StatefulWidget {
  const SnapTips({super.key});

  @override
  State<SnapTips> createState() => _SnapTipsState();
}

class _SnapTipsState extends State<SnapTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100.h, bottom: 30.h),
                child: CustomText(
                  text: "snapTips".tr,
                  fontsize: 28.sp,
                  fontFamily: 'Roboto',
                  fontweight: FontWeight.w600)),
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    color: greyColor,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(MepaImage.leaf),
                    ))),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: greyColor,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(MepaImage.too_close),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(
                          text: "tooClose".tr,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: greyColor,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(MepaImage.too_far),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(text: "tooFar".tr)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: greyColor,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    MepaImage.multiple,
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(
                          text: "multipleSpecies".tr,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 60.h, top: 30.h),
                child: KlButton(
                  style: KlButtonStyle.detect,
                  buttonColor: mainColor,
                  borderRadius: BorderRadius.circular(30.r),
                  label: "continueTxt".tr,
                  onPressed: () => Get.offAll(() => HomeScreen()),
                ),
              ),
            ],
          ),
        ));
  }
}
