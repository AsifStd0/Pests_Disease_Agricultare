// ! **************************** 

// class MenuWidget extends StatelessWidget {
//   final List<IconData> allIcons = [
//     Icons.home,
//     Icons.person,
//     Icons.history,
//     Icons.cast_for_education,
//     Icons.logout,
//     Icons.person_add, // Icon for Create Account
//   ];

//   final List<String> allMenuData = [
//     "home",
//     "aboutUs",
//     "history",
//     "education",
//     "logout",
//     "createaccount",
//   ];

//   Future<List<Map<String, dynamic>>> getFilteredMenuData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userId = prefs.getString('user_id');

//     List<Map<String, dynamic>> menuList = [];
//     for (int i = 0; i < allMenuData.length; i++) {
//       if (userId == null && (i == 2 || i == 4)) {
//         // Skip History and Logout if user ID is null
//         continue;
//       }
//       menuList.add({'title': allMenuData[i], 'icon': allIcons[i]});
//     }
//     return menuList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: whiteColor,
//         child: Consumer(
//           builder: (context, LoginProvider provider, child) {
//             return ModalProgressHUD(
//               inAsyncCall: provider.state == ViewState.busy,
//               progressIndicator: CircularProgressIndicator(color: mainColor),
//               child: FutureBuilder<List<Map<String, dynamic>>>( 
//                 future: getFilteredMenuData(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }

//                   if (snapshot.hasError || !snapshot.hasData) {
//                     return Center(child: Text("Error loading menu"));
//                   }

//                   final menuList = snapshot.data!;

//                   return Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(top: 30.h, right: 30.w),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.of(context).pop(); // Close the drawer
//                                 Get.off(() => HomeScreen());
//                               },
//                               child: Icon(Icons.highlight_remove_outlined, color: mainColor),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 10.h),
//                         child: ClipOval(
//                           child: Container(
//                             width: 130,
//                             height: 130,
//                             child: Image.asset(
//                               MepaImage.splashLogo,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: menuList.length,
//                           itemBuilder: (context, index) {
//                             final item = menuList[index];
//                             return Padding(
//                               padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
//                               child: GestureDetector(
//                                 onTap: () async {
//                                   // Access the translated title dynamically
//                                   String title = item['title']; // Get the title key here

//                                   // Navigation logic based on translated title
//                                   switch (title) {
//                                     case "home":
//                                       Get.offAll(() => HomeScreen());
//                                       break;
//                                     case "aboutUs":
//                                       Get.to(() => Aboutus());
//                                       break;
//                                     case "history":
//                                       Get.to(() => HistoryMain());
//                                       break;
//                                     case "education":
//                                       Get.to(() => EducationScreen());
//                                       break;
//                                     case "logout":
//                                       showLogout(context, provider);
//                                       break;
//                                     case "createaccount":
//                                       Get.to(() => Signup());
//                                       break;
//                                   }
//                                 },
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: mainColor,
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsets.all(8.sp),
//                                         child: Icon(
//                                           item['icon'],
//                                           color: whiteColor,
//                                           size: 22.sp,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 10.w),
//                                     Text(
//                                       item['title'], // Translate the title dynamically here
//                                       style: TextStyle(
//                                         fontSize: 18.sp,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
