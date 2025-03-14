class UserDataModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? token; // Add token field

  UserDataModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.token, // Include token in constructor
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'token': token, // Include token in JSON
    };
  }

  // Factory constructor to create object from JSON
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      token: json['token'], // Map token from JSON if available
    );
  }

  // CopyWith method to create a new instance with updated values
  UserDataModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? token,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      token: token ?? this.token, // Update token if provided
    );
  }

  @override
  String toString() {
    return 'UserDataModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, token: $token)';
  }
}
