import 'dart:developer';
import 'dart:io';

import 'package:agricultare_weather_pests/Model/base_view_model.dart';
import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
class AddDataProvider extends BaseViewModel{

TextEditingController diseaseNameController = TextEditingController();
TextEditingController diseaseDescriptionController = TextEditingController();
TextEditingController remediesController = TextEditingController();
TextEditingController weatherController = TextEditingController();


// !  ********************

  File? addFile;
  final ImagePicker addPicker = ImagePicker();

// Pick image from gallery or camera
addPickImage(ImageSource source, BuildContext context,) async {
  
      final pickedFile = await addPicker.pickImage(source: source);
      log('Image Picked: $pickedFile');
      if (pickedFile != null) {
        addFile = File(pickedFile.path);
        log('Picked image path: ${addFile!.path}');
}
}


void addPickedImage(BuildContext context) {
showModalBottomSheet(
  context: context,
  builder: (BuildContext modalContext) {
    return Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.photo_library),
          title:  Text("gallery".tr),
          onTap: () async {
            setState(ViewState.busy);
            Navigator.of(modalContext).pop();
            await addPickImage(ImageSource.gallery, Navigator.of(context).context);
            setState(ViewState.idle);
          }
        ),
        ListTile(
          leading: const Icon(Icons.photo_camera),
          title:  Text("camera".tr),
          onTap: () async {
            setState(ViewState.busy);
           Navigator.of(modalContext).pop();
            await addPickImage(ImageSource.camera, Navigator.of(context).context);
          setState(ViewState.idle);
          }
        )
      ]
    );
  }
);
}
removeImage() {
  addFile = null;
  notifyListeners();
  }
// ! ***********************************
Future<void> saveDiseaseData() async {
  setState(ViewState.busy);
  try {
    if (addFile != null) {
      var url = Uri.parse('http://ai-pest.kpitb.online/api/plants/data');
      var request = http.MultipartRequest('POST', url);

      // Attach the image file
      request.files.add(await http.MultipartFile.fromPath('image', addFile!.path));

      // Attach other fields
      request.fields['name'] = diseaseNameController.text;
      request.fields['diseaseDescription'] = diseaseDescriptionController.text;
      request.fields['remedies'] = remediesController.text;
      request.fields['weather'] = weatherController.text;

      // Send request
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      log('Response: ${response.statusCode} - $responseString');

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('✅ Image uploaded successfully');
        setState(ViewState.idle);
        Get.offAll(() => HomeScreen());
      } else {
        log('❌ Image upload failed: ${response.statusCode}');
      }
    } else {
      log('⚠ No image selected');
    }
  } catch (e) {
    log('🚨 Error saving disease data: $e');
  }
  setState(ViewState.idle);
}
}