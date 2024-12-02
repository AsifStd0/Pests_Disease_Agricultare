import 'package:agricultare_weather_pests/Model/provider_path.dart';
import 'package:agricultare_weather_pests/Views/splashscreen/splashscreen.dart';
import 'package:agricultare_weather_pests/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    print('kkkk');
    return MultiProvider(
        providers: providerPath,
        child: ScreenUtilInit(builder: (context, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              home:  Splashscreen());
        }));
  }
}

