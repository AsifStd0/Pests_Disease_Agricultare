import 'dart:developer';
import 'dart:io';

import 'package:agricultare_weather_pests/Model/base_view_model.dart';
import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/detectScreen/disease_Info_screen.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/disease_model.dart';
import 'package:agricultare_weather_pests/services/pickImage_api.dart';
import 'package:agricultare_weather_pests/style/dialogbox/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeProvider extends BaseViewModel {
  File? file;
  final ImagePicker picker = ImagePicker();

  Future<void> getImage(
      ImageSource source, BuildContext context, String disease) async {
    try {
      final pickedFile = await picker.pickImage(source: source);
      log('Image Picked: $pickedFile');
      if (pickedFile != null) {
        file = File(pickedFile.path);
        log('Picked image path: ${file!.path}');

        // Send image to the API and fetch response
         final DiseaseModel diseaseData = await fetchDiseaseData(file!);
      log('Fetched Disease Data: $diseaseData');

        if (context.mounted) {
          log('Navigating to appropriate screen');
          if (disease == 'disease') {
            // Navigate to DiseaseInfoScreen
            log('Navigating to DiseaseInfoScreen with disease data: $diseaseData');
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DiseaseInfoScreen(disease: diseaseData,pickedImagePath: file!.path)));}
          else if(disease == 'crops'){
          showCustomDialog(context, diseaseData,file!);
          }
        }
      } else {
        log('No file was picked.');
        showSnackBar(context, "noImageSelected".tr);
      }
    } catch (e) {
      log('Error picking image: $e');
      showSnackBar(context, "failedToPickImage".tr);
    }
    notifyListeners();
  }


void pickedImage(BuildContext context,String disease) {
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
            await getImage(ImageSource.gallery, Navigator.of(context).context,disease);
            setState(ViewState.idle);
          }
        ),
        ListTile(
          leading: const Icon(Icons.photo_camera),
          title:  Text("camera".tr),
          onTap: () async {
            setState(ViewState.busy);
           Navigator.of(modalContext).pop();
            await getImage(ImageSource.camera, Navigator.of(context).context,disease);
          setState(ViewState.idle);
          }
        )
      ]
    );
  }
);
}

}