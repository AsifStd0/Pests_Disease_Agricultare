import 'dart:developer';
import 'dart:io';

import 'package:agricultare_weather_pests/Views/detectScreen/display_screen.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/disease_model.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





class DiseaseInfoScreen extends StatelessWidget {
  final DiseaseModel disease;
  final String pickedImagePath;
   DiseaseInfoScreen({
    Key? key,
    required this.disease,
   required this.pickedImagePath,
  }) : super(key: key);

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
                  child:   GestureDetector(
                    onTap: () {
                     Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImageViewer(imagePath: pickedImagePath),
              ),
            );
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      child: ClipOval(
                        child: pickedImagePath != null
                          ? Image.file(
                              File(pickedImagePath),
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.error)
                    )
                    ),
                  )
                ),
                SizedBox(height: 20.h),
            if (disease.predictedClass.isNotEmpty) ...[
                buildInfoRow('Predicted Disease : ', disease.predictedClass),
                buildInfoRow('Treatment : ', disease.treatment),
                buildInfoRow('Confidence : ', disease.confidence),
                buildInfoRow('Precaution : ', disease.precautions),
              ] else
                 Center(
                  child: Text(
                    'No Data Found',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton:   Align(
          alignment: Alignment.bottomCenter,
          child: KlButton(
             onPressed: () => Navigator.pop(context),
           style: KlButtonStyle.camera,
           label: 'Done',
           buttonColor: mainColor,
          ),
        )
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
        style: TextStyle(fontSize: 17.sp, color: Colors.black), // Default text style
        children: [
          TextSpan(
            text: label,
            style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold,color: mainColor), // Label style
          ),
          TextSpan(
            text: info,
            style: TextStyle(fontSize: 17.sp), 
          ),
        ],
      ),
    ),
  );
}

}

// class DiseaseInfoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding:  EdgeInsets.only(top: 20.h,right: 10.w,left: 10.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: 250, 
//                 height: 250,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.asset(
//                     'assets/images/info.png', // Replace with your image path
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
              
//               // Disease Information
//               buildInfoRow('Disease name:', '-------------------'),
//               buildInfoRow('Symptoms:', '-------------------'),
//               buildInfoRow('Caused by:', '-------------------'),
//               buildInfoRow('Cure:', '-------------------'),
//               buildInfoRow('Prevent Now:', '-------------------'),
              
//               SizedBox(height: 30),
              
//               // Edit and Done buttons
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10.w),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                        KlButton(
//                          style: KlButtonStyle.detect,
//                          borderRadius: BorderRadius.circular(30.r),
//                          label: MepaText.edit,
//                          onPressed: ()=>Get.to(()=>HomeScreen()),),
//                                KlButton(
//                                  style: KlButtonStyle.detect,
//                                  borderRadius: BorderRadius.circular(30.r),
//                                  label: MepaText.done,
//                                  onPressed: ()=>Get.to(()=>HomeScreen()))
//                    ]
//                 )
//               )
//             ]
//           )
//         )
//       )
//     );
//   }

//   // Helper method to build text rows
//   Widget buildInfoRow(String label, String info) {
//     return Padding(
//       padding:  EdgeInsets.symmetric(vertical: 12.h,horizontal: 10.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           Text(info, style: TextStyle(fontSize: 18)),
//         ],
//       ),
//     );
//   }
// }


