import 'dart:convert';

import 'package:agricultare_weather_pests/Model/comments_Model.dart';
import 'package:http/http.dart' as http;

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
  
}


// ! **************   Register User


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
