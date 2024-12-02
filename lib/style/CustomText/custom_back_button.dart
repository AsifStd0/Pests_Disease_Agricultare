// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final  IconData? icon;
  double? iconSize;

   CircularBackButton({
    Key? key,
    this.onPressed,
    this.icon,
     this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {
        // Check if there's any previous screen to go back to
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          // Optionally, you could display a message or perform another action
          print("No screen to go back to.");
        }
      },
      child: Padding(
        padding: EdgeInsets.only(top: 5.h, left: 18.w), // Adjust padding for icon size
        child: Container(
          decoration: BoxDecoration(
            color: mainColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon ??
            Icons.arrow_back,
            size:  iconSize,
            color: Colors.white, // Icon color
          ),
        ),
      ),
    );
  }
}

