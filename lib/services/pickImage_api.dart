import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:agricultare_weather_pests/Views/homeScreen/disease_model.dart';
import 'package:http/http.dart' as http;
Future<DiseaseModel> fetchDiseaseData(File imageFile) async {
  try {
    log('Sending image to the API...');
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://nlpgenius-cropdisease.hf.space'),
    );

    
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
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

