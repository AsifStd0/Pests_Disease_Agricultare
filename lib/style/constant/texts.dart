import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ! UUUUUUUUUUUUUUUU

class KlTexts {
 static TextStyle customTextStyle(Color? color, double? size,FontWeight? fontweight) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: fontweight
    );
  }
// ! *****************
static TextStyle fieldName = TextStyle(
                                          fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
                                      );
                                      static TextStyle headlineLarge = TextStyle(
                                          fontSize: 20.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
                                      );
  // ! **************
  static TextStyle signIn = 
  TextStyle(color: whiteColor,fontSize: 18.sp,fontWeight: FontWeight.bold,fontFamily: 'Roboto');

 static TextStyle cameraStyle = TextStyle(color: whiteColor,fontSize: 22.sp,fontFamily: 'Roboto',fontWeight: FontWeight.bold);

  static TextStyle smallblack12 = TextStyle(color: blackColor, fontSize: 12.sp);

  static TextStyle simplewh16W = TextStyle(
      fontSize: 16.sp, color: whiteColor, 
      );
        static TextStyle simplewh16b = TextStyle(
      fontSize: 15.sp, color: blackColor, 
      );

        static TextStyle simple17b = TextStyle(
      fontSize: 17.sp, color: blackColor, 
      );

  static TextStyle normal16b = TextStyle(
      fontSize: 16.sp, color: Colors.black,);

  static TextStyle hd18b = TextStyle(
      color: Colors.black.withOpacity(0.7),
      fontSize: 18.sp,
      );
  static TextStyle  hd12b = TextStyle(
    // fontFamily: 'Inter',
    color: Colors.black,
    fontSize: 20.sp,
  );
  static TextStyle hd1SemiBold = TextStyle(
    // fontFamily: 'Inter',
    color: Colors.black,
    fontSize: 20.sp,
  );
  static TextStyle hd1Medium = TextStyle(
    // fontFamily: 'Inter',
    color: Colors.black,
    fontSize: 20.sp,
  );



    static TextStyle hd22 =  TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700);




  
}

CustomText lets_started() => CustomText(text: "Let's get started!",fontweight: FontWeight.w700,fontsize: 17.sp,);

// ! **************
// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String? text;
  TextStyle? customstyle;
  double? fontsize;
  FontWeight? fontweight;
  Color? color;
  String? fontFamily;
  TextAlign? textAlign;
  TextOverflow? overflow;
  int? maxlines;
  bool? softwrap;
  TextDecoration? decoration;
  CustomText({
    super.key,
    this.decoration,
    this.text,
    this.customstyle,
    this.overflow,
    this.fontsize,
    this.color,
    this.fontFamily,
    this.fontweight,
    this.textAlign, 
    this.maxlines,
    this.softwrap
  });

  @override
  Widget build(BuildContext context) {
    return Text("$text",
        textAlign: textAlign  ?? TextAlign.center,
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxlines,
        softWrap: softwrap,
        style: customstyle ??TextStyle(
          decoration: decoration,
                fontSize: fontsize ?? 16.sp,
                color: color ?? Colors.black,
            fontFamily: 'Roboto',
                fontWeight: fontweight ?? FontWeight.w400));
  }
}
