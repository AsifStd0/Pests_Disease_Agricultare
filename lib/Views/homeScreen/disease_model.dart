import 'dart:convert';
import 'package:http/http.dart' as http;

class Disease {
  final String image;
  final String diseaseName;
  final String symptoms;
  final String causedBy;
  final String cure;
  final String prevent;

  Disease({
    required this.image,
    required this.diseaseName,
    required this.symptoms,
    required this.causedBy,
    required this.cure,
    required this.prevent,
  });

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      image: json['image'],
      diseaseName: json['diseaseName'],
      symptoms: json['symptoms'],
      causedBy: json['causedBy'],
      cure: json['cure'],
      prevent: json['prevent'],
    );
  }
}





Future<void> getApi () async {
  final response = await http.get(Uri.parse('http://localhost:3000/diseases'));

if (response.statusCode == 200) {
  List<dynamic> data = json.decode(response.body);
  print(data); // List of diseases
} else {
  print('Failed to fetch data');
}

}
Future<void> postApi ()async{
  final response = await http.post(
  Uri.parse('http://localhost:3000/diseases'),
  headers: {'Content-Type': 'application/json'},
  body: json.encode({
    "image": "https://example.com/image3.jpg",
    "diseaseName": "Powdery Mildew",
    "symptoms": "White powdery spots on leaves.",
    "causedBy": "Fungal infection by Podosphaera xanthii.",
    "cure": "Apply neem oil or sulfur sprays.",
    "prevent": "Improve air circulation and avoid overwatering."
  }),
);

if (response.statusCode == 201) {
  print('Data added successfully');
} else {
  print('Failed to add data');
}

}

// Future<List<Disease>> fetchDiseases() async {
//   final response = await http.get(Uri.parse('http://localhost:3000/'));

//   if (response.statusCode == 200) {
//     log('Api Success');
//      List<dynamic> data = json.decode(response.body);
//     return data.map((json) => Disease.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load diseases');
//   }
// }
