import 'package:agricultare_weather_pests/style/CustomText/custom_back_button.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryMain extends StatefulWidget {
  const HistoryMain({super.key});

  @override
  State<HistoryMain> createState() => _HistoryMainState();
}

class _HistoryMainState extends State<HistoryMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pest Detection'),
          centerTitle: true,
          leading: CircularBackButton(
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Column(children: [
          Image.asset(MepaImage.detect),
          Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        child: Padding(
                            padding: EdgeInsets.all(12.w),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                        CustomText(
                                            text: 'Hoya carnosa tricolor',
                                            fontsize: 18.sp,
                                            fontweight: FontWeight.w700,
                                            color: blackColor),
                                        Text(MepaText.dummy,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.grey[800]),
                                            softWrap: true)
                                      ])),
                                  // Image Section
                                  SizedBox(
                                      width: 8
                                          .w), // Add spacing between text and image
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: Image.asset(MepaImage.flower,
                                          height: 75.h,
                                          width: 80.w,
                                          fit: BoxFit.cover))
                                ])));
                  }))
        ]));
  }
}
