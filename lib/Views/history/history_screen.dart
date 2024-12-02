import 'package:agricultare_weather_pests/Views/history/history_data.dart';
import 'package:agricultare_weather_pests/style/CustomText/custom_back_button.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:agricultare_weather_pests/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('History'),
          centerTitle: true,
          leading: CircularBackButton(
            onPressed: () {},
          ),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.w, // row width
              crossAxisSpacing: 5.w, // row wise spacing
              mainAxisExtent: 200.h, // height width
              mainAxisSpacing: 10.h// height spacing
            ),
            padding: EdgeInsets.all(15.r),
            itemCount: pestHistory.length,
            itemBuilder: (context, index) {
              // Fetching data from the list
              final historyItem = pestHistory[index];
              return Card(
                elevation: 5.r,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(5.r),
                      child: Column(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                MepaImage.crops,
                                width: 108.w,
                                height: 107.h,
                              ),
                              Text(historyItem['plant'] ?? 'Unknown plant',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                      color: blackColor)),
                              SizedBox(height: 3.h),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [
                                      Text(
                                        'Time',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          color: blackColor,
                                        ),
                                      ),
                                      Text(historyItem['time'] ?? 'N/A',
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              color: blackColor))
                                    ]),
                                    Column(children: [
                                      Text('Date',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                              color: blackColor)),
                                      Text(historyItem['date'] ?? 'N/A',
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              color: blackColor))
                                    ])
                                  ])
                            ])
                      ])));
            }));
  }
}
