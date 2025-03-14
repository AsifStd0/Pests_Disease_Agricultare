import 'dart:developer';
import 'dart:io';

import 'package:agricultare_weather_pests/Views/detectScreen/display_screen.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/disease_model.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/dialogbox/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DiseaseInfoScreen extends StatefulWidget {
  final DiseaseModel disease;
  final String pickedImagePath;
  DiseaseInfoScreen({
    Key? key,
    required this.disease,
    required this.pickedImagePath,
  }) : super(key: key);

  @override
  _DiseaseInfoScreenState createState() => _DiseaseInfoScreenState();
}

class _DiseaseInfoScreenState extends State<DiseaseInfoScreen> {
  String feedback = ""; // Stores user feedback

  @override
  Widget build(BuildContext context) {
    log('New Screen');
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenImageViewer(
                              imagePath: widget.pickedImagePath),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      child: ClipOval(
                        child: widget.pickedImagePath.isNotEmpty
                            ? Image.file(
                                File(widget.pickedImagePath),
                                fit: BoxFit.cover,
                              )
                            : Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
               if (widget.disease.predictedClass != "unknown" &&
    widget.disease.treatment != "No treatment information available." &&
    widget.disease.precautions != "No precautions information available.") ...[
                  buildInfoRow(
                      'predictedDisease'.tr, widget.disease.predictedClass),
                  buildInfoRow('treatment'.tr, widget.disease.treatment),
                  buildInfoRow('precaution'.tr, widget.disease.precautions),
                ] else
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 100.h),
                      child: Text(
                        "noData".tr,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                SizedBox(height: 40.h),

               if (widget.disease.predictedClass != "unknown" &&
    widget.disease.treatment != "No treatment information available." &&
    widget.disease.precautions != "No precautions information available.") ...[
                Center(
                  child: Column(
                    children: [
                      Text(
                        "feedback".tr,
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.thumb_up,
                                  color: Colors.green, size: 30),
                              onPressed: () {
                                setState(() {
                                  feedback = "Relevant";
                                });
                                CustomSnackbar.showCustomSnackBarData(
                                    context, "relevant".tr);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.thumb_down,
                                  color: Colors.red, size: 30),
                              onPressed: () {
                                setState(() {
                                  feedback = "Irrelevant";
                                });
                                CustomSnackbar.showCustomSnackBarData(
                                    context, "irrelevant".tr);
                              },
                            ),
                          ]),
                    ],
                  ),
                ),
                        ],
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            KlButton(
              onPressed: () => Get.offAll(() => HomeScreen()),
              style: KlButtonStyle.camera,
              label: 'done'.tr,
              buttonColor: mainColor,
            ),
              if (widget.disease.predictedClass != "unknown" &&
    widget.disease.treatment != "No treatment information available." &&
    widget.disease.precautions != "No precautions information available.") 
            KlButton(
              onPressed: () => Get.offAll(() => HomeScreen()),
              style: KlButtonStyle.camera,
              label: 'save'.tr,
              buttonColor: mainColor,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build text rows
  Widget buildInfoRow(String label, String info) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 7.w),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: TextStyle(fontSize: 17.sp, color: Colors.black),
          children: [
            TextSpan(
              text: "$label : ",
              style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                  color: mainColor),
            ),
            TextSpan(text: info, style: TextStyle(fontSize: 17.sp)),
          ],
        ),
      ),
    );
  }
}
