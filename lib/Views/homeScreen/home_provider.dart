import 'dart:developer';
import 'dart:io';

import 'package:agricultare_weather_pests/Model/base_view_model.dart';
import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/detectScreen/disease_Info_screen.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/disease_model.dart';
import 'package:agricultare_weather_pests/services/pickImage_api.dart';
import 'package:agricultare_weather_pests/style/dialogbox/custom_dialog.dart';
import 'package:flutter/material.dart';
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
              MaterialPageRoute(
                builder: (context) => DiseaseInfoScreen(
                  disease: diseaseData,
                  pickedImagePath: file!.path,
                ),
              ),
            );
          }
          else if(disease == 'crops'){
          showCustomDialog(context, diseaseData,file!);
          }
        }
      } else {
        log('No file was picked.');
        showSnackBar(context, 'No image selected.');
      }
    } catch (e) {
      log('Error picking image: $e');
      showSnackBar(context, 'Failed to pick image.');
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
          title: const Text('Photo Library'),
          onTap: () async {
            setState(ViewState.busy);
          //  if( disease == 'disease')
            Navigator.of(modalContext).pop();
            await getImage(ImageSource.gallery, Navigator.of(context).context,disease);
            setState(ViewState.idle);
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo_camera),
          title: const Text('Camera'),
          onTap: () async {
            setState(ViewState.busy);
           Navigator.of(modalContext).pop();
            await getImage(ImageSource.camera, Navigator.of(context).context,disease);

          setState(ViewState.idle);
          },
        ),
      ],
    );
  },
);
}

}
// class HomeProvider extends BaseViewModel {
//   File? file;
//   final ImagePicker picker = ImagePicker();

//   Future<void> getImage(ImageSource source, BuildContext context, String disease) async {
//     try {
//       final pickedFile = await picker.pickImage(source: source);
//       log('Image Picked: $pickedFile');
//       if (pickedFile != null) {
//         file = File(pickedFile.path);
//         log('Picked image path: ${file!.path}');

//         // Upload the image after picking it
//         final uploadResponse = await uploadImage(file!);

//         if (uploadResponse) {
//           log('Image uploaded successfully.');
//         } else {
//           log('Image upload failed.');
//         }

//         // Rest of your disease-related logic remains the same
//         if (context.mounted) {
//           if (disease == 'disease') {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => DiseaseInfoScreen(
//                   disease:  fetchDiseaseData(),
//                   pickedImagePath: file!.path,
//                 ),
//               ),
//             );
//           } else if (disease == 'crops') {
//             // Show dialog logic remains unchanged
//           }
//         } else {
//           log('Context is not mounted. Cannot navigate.');
//         }
//       } else {
//         log('No file was picked.');
//       }
//     } catch (e) {
//       log('Error picking image: $e');
//       if (context.mounted) {
//         showSnackBar(context, 'Failed to pick image.');
//       }
//     }
//     notifyListeners();
//   }

//   Future<bool> uploadImage(File imageFile) async {
//     try {
//       Dio dio = Dio();
//       String url = "https://your-api-endpoint.com/upload"; // Replace with your API endpoint
      
//       FormData formData = FormData.fromMap({
//         "file": await MultipartFile.fromFile(
//           imageFile.path,
//           filename: imageFile.path.split('/').last,
//         ),
//       });

//       Response response = await dio.post(
//         url,
//         data: formData,
//         options: Options(headers: {
//           "Authorization": "Bearer YOUR_API_TOKEN", // Replace with your authorization token if required
//         }),
//       );

//       if (response.statusCode == 200) {
//         log('Image upload response: ${response.data}');
//         return true;
//       } else {
//         log('Failed to upload image. Status code: ${response.statusCode}');
//         return false;
//       }
//     } catch (e) {
//       log('Error uploading image: $e');
//       return false;
//     }
//   }

//   void showSnackBar(BuildContext context, String text) {
//     if (context.mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(text)),
//       );
//     }
//   }

//   // Future<Disease>
//    fetchDiseaseData() async {
//     // Your existing logic for fetching disease data
//     return Disease(
//       image: "https://example.com/disease.jpg",
//       diseaseName: "Blight",
//       symptoms: "Symptoms here...",
//       causedBy: "Causes here...",
//       cure: "Cure here...",
//       prevent: "Prevention here...",
//     );
//   }

//   void pickedImage(BuildContext context, String disease) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext modalContext) {
//         return Wrap(
//           children: [
//             ListTile(
//               leading: const Icon(Icons.photo_library),
//               title: const Text('Photo Library'),
//               onTap: () async {
//                 Navigator.of(modalContext).pop();
//                 await getImage(ImageSource.gallery, context, disease);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.photo_camera),
//               title: const Text('Camera'),
//               onTap: () async {
//                 Navigator.of(modalContext).pop();
//                 await getImage(ImageSource.camera, context, disease);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
