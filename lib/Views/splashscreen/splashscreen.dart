import 'package:agricultare_weather_pests/Views/login_screen.dart/login_screen.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/text_strings.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // final _notificationService = locator<NotificationsService>();
@override
void initState() {
  super.initState();
  
  // Call the async method without making initState async
  checkInternetAndNavigate();

  
}

Future<void> checkInternetAndNavigate() async {

//   //  await _notificationService.initConfigure(context);
//    bool result = await InternetConnectionChecker().hasConnection;
//     if (result == false) {
//       Get.offAll(() => NoInternetScreen());
//       return;
//     }
//   // Start a new Future to delay navigation to LoginScreen after 3 seconds
  Future.delayed(Duration(seconds: 3), () {Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Loginscreen()),
    );
  });
}


  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  child: 
                  Image.asset(MepaImage.splashLogo)
                ),
                SizedBox(height: 20.h),
                CustomText(text: MepaText.splash_head,fontsize: 24.sp,fontweight: FontWeight.bold,),
              ]
            )
          ),
        )
      ),
    );
  }
}

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});

//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }

// class _SplashscreenState extends State<Splashscreen> {
//   // final _notificationService = locator<NotificationsService>();

// @override
// void initState() {
//   super.initState();
//     Future<void> didChangeDependencies() async {

//     //// TODO: implement didChangeDependencies
//     super.didChangeDependencies();

 
//     FirebaseMessaging.instance.getInitialMessage().then((message) {
//       log("FirebaseMessaging.instance.getInitialMessage    11111111111111111111111");
//       if (message != null) {
//         log("New Notification");
//       }
//     });

//     // 2. This method only call when App in forground it mean app must be opened
//     FirebaseMessaging.onMessage.listen((message) {
//       log("FirebaseMessaging.onMessage.listen  2222222222222222222");
//       if (message.notification != null) {
//         log(message.notification!.title.toString());
//         log(message.notification!.body.toString());
//         log("message.data11 ${message.data}");
//         LocalNotificationService.createanddisplaynotification(message);
//       }
//     });

//     // 3. This method only call when App in background and not terminated(not closed)
//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       if (message.notification != null) {
//         log(message.notification!.title.toString());
//         log(message.notification!.body.toString());
//         log("message.data22 ${message.data['_id']}");
//       }
//     });
//   }

//   // Call the async method without making initState async
//   checkInternetAndNavigate();

  
// }

// Future<void> checkInternetAndNavigate() async {

//   //  await _notificationService.initConfigure(context);
//    bool result = await InternetConnectionChecker().hasConnection;
//    print('0000000');
//     if (result == false) {
//       Get.offAll(() => NoInternetScreen());
//       return;
//     }

// print('object');
//   // Start a new Future to delay navigation to LoginScreen after 3 seconds
//   Future.delayed(Duration(seconds: 1), () {Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen()),
//     );
//   });
// }


//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: redColor,
//         title: Text('Agriculture')
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Container(
//               child: 
//               Image.asset('assets/agr1.PNG')
//             ),
//             SizedBox(height: 20.h),
//             GestureDetector(
//               onTap: (){
//                 // Navigator.push(context, )
//       //            Navigator.pushReplacement(
//       // context,
//       // MaterialPageRoute(builder: (context) => Loginscreen()),
//     // );
//               },
//               child: Text('Welcome to Agriculture'
//               // style: Theme.of(context).textTheme.headlineLarge
//               ))
//           ]
//         )
//       )
//     );
//   }
// }