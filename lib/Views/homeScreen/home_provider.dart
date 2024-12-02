import 'dart:developer';
import 'dart:io';

import 'package:agricultare_weather_pests/Model/base_view_model.dart';
import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/detectScreen/disease_Info_screen.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/disease_model.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class HomeProvider extends BaseViewModel {
  File? file;
  final ImagePicker picker = ImagePicker();
Future<void> getImage(ImageSource source, BuildContext context,String disease) async {
 try {
    final pickedFile = await picker.pickImage(source: source);
    log('Image Picked: $pickedFile');
    if (pickedFile != null) {
      file = File(pickedFile.path);
      log('Picked image path: ${file!.path}');

      final fetchedDisease = await fetchDiseaseData();
      log('Fetched Disease Data: ${fetchedDisease.diseaseName}');

      if (context.mounted) {
        log('Navigating to appropriate screen');
        if (disease == 'disease') {

          log('Disease calling ${disease}');
          // Navigate to DiseaseInfoScreen
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DiseaseInfoScreen(
                disease: fetchedDisease,
                pickedImagePath: file!.path,
              ),
            ),
          );
        }

         else if(disease == 'crops') {
          log('crops calling');
          // Show custom dialog for "crops"
// Get.to(()=>TestPage());
// showGeneralDialog(
//         context: context,
//         barrierDismissible: true,
//         barrierLabel:
//             MaterialLocalizations.of(context).modalBarrierDismissLabel,
//         barrierColor: Colors.black45,
//         transitionDuration: const Duration(milliseconds: 200),
//         pageBuilder: (BuildContext buildContext, Animation animation,
//             Animation secondaryAnimation) {
//           return Center(
//             child: Container(
//               width: MediaQuery.of(context).size.width - 10,
//               height: MediaQuery.of(context).size.height - 80,
//               padding: EdgeInsets.all(20),
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text(
//                       "Save",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     // color: const Color(0xFF1BC0C5),
//                   )
//                 ],
//               ),
//             ),
//           );
//         });

//  showModalBottomSheet(
// ! ************
// showDialog(
//             context: context,
//             barrierDismissible: true, // Prevent closing by tapping outside
//             builder: (BuildContext context) {
//               return Dialog(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.r),
//                 ),
//                 child: Container(
//                   padding:  EdgeInsets.all(5.r),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(10.r),
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Align(
//                         alignment: Alignment.topRight,
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).pop(); // Close the dialog
//                           },
//                           child: Padding(
//                             padding:  EdgeInsets.only(right: 15.w),
//                             child: Image.asset(MepaImage.round_circle,width: 25.w,height: 25.h),
//                           ),
//                         ),
//                       ),
//                        SizedBox(height: 3.h),
//                       Row(
//                           crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top of the row

//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(20.r),
//                             child: Image.file(
//                               file!,
//                               height: 120.h,
//                               width: 100.w,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                            SizedBox(width: 5.w),
//                             Flexible(
//       child: Text(
//         'Small plants, like succulents and air plants, are perfect for adding greenery to your desk or your nightstand.',
//         overflow: TextOverflow.visible,
//         softWrap: true,
//         style: TextStyle(
//           fontSize: 14.sp,
//           color: Colors.black54,
//         ),
//       ),),
//                         ],
//                       ),
//                       SizedBox(height: 5.h),
//                     ],
//                   ),
//                 )
                // ! ****************
 showGeneralDialog(
  context: context,
  barrierDismissible: true,
  barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  barrierColor: Colors.black45,
  transitionDuration: const Duration(milliseconds: 200),
  pageBuilder: (BuildContext buildContext, Animation animation,
      Animation secondaryAnimation) {
    return Align( // Align dialog to center or adjust as needed
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent, // Ensure background stays transparent
        child: Container(
                    width: MediaQuery.of(context).size.width * 0.9, // Adjust width
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.9, // Limit max height
          ),
          decoration: BoxDecoration(
            // color: Color(0xff756E6E),

              gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff40363933), // #36393340
        Color(0xff756E6E), // #1F1F1F80
      ],
    ),

            borderRadius: BorderRadius.all(Radius.circular(20.r)),

          ),
          padding: EdgeInsets.all(15.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close Button
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(), // Close dialog
                  child: Image.asset(
                    MepaImage.round_circle,
                    width: 23.w,
                    height: 23.h,
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              // Row: Image and Text
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.file(
                      file!, // Replace with your image path
                      height: 120.h,
                      width: 100.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Flexible(
                    child: Text(
                      'Small plants, like succulents and air plants, are perfec Small plants, like succulents and air plants, are perfec',
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  },
);


         }

      } else {
        log('Context is not mounted. Cannot navigate.');
      }
    } else {
      log('No file was picked.');



    }
  } catch (e) {
    log('Error picking image: $e');
    if (context.mounted) {
      showSnackBar(context, 'Failed to pick image.');
    }
  }
  notifyListeners();
}

void showSnackBar(BuildContext context, String text) {
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }
}


  Future<Disease> fetchDiseaseData() async {
    log('message  call api');
    // Simulating an API call with static data
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return Disease(
      image: "https://firebasestorage.googleapis.com/v0/b/agricultaremarket.appspot.com/o/1729771921103.jpg?alt=media&token=8b2d22a5-cebf-4c70-9e67-4ca395d1bd33",
      diseaseName: "Blight",
      symptoms: "Leaves turn yellow and develop brown, irregular spots; plant wilts in severe cases.Leaves turn yellow and develop brown, irregular spots; plant wilts in severe cases",
      causedBy: "Fungal infection caused by Alternaria solani or Phytophthora infestans. Leaves turn yellow and develop brown, irregular spots; plant wilts in severe cases Leaves turn yellow and develop brown, irregular spots; plant wilts in severe cases",
      cure: "Apply fungicides containing copper or mancozeb to affected plants.  Leaves turn yellow and develop brown, irregular spots; plant wilts in severe cases Leaves turn yellow and develop brown, irregular spots; plant wilts in severe casesLeaves turn yellow and develop brown, irregular spots; plant wilts in severe cases",
      prevent: "Use crop varieties resistant to blight, practice crop rotation, and avoid overhead watering.  Leaves turn yellow and develop brown, irregular spots; plant wilts in severe casesLeaves turn yellow and develop brown, irregular spots; plant wilts in severe casesLeaves turn yellow and develop brown, irregular spots; plant wilts in severe cases",
    );
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

          //  if( disease == 'disease')
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
