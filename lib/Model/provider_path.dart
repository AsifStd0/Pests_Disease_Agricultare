import 'package:agricultare_weather_pests/Views/EditProfile/editprofile_provider.dart';
import 'package:agricultare_weather_pests/Views/add_crops/added_provider.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/home_provider.dart';
import 'package:agricultare_weather_pests/Views/login_screen.dart/login_provider.dart';
import 'package:agricultare_weather_pests/Views/signup/signup_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerPath = [
  
        
ChangeNotifierProvider(create: (_)=> AddedProvider()),
        ChangeNotifierProvider(create: (_)=>LoginProvider()),
        ChangeNotifierProvider(create: (_)=>SignupProvider()),
        ChangeNotifierProvider(create: (_)=>HomeProvider()),
        ChangeNotifierProvider(create: (_)=>EditprofileProvider()),


        
];