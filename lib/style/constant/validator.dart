import 'package:get/get_utils/src/extensions/internacionalization.dart';

class KlValidators {
//-------------------------------Name Validation--------------------------------
  static final String? Function(String?) emailValitador = (value) {
    if (value == null || value.isEmpty) {
                            return "enterValidEmail".tr;
                          } else if (value.contains('@') &&
                              value.endsWith('.com')) {
                            return null;
                          }
                          return 'invalidEmail'.tr;
                        };

  static final String? Function(String?) logInPasswordValidator = (value) {
    if (value!.isEmpty || value.trim().isEmpty) {
      return 'enterValidPassword'.tr;
    }
    else if (value.length < 6) {
                              return ("invalidPassword".tr);
                            }
     else {
      return null;
    }
  };
  //  if (value == null || value.isEmpty) {
  //                           return "Please enter your password";
  //                         } else {
  //                           RegExp regex = RegExp(
  //                               r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{6,}$');
  //                           var passNonNullValue = value;
  //                           if (passNonNullValue.isEmpty) {
  //                             return ("Password is required");
                            // } else if (passNonNullValue.length < 6) {
                            //   return ("Password Must be more than 5 characters");
                            // } else if (!regex.hasMatch(passNonNullValue)) {
  //                             return ("Invalid Password");
  //                           }
  //                           return null;
  //                         }
  //                       },

  static final String? Function(String?) firstNameValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return 'enterName'.tr;
    }
    return null;
  };
    static final String? Function(String?) diseaseNameValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return 'enterDiseaseName'.tr;
    }
    return null;
  };

  static final String? Function(String?) descriptionValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return 'enterdiseaseDescription'.tr;
    }
    return null;
  };

  static final String? Function(String?) remediesValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return 'enterreamedies'.tr;
    }
    return null;
  };

  static final String? Function(String?) weatherValidator = (value) {
    if (value == null || value.trim().isEmpty) {
      return 'enterWeather'.tr;
    }
    return null;
  };

  

  static final String? Function(String?) secondNameValidator = (secondName) {
    if (secondName!.isEmpty || secondName.trim().isEmpty) {
      return 'enterlastName'.tr;
    }
    return null;
  };
  static final String? Function(String?) locationNameValidator = (firstName) {
    if (firstName!.isEmpty || firstName.trim().isEmpty) {
      return 'enterLocation'.tr;
    }
    return null;
  };
  // static final String? Function(String?) phoneNumberValidator = (number) {
  //   if (number == null || number.isEmpty) {
  //     return 'enterPhone'.tr;
  //   } else if (RegExp(r'[\[\]a-z ,_+={}";:<>?|~/\\)(*&^%$#@!`-]')
  //       .hasMatch(number)) {
  //     return 'enterOnlyNumber';
  //   } else if (number.trim().length < 11) {
  //     return "Phone number should be at least 11 digits long.";
  //   } else {
  //     return null;
  //   }
  // };

  // static final String? Function(String?) userNameValidator = (userName) {
  //   RegExp regex = RegExp(r'^[a-zA-Z0-9_]+$');
  //   if (userName != null) {
  //     if (userName.isEmpty || userName.trim().isEmpty) {
  //       return 'enterName'.tr;
  //     } else if (userName.length < 4) {
  //       return 'Username must be at least 4 characters long';
  //     } else if (userName.length >= 48) {
  //       return 'Username cannot be more than 47 characters long';
  //     } else if (!regex.hasMatch(userName)) {
  //       return 'Invalid characters in username. Please use only letters, numbers, and underscores.';
  //     } else {
  //       return null;
  //     }
  //   } else {
  //     return "Enter Username";
  //   }
  // };
}