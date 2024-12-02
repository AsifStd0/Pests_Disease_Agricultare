import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum KlButtonStyle {
  login,
  fullButton,
  basicBigActive,
  basicBigInActive,
  basicSmallActive,
  basicSmallInactive,
  icon,
  camera,
  detect,
  sndmessage,
  continueBtn,
  skip,
  smallSkip
}

class KlButton extends StatelessWidget {
  final String label;
  final KlButtonStyle style;
  final GestureTapCallback? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;

  const KlButton({
    Key? key,
    this.label = "Button",
    this.style = KlButtonStyle.basicBigActive,
    this.onPressed,
    this.buttonColor,
    this.textColor,
    this.borderRadius,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height;
    final double width;
    Color bgColor = buttonColor ?? Colors.blue;
    Color txtColor = textColor ?? Colors.white;

    // Define size and colors based on button style
    switch (style) {
      case KlButtonStyle.login:
        height = 45.h;
        width = 180.w;
        bgColor = buttonColor ?? Colors.green;
        txtColor = textColor ?? Colors.white;
        break;
          case KlButtonStyle.fullButton:
        height = 43.h;
        width = double.infinity;
        bgColor = buttonColor ?? Colors.green;
        txtColor = textColor ?? Colors.white;
        break;
      case KlButtonStyle.basicBigActive:
        height = 40.h;
        width = 150.w;
        bgColor = buttonColor ?? Colors.blue;
        txtColor = textColor ?? Colors.white;
        break;
      case KlButtonStyle.basicBigInActive:
        height = 40.h;
        width = 150.w;
        bgColor = buttonColor ?? Colors.grey;
        txtColor = textColor ?? Colors.black;
        break;
      case KlButtonStyle.basicSmallActive:
        height = 32.h;
        width = 105.w;
        bgColor = buttonColor ?? Colors.blueAccent;
        txtColor = textColor ?? Colors.white;
        break;
      case KlButtonStyle.basicSmallInactive:
        height = 32.h;
        width = 105.w;
        bgColor = buttonColor ?? Colors.grey[300]!;
        txtColor = textColor ?? Colors.black54;
        break;
        case KlButtonStyle.smallSkip:
        
        height = 20.h;
        width = 60.w;
        bgColor = mainColor;
        txtColor = whiteColor;
        break;
      default:
        height = 40.h;
        width = 150.w;
    }

    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      constraints: BoxConstraints(minWidth: width, minHeight: height),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius ?? BorderRadius.circular(12.r),
          border: style == KlButtonStyle.basicBigInActive ? Border.all(color: Colors.black) : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: textStyle ??
              TextStyle(
                color: txtColor,
                fontSize: 16.sp,
              ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
