import 'dart:developer';

import 'package:agricultare_weather_pests/AddData/add_data_provider.dart';
import 'package:agricultare_weather_pests/Model/enum.dart';
import 'package:agricultare_weather_pests/main.dart';
import 'package:agricultare_weather_pests/services/weather_api_services.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/style/constant/custom_button.dart';
import 'package:agricultare_weather_pests/style/constant/testfield.dart';
import 'package:agricultare_weather_pests/style/constant/texts.dart';
import 'package:agricultare_weather_pests/style/constant/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class AddDataUser extends StatefulWidget {
  const AddDataUser({super.key});

  @override
  State<AddDataUser> createState() => _AddDataUserState();
}

class _AddDataUserState extends State<AddDataUser> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // late TextEditingController weatherController;
  ApiResponse? response;
  bool inProgress = false;
  String message = "";
  String locationName = '';
  bool isLocationEmpty = true;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AddDataProvider>(context, listen: false);
    locationName = sharedPrefs.getString('locationName') ?? '';
    provider.weatherController = TextEditingController(text: locationName);
    _getWeatherData(locationName);
  }

  _getWeatherData(String location) async {
        final provider = Provider.of<AddDataProvider>(context, listen: false);

    setState(() {
      inProgress = true;
    });

    try {
      if (location.isEmpty) {
        log('0000000000 Empty');
        Position position = await LocationService().getLocation();
        response = await WeatherApi()
            .getCurrentWeatherByLatLong(position.latitude, position.longitude);
        log("${response!.location}  2222 ${position.latitude} 333 ${position.longitude}");
      } else {
        log('11111111 Not Empty');
        response = await WeatherApi().getWeather(location);
      }

      if (response?.current != null) {
        // Set the temperature value in the text controller
        provider.weatherController.text = "Temp: ${response!.current!.tempC}°C";
      }
    } catch (e) {
      setState(() {
        message = "Failed to get weather info for \n$location";
        response = null;
      });
    } finally {
      setState(() {
        inProgress = false;
      });
    }
  }

  _saveLocation(String location) {
    sharedPrefs.setString('locationName', location);
  }


// ! *********************
  @override
  Widget build(BuildContext context) {
    // log('${response!.location}');
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: blackColor,
                size: 25.sp,
              )),
          centerTitle: true,
          title: CustomText(
              text: "Add Data".tr, customstyle: KlTexts.headlineLarge),
        ),
        body:Consumer<AddDataProvider>(
            builder: (context,  provider, child) {
              return ModalProgressHUD(
                inAsyncCall: provider.state == ViewState.busy,
                child:  SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                  child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 240.h,
                              // Image
                              child: provider.addFile == null
                                  ? InkWell(
                                      onTap: () {
                                        provider.addPickedImage(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(20.r)),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add_a_photo,
                                                color: Colors.grey,
                                                size: 40.sp,
                                              ),
                                            ]),
                                      ),
                                    )
                                  : Stack(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            child: Image.file(
                                              provider.addFile!,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            )),
                                        Positioned(
                                            right: 0,
                                            top: 0,
                                            child: InkWell(
                                                onTap: () {
                                                  provider.removeImage();
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.r)),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                      size: 20.sp,
                                                    ))))
                                      ],
                                    ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomText(
                                text: "diseaseName".tr,
                                customstyle: KlTexts.fieldName),
                            KlTextInputField(
                              controller: provider.diseaseNameController,
                              padding: EdgeInsets.symmetric(horizontal: 0.w),
                                style: KlTextInputFieldStyle.diseaseName,
                                validator: KlValidators.diseaseNameValidator),
                            SizedBox(height: 10.h),
                            CustomText(
                              
                                text: "diseaseDescription".tr,
                                customstyle: KlTexts.fieldName),
                            KlTextInputField(
                                controller: provider.diseaseDescriptionController,
                              padding: EdgeInsets.symmetric(horizontal: 0.w),
                                style: KlTextInputFieldStyle.diseaseDescription,
                                validator: KlValidators.descriptionValidator),
                            SizedBox(height: 10.h),
                            CustomText(
                                text: "reamedies".tr,
                                customstyle: KlTexts.fieldName),
                            KlTextInputField(
                                controller: provider.remediesController,
                                 padding: EdgeInsets.symmetric(horizontal: 0.w),
                                style: KlTextInputFieldStyle.remedies,
                                validator: (value) =>
                                    KlValidators.remediesValidator(value)),
                            SizedBox(height: 10.h),
                            CustomText(
                                text: "Weather".tr,
                                customstyle: KlTexts.fieldName),
                            KlTextInputField(
                              
                                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                                style: KlTextInputFieldStyle.fieldIconLocation,
                                controller: provider.weatherController,
                                readOnly: false,
                                fetchLocation: () {
                                  if (!isLocationEmpty) {
                                    _saveLocation(locationName);
                                    _getWeatherData(locationName);
                                  }
                                },
                                validator: (value) =>
                                    KlValidators.weatherValidator(value)),
                            SizedBox(height: 30.h),
                            Align(
                                alignment: Alignment.center,
                                child: KlButton(
                                  style: KlButtonStyle.detect,
                                  borderRadius: BorderRadius.circular(30.r),
                                  label: 'Save',
                                  buttonColor: mainColor,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      if (provider.addFile == null) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Please select an image')));
                                        return;
                                      }

                                      provider.saveDiseaseData();
                                    }
                                  },
                                )),
                            SizedBox(height: 40.h),
                          ])))
                ),
                          );
        }));
  }
}
