class KlValidators {
//-------------------------------Name Validation--------------------------------
  static final String? Function(String?) emailValitador = (value) {
    if (value == null || value.isEmpty) {
                            return "Please enter your email address";
                          } else if (value.contains('@') &&
                              value.endsWith('.com')) {
                            return null;
                          }
                          return 'Invalid email address';
                        };

  static final String? Function(String?) logInPasswordValidator = (value) {
    if (value!.isEmpty || value.trim().isEmpty) {
      return 'Enter your password';
    }
    else if (value.length < 6) {
                              return ("Password Must be more than 5 characters");
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

  static final String? Function(String?) firstNameValidator = (firstName) {
    if (firstName!.isEmpty || firstName.trim().isEmpty) {
      return 'Enter Name';
    }
    return null;
  };
  

  static final String? Function(String?) secondNameValidator = (secondName) {
    if (secondName!.isEmpty || secondName.trim().isEmpty) {
      return 'Enter Last Name';
    }
    return null;
  };
  static final String? Function(String?) locationNameValidator = (firstName) {
    if (firstName!.isEmpty || firstName.trim().isEmpty) {
      return 'Enter Location';
    }
    return null;
  };
  static final String? Function(String?) phoneNumberValidator = (number) {
    if (number == null || number.isEmpty) {
      return 'Enter phone number';
    } else if (RegExp(r'[\[\]a-z ,_+={}";:<>?|~/\\)(*&^%$#@!`-]')
        .hasMatch(number)) {
      return 'Enter only numbers';
    } else if (number.trim().length < 11) {
      return "Phone number should be at least 11 digits long.";
    } else {
      return null;
    }
  };

  static final String? Function(String?) userNameValidator = (userName) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (userName != null) {
      if (userName.isEmpty || userName.trim().isEmpty) {
        return 'Enter Name';
      } else if (userName.length < 4) {
        return 'Username must be at least 4 characters long';
      } else if (userName.length >= 48) {
        return 'Username cannot be more than 47 characters long';
      } else if (!regex.hasMatch(userName)) {
        return 'Invalid characters in username. Please use only letters, numbers, and underscores.';
      } else {
        return null;
      }
    } else {
      return "Enter Username";
    }
  };
}