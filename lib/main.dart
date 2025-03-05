import 'package:agricultare_weather_pests/Model/provider_path.dart';
import 'package:agricultare_weather_pests/Views/splashscreen/splashscreen.dart';
import 'package:agricultare_weather_pests/style/constant/translation_text.dart';
import 'package:agricultare_weather_pests/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
    sharedPrefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}
late SharedPreferences sharedPrefs;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providerPath,
        child: ScreenUtilInit(builder: (context, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              home:  Splashscreen(),
              locale: const Locale('en', 'US'),
              translations: GetxTranslations(),
              fallbackLocale: const Locale('en', 'US'),
              );}));
  }}

