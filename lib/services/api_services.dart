import 'dart:convert';
import 'dart:io';
import 'package:agricultare_weather_pests/Model/comments_Model.dart';
import 'package:agricultare_weather_pests/style/dialogbox/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ApiService {
    
  List<CommentsModel> comments = []; // Holds all loaded comments
  bool isLoading = false; // Whether data is being fetched
  bool hasMoreData = true; // Whether more data is available
  int perPage = 20; // Items per page
  int currentPage = 1; // Current page number

  List<CommentsModel> allData= [];
  Future<List<CommentsModel>> fetchComments(int page) async {
    // final url = Uri.parse('https://crudcrud.com/api/ac6f934a875443eea54b6073bd3b7a99/unicorns');
    final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
 
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> responseBody = jsonDecode(response.body);
      for(var data in responseBody){allData.add(CommentsModel.fromJson(data));}
      return allData;
      // return responseBody.map((data) => CommentsModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
  // Private constructor
  ApiService._privateConstructor();

  // Single instance (lazily initialized)
  static final ApiService _instance = ApiService._privateConstructor();

  // Factory constructor returns the same instance
  factory ApiService() {
    return _instance;
  }

  // Example method in the singleton class
  Future<String> fetchData() async {
    // Simulate network request
    await Future.delayed(Duration(seconds: 1));
    return 'Data from API';
  }

  

  // ! ************************** =================================
  // ! ************************** =================================
  // ! ************************** =================================
  // ! ************************** =================================
  // ! ************************** =================================
  // ! ************************** =================================
  Future<void> saveDiseaseData(
  BuildContext context,
  String predictedClass,
  String treatment,
  String precautions,
  String pickedImagePath,
  String feedback, // ✅ Added feedback parameter
) async {
  final url = Uri.parse('https://my-json-server.typicode.com/YourGitHubUsername/YourRepo/diseases');

  // ✅ Construct JSON data correctly
  final Map<String, dynamic> diseaseData = {
    "disease": {
      "predictedClass": predictedClass,
      "treatment": treatment,
      "precautions": precautions,
    },
    "feedback": feedback, // ✅ Include user feedback
    "imagePath": pickedImagePath, // ✅ Include image path
  };

  File imageFile = File(pickedImagePath);

  try {
    var request = http.MultipartRequest('POST', url);

    // ✅ Attach structured JSON data
    request.fields['data'] = jsonEncode(diseaseData);

    // ✅ Attach image file if it exists
    if (await imageFile.exists()) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
          filename: basename(imageFile.path),
        ),
      );
    }

    // ✅ Send the request
    var response = await request.send();

    if (response.statusCode == 201 || response.statusCode == 200) {
      CustomSnackbar.showCustomSnackBarData(context, "Data saved successfully!");
    } else {
      CustomSnackbar.showCustomSnackBarData(context, "Failed to save data!");
    }
  } catch (e) {
    CustomSnackbar.showCustomSnackBarData(context, "Error: $e");
  }
}

// ! **************   Register User

}
Future<void> register(String email, String password, String firstName, String lastName) async {
  final url = Uri.parse('http://localhost:5005/v1/auth/register');

  // Creating the JSON body to send in the request
  Map<String, dynamic> body = {
    "email": email,
    "password": password, // Ensure password is an integer
    "firstName": firstName,
    "lastName": lastName,
  };

  // Sending the POST request
  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(body), // Convert the body map to JSON
    );

    // Handling the response
    if (response.statusCode == 200) {
      // Successfully registered
      print('Registration successful');
      print('Response body: ${response.body}');
      // You can parse the response body here and handle further logic
    } else {
      // Error handling for failed request
      print('Failed to register. Status Code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    // Error handling for exceptions (e.g., network errors)
    print('Error occurred: $e');
  }
}
