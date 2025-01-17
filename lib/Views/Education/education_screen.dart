import 'package:agricultare_weather_pests/Views/Education/education_detail.dart';
import 'package:agricultare_weather_pests/style/CustomText/custom_back_button.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {

  List<String> cropsName = [
    "maize".tr,
    "rice".tr,
    "cotton".tr,
    "sugarCane".tr,
    "jowar".tr,

// 'Maiz','Rice','Cotton','SugarCane','Jowar'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                    appBar:AppBar(
                      title: Text("crops".tr,),
                      centerTitle: true,
          leading: CircularBackButton(
            
            onPressed: (){
            print('AAAAAAAAAAAAAAAAA ddddddddddddd');
            Get.back();
// Navigator.of(context).push(
//   MaterialPageRoute(builder: (context) =>  ForgotOtp())
// );
          },),
),
      body:
      Expanded(
        child: ListView.builder(
          padding: EdgeInsets.only(left: 5.w,right: 30.w,top: 20.h),
          itemCount: 5,
          itemBuilder: (context,index){
          return InkWell(
            onTap: (){},
            child: Padding(
              padding:  EdgeInsets.only(top: 15.h),
              child: Row(children: [
                Image.asset(MepaImage.crop_2,width: 100.w,height: 80.h,),
                Expanded(child: Text(cropsName[index],style: TextStyle(fontSize:18.sp))),
                      CircularBackButton
                      (
                        iconSize: 29.sp,
                        onPressed: (){
                          
              Get.to(()=>EducationDetail());
                        },
                        icon: Icons.arrow_forward,),
                      
              ],),
            ),
          );
        }),
      )
      
    );
  }
}