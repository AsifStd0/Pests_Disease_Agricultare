import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:agricultare_weather_pests/Views/homeScreen/disease_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
Future<DiseaseModel> fetchDiseaseData(File imageFile) async {
  try {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://nlpgenius-cropdisease.hf.space'),
    );

    
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
        // request.headers['Accept-Language'] = Get.locale?.languageCode ?? 'en'; // Default to English if null
        // log('Request headers: ${request.headers}',);
    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      log('API Response: $responseData');
      final Map<String, dynamic> data = jsonDecode(responseData);
      return DiseaseModel.fromJson(data);
    } else {
      log('API Error: ${response.statusCode}');
      throw Exception('Failed to fetch disease data from the API');
    }
  } catch (e) {
    log('Error fetching disease data: $e');
    throw Exception('Error fetching disease data');
  }
}


// Future<DiseaseModel> fetchDiseaseData(File imageFile) async {
//   try {
//     final request = http.MultipartRequest(
//       'POST',
//       Uri.parse('https://nlpgenius-cropdisease.hf.space'),
//     );
//     request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
//     final response = await request.send();

//     if (response.statusCode == 200) {
//       final responseData = await response.stream.bytesToString();
//       log('API Response: $responseData');
//       final Map<String, dynamic> data = jsonDecode(responseData);

//       // Check if language is Urdu or English
//       if (Get.locale?.languageCode == 'ur') {
//         data['predictedClass'] = data['predictedClassUr'] ?? data['predictedClassEn'];
//         data['treatment'] = data['treatmentUr'] ?? data['treatmentEn'];
//         data['precautions'] = data['precautionsUr'] ?? data['precautionsEn'];
//       } else {
//         data['predictedClass'] = data['predictedClassEn'] ?? data['predictedClassUr'];
//         data['treatment'] = data['treatmentEn'] ?? data['treatmentUr'];
//         data['precautions'] = data['precautionsEn'] ?? data['precautionsUr'];
//       }

//       return DiseaseModel.fromJson(data);
//     } else {
//       log('API Error: ${response.statusCode}');
//       throw Exception('Failed to fetch disease data from the API');
//     }
//   } catch (e) {
//     log('Error fetching disease data: $e');
//     throw Exception('Error fetching disease data');
//   }
// }