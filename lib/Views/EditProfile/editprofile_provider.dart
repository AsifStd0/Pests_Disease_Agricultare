import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:agricultare_weather_pests/Model/base_view_model.dart';
import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Model/userdata_model.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EditprofileProvider extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  String? imgName;

  
  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('user_data');
    print("$userData");
    
    UserDataModel user = UserDataModel.fromJson(json.decode(userData.toString()));
    print('${user.image.runtimeType} ${user.image}');
    // Populate the text controllers with user data
    emailController.text = user.email.toString();
    passwordController.text = user.password.toString(); // Assuming this is a String
    firstNameController.text = user.firstName.toString();
    lastNameController.text = user.lastName.toString();
    locationController.text = user.location.toString();
    imgName = user.image;
      notifyListeners(); // Notify listeners to rebuild UI if necessary
  }

//   Future<UserDataModel?> loadUserData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? userData = prefs.getString('user_data');
//   print("${userData}"  );
//   if (userData != null) {
//     return UserDataModel.fromJson(json.decode(userData));
//   }
//   return null; 
// }
// // ! ***************

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController locationController = TextEditingController();
File? pickfile ;
  ImagePicker imagePicker = ImagePicker();
   File? getpath ;

pickImage() async {
  setState(ViewState.busy);

  try {
    // Pick image from the gallery
    final pickImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickImage == null) {
      log('image is null $pickImage');
      setState(ViewState.idle);
      return; // Return early if no image is selected
    }

    pickfile = File(pickImage.path);
    log('image picked path: ${pickfile!.path}');

    // Crop the image
    final croper = await ImageCropper().cropImage(
      sourcePath: pickfile!.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      maxHeight: 512,
      maxWidth: 512,
    );

    // If user cancels cropping, use the picked image
    if (croper == null) {
      log('Cropping canceled, using the picked image.');
      getpath = pickfile; // Use the picked image if cropping is skipped
    } else {
      getpath = File(croper.path); // Use the cropped image
    }

    log('Image path for upload: ${getpath!.path}');
  } catch (e) {
    log('Error picking or cropping image: $e');
  }
  //   final response = await FirebaseStorage.instance.ref('pickImage/${DateTime.now().millisecondsSinceEpoch}').putFile(getpath);
  //  String? getUrl = await response.ref.getDownloadURL();
  //  log('get url  $getUrl');
  setState(ViewState.idle);
  notifyListeners();
}

  void SignUp(BuildContext context) {
    setState(ViewState.busy); // Mark the state as busy

    // Validate the form
      String email = emailController.text;
      String password = passwordController.text;
      log('Email: $email, Password: $password');
      
      // Show success message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Successful Edit')));

    setState(ViewState.idle); // Mark the state as idle
  }
}
