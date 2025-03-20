

class DiseaseModel {
  final String predictedClass;
  final String treatment;
  final String precautions;

  DiseaseModel({
    required this.predictedClass,
    required this.treatment,
    required this.precautions,
  });

  // Convert DiseaseModel to JSON
  Map<String, dynamic> toJson() {
    return {
      "predicted_class": predictedClass,
      "treatment": treatment,
      "precautions": precautions,
    };
  }

  // Convert JSON to DiseaseModel
  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
      predictedClass: json["predicted_class"] ?? "",
      treatment: json["treatment"] ?? "",
      precautions: json["precautions"] ?? "",
    );
  }
}
