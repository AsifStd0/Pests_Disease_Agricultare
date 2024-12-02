import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:agricultare_weather_pests/Model/base_view_model.dart';
import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Model/userdata_model.dart';
import 'package:agricultare_weather_pests/Views/EditProfile/editprofile_screen.dart';
import 'package:agricultare_weather_pests/Views/signup/OtpScreen.dart';
import 'package:agricultare_weather_pests/services/api_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignupProvider extends BaseViewModel {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
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

  Future<void> SignUp(BuildContext context) async {
    setState(ViewState.busy); // Mark the state as busy

    // Validate the form
      String email = emailController.text;
      String password = passwordController.text;
      String firstName = firstNameController.text;
      String lastName = lastNameController.text;
      String image = getpath.toString();
      String location = locationController.text;
        UserDataModel user = UserDataModel(
    email: email,
    password: password,
    firstName: firstName,
    lastName: lastName,
    image: image,
    location: location,
  );
        // Save user data to Shared Preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user_data', json.encode(user.toJson()));

      // Navigate to the next screen
      Get.to(() => EditprofileScreen()); // Ensure UserDetailsScreen is defined
   



      await register(email,password,firstName,lastName);
      setState(ViewState.idle); 
      notifyListeners();
      
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('SignUp Successful')));
    setState(ViewState.idle); 
  }

  // !              **************
  getVerficationCode(

    BuildContext context,
    String phoneNumber,
  ) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: phoneNumber,
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Otpscreen(verificationId: verificationId,)),
    );
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);
  }
}
