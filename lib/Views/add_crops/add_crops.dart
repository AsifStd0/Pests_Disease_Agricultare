import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/Views/add_crops/added_provider.dart';
import 'package:agricultare_weather_pests/repository/shared_pref.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/utils/string_text.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCrops extends StatefulWidget {
  const AddCrops({super.key});

  @override
  State<AddCrops> createState() => _AddCropsState();
}

class _AddCropsState extends State<AddCrops> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: GestureDetector(
              onTap: () {
                print('object');
              },
              child: Text('Select crops')),
        ),
        body: Consumer<AddedProvider>(builder: (context, data, child) {
          return ModalProgressHUD(
              inAsyncCall: data.state == ViewState.busy,
              progressIndicator: CircularProgressIndicator(),
              child: SingleChildScrollView(
                  child: Column(children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(StringText.selectCrops,
                              style: KlTexts.simplewh16b),
                          Text('${data.added.length}/8')
                        ])),
                Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    height: 70.h,
                    color: whiteColor,
                    child: ListView.builder(
                        itemCount: data.added.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          SelectCropsData crop = data.added[index];

                          return Stack(children: [
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                width: 80.w,
                                height: 80.h,
                                decoration: BoxDecoration(
                                  color: greyliteColor1,
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                    margin: EdgeInsets.all(10.w),
                                    child: CircleAvatar(
                                        backgroundColor: mainBlueColor,
                                        backgroundImage: AssetImage(
                                            data.added[index].image)))),
                            Positioned(
                                top: 0.h,
                                right: 12.w,
                                child: GestureDetector(
                                    onTap: () {
                                      print('remove ${crop.name}');
                                      data.remove(crop);
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: colorBlueTrue,
                                            shape: BoxShape.circle),
                                        child: Icon(Icons.close,
                                            color: whiteColor, size: 20.sp))))
                          ]);
                        })),
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
// ! Adjust the itemCount dynamically by subtracting the added items from the total number of crops.
//  !  Example --------------- which shows the number of crops that haven't been added yet if there are 8 total crops and 4 have been added, the remaining count will be 4.
                    itemCount: images.length -   data.added.length, // ! 8 - (added 4) remaining 4 item
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      // ! Create a filtered list of available crops
                      // ! availableCrops  Filter the crops that haven't been added to the availableCrops list, ensuring the grid only displays non-added items.
                    // !====== The purpose of this setup is to show only the remaining crops that haven't been added yet
                      List<SelectCropsData> availableCrops = [];
                      for (int i = 0; i < images.length; i++) {
                        SelectCropsData crop = SelectCropsData(image: images[i], name: cropsName[i]);
                        if (!data.added.any((addedCrop) => addedCrop.name == crop.name)) {  // !  data.added not has any
                          availableCrops.add(crop); //! only add remaining item => Only add crops that are not added
                        }
                      }

                      // Ensure we do not access out of bounds
                      if (index >= availableCrops.length) {
                        return SizedBox(); // If out of bounds, return an empty widget
                      }

                      SelectCropsData cropAdded = availableCrops[index];

                      return Column(children: [
                        Stack(children: [
                          GestureDetector(
                              onTap: () {
                                // Toggle crop addition/removal
                                if (data.added.any((addedCrop) =>
                                    addedCrop.name == cropAdded.name)) {
                                  data.remove(cropAdded); // Remove crop
                                  print('Removing ${cropAdded.name}');
                                } else {
                                  if (data.added.length < 8) {
                                    data.add(cropAdded); // Add crop
                                    print('Adding ${cropAdded.name}');
                                  } else {
                                    Get.snackbar('Configuration!',
                                        'You can select up to 8 crops');
                                  }
                                }
                              },
                              child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  width: 70.w,
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: greyliteColor.withOpacity(0.5),
                                        width: 1.w),
                                  ),
                                  child: Container(
                                      margin: EdgeInsets.all(8.w),
                                      child: CircleAvatar(
                                          backgroundColor: mainBlueColor,
                                          backgroundImage:
                                              AssetImage(cropAdded.image))))),
                          Positioned(
                              top: 0,
                              right: 0,
                              child: Icon(
                                  data.added.any((addedCrop) =>
                                          addedCrop.name == cropAdded.name)
                                      ? Icons.remove
                                      : Icons.add,
                                  size: 21.sp))
                        ]),
                        SizedBox(height: 5.h),
                        Text(cropAdded.name)
                      ]);
                    }),
                SizedBox(height: 40)
              ])));
        }),
                    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Consumer<AddedProvider>(
          builder: (context,data,chils){
            return 
          KlButton(
              style: KlButtonStyle.login,
              label: 'Save',
              borderRadius: BorderRadius.circular(30),
             
             onPressed: () async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LocalStorageService localStorageService = LocalStorageService(prefs);
    
    // ! if add one item from lists Assuming data.added is a list of crops
    // List<String> cropNames = data.added.map((crop) => crop.name).toList();
    // await localStorageService.saveCrops(cropNames);
    // ! ***************  if both item is added 
        await localStorageService.saveCrops(data.added);
// Get.to(()=> HomeScreen1());
    
    print('Crops saved successfully');
  } catch (e) {
    print('Error accessing SharedPreferences: $e');
  }
}

          
              );
              },
        ));
  }
}







// class ShoppingCart extends StatefulWidget {
//   @override
//   _ShoppingCartState createState() => _ShoppingCartState();
// }

// class _ShoppingCartState extends State<ShoppingCart> {
//   List<String> items = ['Apple', 'Banana', 'Orange', 'Grapes', 'Mango'];
//   List<String> cart = [];

//   @override
//   Widget build(BuildContext context) {
//     // Filter out the items that are already in the cart
//     List<String> availableItems = items.where((item) => !cart.contains(item)).toList();
// print('$availableItems');
//     return Scaffold(
//       appBar: AppBar(title: Text("Shopping Cart")),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // 2 items per row
//         ),
//         itemCount: availableItems.length, // Dynamic count
//         itemBuilder: (context, index) {
//           // Get the current available item
//           String currentItem = availableItems[index];
//           return Card(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(currentItem),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Add or remove item from the cart
//                     setState(() {
//                       cart.add(currentItem); // Add item to the cart
//                     });
//                   },
//                   child: Text("Add to Cart"),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
