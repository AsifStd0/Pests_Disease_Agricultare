class UserDataModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;

  UserDataModel({
     this.id,
     this.firstName,
     this.lastName,
     this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
    };
  }

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  @override
  String toString() {
    return 'UserDataModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email)';
  }
}
