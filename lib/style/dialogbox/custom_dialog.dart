import 'dart:io';

import 'package:agricultare_weather_pests/Views/homeScreen/disease_model.dart';
import 'package:agricultare_weather_pests/style/colors.dart';
import 'package:flutter/material.dart';

showCustomDialog(BuildContext context, DiseaseModel diseaseData, File file) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Align(
            alignment: Alignment.center,
            child: Material(
                color: mainColor.withOpacity(0.5),
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
                    decoration:BoxDecoration(color: mainColor.withOpacity(0.6)),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child:Icon(Icons.close, color: Colors.white))),
                          SizedBox(height: 10),
                          Row(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(file,
                                        height: 120,
                                        width: 100,
                                        fit: BoxFit.cover)),
                                SizedBox(width: 10),
                                Flexible(
                                    child: Text(
                                        // 'Predicted Disease : ${diseaseData.predictedClass}\n\n Treatment : ${diseaseData.treatment}\n\n Confidence : ${diseaseData.confidence}\n\n Precaution : ${diseaseData.precautions}',
                                        'Predicted Disease : ${diseaseData.predictedClass}\n\n Treatment : ${diseaseData.treatment}\n\n Precaution : ${diseaseData.precautions}',

                                        softWrap: true,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white)))
                              ])
                        ]))));
      });
}

// ! ***************************

void showSnackBar(BuildContext context, String text) {
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
