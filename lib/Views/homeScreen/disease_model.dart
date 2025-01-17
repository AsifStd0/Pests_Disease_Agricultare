
// Disease Model for Type Safety
class DiseaseModel {
  final String predictedClass;
  final String confidence;
  final String precautions;
  final String treatment;

  DiseaseModel({
    required this.predictedClass,
    required this.confidence,
    required this.precautions,
    required this.treatment,
  });

  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
      predictedClass: json['predicted_class'] ?? '',
      confidence: json['confidence'] ?? '',
      precautions: json['precautions'] ?? '',
      treatment: json['treatment'] ?? '',
    );
  }
}
// class Disease {
//   final String image;
//   final String diseaseName;
//   final String symptoms;
//   final String causedBy;
//   final String cure;
//   final String prevent;

//   Disease({
//     required this.image,
//     required this.diseaseName,
//     required this.symptoms,
//     required this.causedBy,
//     required this.cure,
//     required this.prevent,
//   });

//   factory Disease.fromJson(Map<String, dynamic> json) {
//     return Disease(
//       image: json['image'],
//       diseaseName: json['diseaseName'],
//       symptoms: json['symptoms'],
//       causedBy: json['causedBy'],
//       cure: json['cure'],
//       prevent: json['prevent'],
//     );
//   }
// }


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
