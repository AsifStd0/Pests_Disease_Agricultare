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
  Future<void> addPickImage(ImageSource source, BuildContext context) async {
    final pickedFile = await addPicker.pickImage(source: source);
    if (pickedFile != null) {
      addFile = File(pickedFile.path);
      notifyListeners(); // Ensure UI updates
      log('Picked image path: ${addFile!.path}');
    } else {
      log('No image selected.');
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
              title: Text("gallery".tr),
              onTap: () async {
                Navigator.of(modalContext).pop();
                setState(ViewState.busy);
                await addPickImage(ImageSource.gallery, context);
                setState(ViewState.idle);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: Text("camera".tr),
              onTap: () async {
                Navigator.of(modalContext).pop();
                setState(ViewState.busy);
                await addPickImage(ImageSource.camera, context);
                setState(ViewState.idle);
              },
            ),
          ],
        );
      },
    );
  }


  void removeImage() {
    addFile = null;
    notifyListeners();
    log('✅ Image removed');
  }

  // Save Disease Data
  Future<void> saveDiseaseData() async {
    if (diseaseNameController.text.isEmpty ||
        diseaseDescriptionController.text.isEmpty ||
        remediesController.text.isEmpty ||
        weatherController.text.isEmpty ||
        addFile == null) {
      log('⚠ Please fill all fields and select an image');
      return;
    }

    setState(ViewState.busy);
    notifyListeners();

    try {
      var url = Uri.parse('https://testproject.famzhost.com/api/diseases');
      var request = http.MultipartRequest('POST', url);

      // Attach the image file
      request.files.add(await http.MultipartFile.fromPath('image', addFile!.path));

      // Attach other fields
      request.fields['disease_name'] = diseaseNameController.text;
      request.fields['disease_description'] = diseaseDescriptionController.text;
      request.fields['remedies'] = remediesController.text;
      request.fields['weather'] = weatherController.text;

      // Send request
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      log('Response: ${response.statusCode} - $responseString');

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('✅ Image uploaded successfully');
        Get.offAll(() => HomeScreen());
      } else {
        log('❌ Image upload failed: ${response.statusCode}');
      }
    } catch (e) {
      log('🚨 Error saving disease data: $e');
    }

    setState(ViewState.idle);
    notifyListeners();
  }
}