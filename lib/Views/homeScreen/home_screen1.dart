
// import 'package:agricultare_weather_pests/Model/enum.dart';
// import 'package:agricultare_weather_pests/Views/add_crops/add_crops.dart';
// import 'package:agricultare_weather_pests/Views/homeScreen/home_provider.dart';
// import 'package:agricultare_weather_pests/Views/notificaions/notificaion.dart';
// import 'package:agricultare_weather_pests/get_server_key.dart';
// import 'package:agricultare_weather_pests/style/colors.dart';
// import 'package:agricultare_weather_pests/style/constant/texts.dart';
// import 'package:agricultare_weather_pests/utils/string_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:provider/provider.dart';

// class HomeScreen1 extends StatefulWidget {
//   const HomeScreen1({super.key});

//   @override
//   State<HomeScreen1> createState() => _HomeScreen1State();
// }

// class _HomeScreen1State extends State<HomeScreen1> {
//   List<SelectCropsData> savedCrops = [];
//   initializing notificationService = initializing();

//    final ServiceKey _getServerKey = ServiceKey();



//   @override
//   void initState() {
//     super.initState();
//        notificationService.requestNotificationPermission();
//     notificationService.getDeviceToken();
//     notificationService.firebaseInit(context);
//     notificationService.setupInteractMessage(context);
//     getServiceToken();
//     // _loadSavedCrops();
//     // fetchComments();
//   }
//     Future<void> getServiceToken() async {
      
//     String serverToken = await _getServerKey.getServerKeyToken();
//     print("Server Token => $serverToken");
//   }

// // Future<void> fetchComments() async {
// //   final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
  
// //     final response = await http.get(url);
// //    final responseBody= jsonDecode(response.body);
// //    return responseBody;
// // }

//   // Future<void> _loadSavedCrops() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   LocalStorageService localStorageService = LocalStorageService(prefs);

//   //   List<SelectCropsData>? loadedCrops = localStorageService.getCrops();
//   //   if (loadedCrops != null) {
//   //     setState(() {
//   //       savedCrops = loadedCrops;
//   //     });
//   //   }
//   // }


//   List<Color> colors = [
//     Colors.red,
//     Colors.blue,
//     Colors.indigo,
//     Colors.green,
//     Colors.green,
//     Colors.green,
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Plantix'), actions: [
//           Container(
//               margin: EdgeInsets.only(
//                   right: 10.h, bottom: 10.h, top: 10.h, left: 10.h),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: greyColor.withOpacity(0.4),
//               ),
//               child: IconButton(
//                   icon: Icon(Icons.more_horiz_outlined), onPressed: () {}))
//         ]),
//         body: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
//           return ModalProgressHUD(
//             inAsyncCall: homeProvider.state == ViewState.busy,
//             child: SingleChildScrollView(
//               child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Stack(children: [
//                           Container(
//                               height: 70.h,
//                               child: Row(children: [
//                                 Expanded(
//                                     child: ListView.builder(
//                                         itemCount: savedCrops.length,
//                                         scrollDirection: Axis.horizontal,
//                                         physics: BouncingScrollPhysics(),
//                                         itemBuilder: (context, index) {
//                                           SelectCropsData crop = savedCrops[index];
//                                           return Container(
//                                               margin: EdgeInsets.symmetric(
//                                                   horizontal: 5.w),
//                                               decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 // border: Border.all(color: colors[index], width: 2.w)
//                                                 // ! The index % colors.length ensures that the index wraps around if it exceeds the length of the colors list. For example, if index = 6 and colors.length = 5, then 6 % 5 = 1, so it will use the first color again.
//                                                 border: Border.all(
//                                                     color: colors[
//                                                         index % colors.length],
//                                                     width: 2
//                                                         .w), // Use modulo to cycle colors
//                                               ),
//                                               child: ClipOval(
//                                                   child: Image.asset(crop.image,  
//                                                       fit: BoxFit.cover,
//                                                       width: 70.w,
//                                                       height: 70.h)));
//                                         }))
//                               ])),
//                           Positioned(
//                               right: 7.w,
//                               top: 7.h,
//                               child: Container(
//                                   width: 40.w,
//                                   height: 40.h,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle, color: colorBlue),
//                                   child: IconButton(
//                                       icon: Icon(Icons.add, color: whiteColor),
//                                       iconSize: 23.sp,
//                                       onPressed: () {
//                                         Get.to(() => AddCrops());
//                                       })))
//                         ]),
//                         Padding(
//                             padding: EdgeInsets.only(
//                               top: 10.h,
//                             ),
//                             child: CustomText(
//                                 text: "Heal Your Crop",
//                                 fontsize: 18.sp,
//                                 fontweight: FontWeight.bold)),
//                         Container(
//                             height: 220.h,
//                             width: 350.w,
//                             child: Card(
//                                 elevation: 5,
//                                 color: greyliteColor1,
//                                 child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       homeProvider.file != null
//                                           ? Image.file(homeProvider.file!,
//                                               fit: BoxFit.fitWidth,
//                                               height: 130.h,
//                                               width: double.infinity)
//                                           : Image.asset('assets/images/disease.jpg',
//                                               width: 160.w, height: 160.h),
                                     
//                                     ]))),
                                 
              
                   
                     
//                       ])),
//             ),
//           );
//         }));
//   }
// }


