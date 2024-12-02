// theme.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Define your custom theme
ThemeData appTheme() {
  return ThemeData(
    // Primary color used throughout the app
        scaffoldBackgroundColor: Colors.white, // Set the background color to white
       

    appBarTheme: AppBarTheme(
      color: Colors.white, // App bar color
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.transparent), // Hide default back icon color
    ),
    // AppBar theme
    // appBarTheme: AppBarTheme(
    //   color: mainColor,
    //   elevation: 0,
    //   iconTheme: IconThemeData(color: whiteColor,size: 26.sp),
    //   titleTextStyle: TextStyle(color: whiteColor, fontSize: 22.sp,fontWeight: FontWeight.bold,
    //   fontFamily: 'Roboto'
    //   )
    // ),

    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // backgroundColor: ,
        textStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      ),
    ),

    // TextButton theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue,
        textStyle: TextStyle(fontSize: 16.sp),
      ),
    ),

    // Checkbox theme
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(Colors.blue),
      checkColor: WidgetStateProperty.all(Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    ),

    // FloatingActionButton theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
    ),


    // TextFormField theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: Colors.blue),
      ),
      labelStyle: TextStyle(color: Colors.grey[700]),
      hintStyle: TextStyle(color: Colors.grey[500]),
    ),

    // Text Theme for different text styles
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 32.sp , fontWeight: FontWeight.bold, color: Colors.black),
      displayLarge: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600, color: Colors.black),
      headlineMedium: TextStyle(fontSize: 16.sp, color: Colors.black),
      headlineSmall: TextStyle(fontSize: 14.sp, color: Colors.black),
    ),

    // Icon Theme
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 36.sp,
    ),

 sliderTheme: SliderThemeData(
  activeTrackColor: Colors.blue,
  inactiveTrackColor: Colors.blue.withOpacity(0.5),
  thumbColor: Colors.blue,
  overlayColor: Colors.blue.withOpacity(0.1),
),
switchTheme: SwitchThemeData(
  trackColor: WidgetStateProperty.all(Colors.blue),
  thumbColor: WidgetStateProperty.all(Colors.white),
),

tabBarTheme: TabBarTheme(
  labelColor: Colors.blue,
  unselectedLabelColor: Colors.grey,
  indicatorSize: TabBarIndicatorSize.label,
  indicator: BoxDecoration(
    border: Border(
      bottom: BorderSide(color: Colors.blue, width: 2.w),
    ),
  ),
),


dialogTheme: DialogTheme(
  backgroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
  titleTextStyle: TextStyle(fontSize: 20.sp , fontWeight: FontWeight.bold),
  contentTextStyle: TextStyle(fontSize: 16.sp),
),


  );
}
