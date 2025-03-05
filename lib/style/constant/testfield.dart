import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum KlTextInputFieldStyle {
  email, password, phoneNumber, firstName, userName, dropDown, select, address, city,
  zipCode, cvv, search, diseaseDescription, remedies, Weather, fieldIconLocation,diseaseName
}

class KlTextInputField extends StatefulWidget {
  final KlTextInputFieldStyle style;
  final String? hintText;
  final TextInputType? keyBoardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function()? suffixOntap;
  final TextEditingController? controller;
  final bool readOnly;
  final String? initialValue;
  final bool showCursor;
  final void Function()? ontap;
  final Color? hintTextColor;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? focusedBorderColor;
  final Color? enableBorderColor;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  void Function()? fetchLocation;

  KlTextInputField({
    Key? key,
    this.fetchLocation,
    this.style = KlTextInputFieldStyle.email,
    this.hintText,
    this.padding,
    this.keyBoardType,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.suffixOntap,
    this.controller,
    this.readOnly = false,
    this.showCursor = true,
    this.initialValue,
    this.ontap,
    this.hintTextColor,
    this.hintTextStyle,
    this.textStyle,
    this.fillColor,
    this.focusedBorderColor,
    this.enableBorderColor,
    this.onChanged,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    this.contentPadding,
  }) : super(key: key);

  @override
  _KlTextInputFieldState createState() => _KlTextInputFieldState();
}

class _KlTextInputFieldState extends State<KlTextInputField> {
  bool _isHidden = true;

  TextInputType get keyboardType {
    switch (widget.style) {
      case KlTextInputFieldStyle.email:
        return TextInputType.emailAddress;
      case KlTextInputFieldStyle.password:
        return TextInputType.visiblePassword;
      case KlTextInputFieldStyle.phoneNumber:
        return TextInputType.phone;
      default:
        return widget.keyBoardType ?? TextInputType.text;
    }
  }

  Widget? get suffixIcon {
    if (widget.style == KlTextInputFieldStyle.password) {
      return InkWell(
        onTap: () {
          setState(() {
            _isHidden = !_isHidden;
          });
        },
        child: _isHidden
            ? Icon(Icons.visibility_off, color: Color(0xff707070), size: 20.sp)
            : Icon(Icons.visibility, color: Color(0xff707070), size: 20.sp),
      );
    } else if (widget.style == KlTextInputFieldStyle.fieldIconLocation) {
      return InkWell(
        onTap: widget.fetchLocation,
        child: Icon(Icons.location_on, color: mainColor, size: 24.sp),
      );
    }
    return widget.suffixIcon;
  }

  // Future<void> fetchLocation() async {
  //   print('Clicked');
  //   // Simulated fetching of location (Replace with actual location service)
  //   await Future.delayed(Duration(seconds: 2));
  //   String mockLocation = "Latitude: 24.8607, Longitude: 67.0011"; // Example location

  //   if (widget.controller != null) {
  //     setState(() {
  //       widget.controller!.text = mockLocation;
  //       print('$mockLocation -------------------------');
  //     });
  //   }
  // }

  String get hintText {
    switch (widget.style) {
      case KlTextInputFieldStyle.email:
        return widget.hintText ?? "enterEmail".tr; 
          case KlTextInputFieldStyle.password:
        return widget.hintText ?? "password".tr;   
        case KlTextInputFieldStyle.phoneNumber:
        return widget.hintText ?? "enterPhone".tr;   
        case KlTextInputFieldStyle.firstName:
        return widget.hintText ??"enterName".tr;   
        case KlTextInputFieldStyle.userName:
        return widget.hintText ?? "enterUsername".tr;   
        case KlTextInputFieldStyle.dropDown:
        return widget.hintText ?? "selectDate".tr;   
        case KlTextInputFieldStyle.select:
        return widget.hintText ?? "selectOption".tr; 

        case KlTextInputFieldStyle.search:
        return widget.hintText ?? "search".tr; 

 case KlTextInputFieldStyle.diseaseDescription:
        return widget.hintText ?? "enterdiseaseDescription".tr; 

        case KlTextInputFieldStyle.diseaseName:
        return widget.hintText ?? "enterDiseaseName".tr;

         case KlTextInputFieldStyle.remedies:
        return widget.hintText ?? "enterreamedies".tr; 

         case KlTextInputFieldStyle.Weather:
        return widget.hintText ?? "enterWeather".tr; 
        case KlTextInputFieldStyle.fieldIconLocation:
        return widget.hintText ?? "enterLocation".tr;
        

          default:
        return widget.hintText ?? "enterText".tr; 
        
        
          }
  }

  bool get isObscure {
    if (widget.style == KlTextInputFieldStyle.password) return _isHidden;
    return widget.obscureText;
  }

  InputDecoration get inputDecoration => InputDecoration(
        filled: true,
        fillColor: widget.fillColor ?? Colors.white,
        hintText: hintText,
        hintStyle: widget.hintTextStyle ??
            TextStyle(color: widget.hintTextColor ?? Colors.grey),
        prefixIcon: widget.prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(vertical: 13.h, horizontal: 13.w),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 40.w),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        obscureText: isObscure,
        readOnly: widget.style == KlTextInputFieldStyle.fieldIconLocation || widget.readOnly,
        showCursor: widget.showCursor,
        initialValue: widget.initialValue,
        onTap: widget.ontap,
        onChanged: widget.onChanged,
        validator: widget.validator,
        controller: widget.controller,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: widget.focusNode,
        cursorColor: Color(0xff707070),
        decoration: inputDecoration,
      ),
    );
  }
}

// enum KlTextInputFieldStyle {email,password,phoneNumber,firstName,userName,dropDown,select,address,city,
// zipCode,cvv,search, diseaseDescription, reamedies, Weather,
// fieldIconLocation

// }

// class KlTextInputField extends StatefulWidget {
//   final KlTextInputFieldStyle style;
//   final String? hintText;
//   final TextInputType? keyBoardType;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final String? Function(String?)? validator;
//   final bool obscureText;
//   final void Function()? suffixOntap;
//   final TextEditingController? controller;
//   final bool readOnly;
//   final String? initialValue;
//   final bool showCursor;
//   final void Function()? ontap;
//   final Color? hintTextColor;
//   final TextStyle? hintTextStyle;
//   final TextStyle? textStyle;
//   final Color? fillColor;
//   final Color? focusedBorderColor;
//   final Color? enableBorderColor;
//   final void Function(String)? onChanged;
//   final TextInputAction? textInputAction;
//   final FocusNode? focusNode;
//   final Function(String)? onFieldSubmitted;
//   final EdgeInsets? contentPadding;
//   final EdgeInsets? padding;

//   KlTextInputField({
//     Key? key,this.style = KlTextInputFieldStyle.email,this.hintText,this.padding,this.keyBoardType,
//     this.suffixIcon,this.prefixIcon,this.validator,this.obscureText = false,this.suffixOntap,this.controller,this.readOnly = false,this.showCursor = true,this.initialValue,this.ontap,this.hintTextColor,this.hintTextStyle,this.textStyle,this.fillColor,this.focusedBorderColor,this.enableBorderColor,this.onChanged,this.textInputAction,this.focusNode,this.onFieldSubmitted,this.contentPadding,}) : super(key: key);

//   @override
//   _KlTextInputFieldState createState() => _KlTextInputFieldState();
// }

// class _KlTextInputFieldState extends State<KlTextInputField> {
//   bool _isHidden = true;

//   TextInputType get keyboardType {
//     switch (widget.style) {
//       case KlTextInputFieldStyle.email:return TextInputType.emailAddress;

//       case KlTextInputFieldStyle.password:return TextInputType.visiblePassword;
//       case KlTextInputFieldStyle.phoneNumber:return TextInputType.phone;
//       case KlTextInputFieldStyle.firstName:
//       case KlTextInputFieldStyle.userName:
//       case KlTextInputFieldStyle.dropDown:
//       case KlTextInputFieldStyle.select:
//       case KlTextInputFieldStyle.address:
//       case KlTextInputFieldStyle.city:
//       case KlTextInputFieldStyle.zipCode:
//       case KlTextInputFieldStyle.cvv:
//       case KlTextInputFieldStyle.search:
//       case KlTextInputFieldStyle.diseaseDescription:
//       case KlTextInputFieldStyle.reamedies:
//       case KlTextInputFieldStyle.Weather:
//       case KlTextInputFieldStyle.fieldIconLocation:

//       // default:
//       return widget.keyBoardType ?? TextInputType.text;
//     }
//   }

//   Widget? get suffixIcon {
//     if (widget.style == KlTextInputFieldStyle.password) {
//       return InkWell(
//         onTap:
//          () {
//           setState(() {
//             _isHidden = !_isHidden;
//           });
//         },
//         child: _isHidden
//             ? Icon(Icons.visibility_off, color: Color(0xff707070), size: 20)
//             : Icon(Icons.visibility, color: Color(0xff707070), size: 20),
//       );
//     }
//     return widget.suffixIcon;
//   }

//   String get hintText {
//     switch (widget.style) {
//       case KlTextInputFieldStyle.email:
//         return widget.hintText ?? "enterEmail".tr; 
//           case KlTextInputFieldStyle.password:
//         return widget.hintText ?? "password".tr;   
//         case KlTextInputFieldStyle.phoneNumber:
//         return widget.hintText ?? "enterPhone".tr;   
//         case KlTextInputFieldStyle.firstName:
//         return widget.hintText ??"enterName".tr;   
//         case KlTextInputFieldStyle.userName:
//         return widget.hintText ?? "enterUsername".tr;   
//         case KlTextInputFieldStyle.dropDown:
//         return widget.hintText ?? "selectDate".tr;   
//         case KlTextInputFieldStyle.select:
//         return widget.hintText ?? "selectOption".tr; 

//         case KlTextInputFieldStyle.search:
//         return widget.hintText ?? "search".tr; 

//  case KlTextInputFieldStyle.diseaseDescription:
//         return widget.hintText ?? "enterdiseaseDescription".tr; 

//          case KlTextInputFieldStyle.reamedies:
//         return widget.hintText ?? "enterreamedies".tr; 

//          case KlTextInputFieldStyle.Weather:
//         return widget.hintText ?? "enterWeather".tr; 
//         case KlTextInputFieldStyle.fieldIconLocation:
//         return widget.hintText ?? "enterLocation".tr;


//           default:
//         return widget.hintText ?? "enterText".tr; 
        
        
//           }
//   }

//   bool get isObscure {
//     if (widget.style == KlTextInputFieldStyle.password) return _isHidden;
//     return widget.obscureText;
//   }

//   InputDecoration get inputDecoration => InputDecoration(
//         filled: true,
//         fillColor: widget.fillColor ?? Colors.white,
//         hintText: hintText,
//         hintStyle: widget.hintTextStyle ?? TextStyle(color: widget.hintTextColor ?? Colors.grey),
//         prefixIcon: widget.prefixIcon,
//         suffixIcon: suffixIcon,
//         contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(vertical: 13.h, horizontal: 13.w),
//          // Using underline for focused and enabled borders
//       focusedBorder: UnderlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey), // Change color for focused state
//       ),
//       enabledBorder: UnderlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey), // Change color for enabled state
//       ),
//       disabledBorder: UnderlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey[300]!), // Change color for disabled state
//       ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 40.w),
//       child: TextFormField(
//         autovalidateMode: AutovalidateMode.onUserInteraction,keyboardType: keyboardType,obscureText: isObscure,
//         readOnly: widget.readOnly,showCursor: widget.showCursor,initialValue: widget.initialValue,onTap: widget.ontap,
//         onChanged: widget.onChanged,validator: widget.validator,controller: widget.controller,
        
//         textInputAction: widget.textInputAction ?? TextInputAction.next,onFieldSubmitted: widget.onFieldSubmitted,
//         focusNode: widget.focusNode,cursorColor: Color(0xff707070),decoration: inputDecoration,),
//     );
//   }
// }

