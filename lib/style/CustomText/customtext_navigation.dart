import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/gestures.dart';

class CustomTextWithNavigation extends StatelessWidget {
  final String questionText;
  final String actionText;
  final Widget navigateToScreen;

  CustomTextWithNavigation({
    required this.questionText,
    required this.actionText,
    required this.navigateToScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 50.h),
      child: Align(
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 16.sp, color: Colors.black), 
            children: [
              TextSpan(
                text: questionText,
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600)
              ),
              TextSpan(
                text: actionText,
                style: TextStyle(
                  color: mainColor, 
                  fontWeight: FontWeight.bold
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => navigateToScreen)
                    );
                  }
              )
            ]
          )
        )
      )
    );
  }
}


Widget home_button(String label, Function()? onPressed) {
  return Padding(
    padding:  EdgeInsets.only(top: 20.h),
    child: KlButton(
      label: label,
      // style: KlButtonStyle.homeBtn,
      // butttonColor: colorDarkblue,
      // textstyle: TextStyle(
      //   fontSize: 22.sp,
      //   fontWeight: FontWeight.bold,
      //   color: whiteColor,
      // ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      onPressed: onPressed,
    ),
  );
}



class CustomTextLum extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final Function()? onTap;

  const CustomTextLum(
      {Key? key,
      required this.text,
      this.color,
      this.fontSize = 16.0,
      this.fontWeight,
      this.fontStyle,
      this.fontFamily,
      this.textAlign = TextAlign.left,
      this.overflow = TextOverflow.ellipsis,
      this.maxLines,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text.toString(),
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
        ),
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
      ),
    );
  }
}
