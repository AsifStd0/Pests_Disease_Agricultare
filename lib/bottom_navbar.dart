import 'package:agricultare_weather_pests/Views/ContactUs/contact_us.dart';
import 'package:agricultare_weather_pests/Views/homeScreen/home_screen.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> _screens = [
    HomeScreen(),
    // DiseaseInfoScreen(),
    ContactUsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        
        color: mainColor,
        backgroundColor: whiteColor,
        buttonBackgroundColor: mainColor,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 400),
            height: 60.h,
        key: _bottomNavigationKey,
        items: <Widget>[
          Column(children:[ 
            Icon(Icons.home, size: 40.sp,color: whiteColor,),
            Text('Home', style: TextStyle(fontSize: 11.sp, color: whiteColor),)
            
            ]),
          // Icon(Icons.card_travel_rounded, size: 30.sp,color: whiteColor,),
          Column(
            children: [
              Icon(Icons.phone, size: 40.sp,color: whiteColor,),
              Text('Contact', style: TextStyle(fontSize: 11.sp, color: whiteColor),)
            ],
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _screens[_page],
    );
  }
}
