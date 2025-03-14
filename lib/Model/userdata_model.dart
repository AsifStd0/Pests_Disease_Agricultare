class UserDataModel {
  int? id;
  String? username;
  String? email;
  String? password;

  UserDataModel({
    this.id,
    this.username,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()),
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  @override
  String toString() {
    return '''
    UserDataModel {
      id: $id,
      username: $username,
      email: $email,
      password: $password,
    }
    ''';
  }
}

// // lib/models/user_registration_model.dart

// class UserDataModel {
//    String? id;
//   String? email;
//   String? password;
//   String? firstName;
//   String? lastName;
//   UserDataModel({
//     this.id,
//      this.email,
//      this.password,
//      this.firstName,
//      this.lastName,
//   });

//   // Convert a UserRegistration object into a Map
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'email': email,
//       'password': password,
//       'firstName': firstName,
//       'lastName': lastName,
//     };
//   }

//   // Create a UserRegistration object from a Map
//   factory UserDataModel.fromJson(Map<String, dynamic> json) {
//     return UserDataModel(
//       id: json['id'],
//       email: json['email'],
//       password: json['password'],
//       firstName: json['firstName'],
//       lastName: json['lastName'],

//     );
//   }
//    @override
//   String toString() {
//     return '''
//     UserDataModel {
//       id: $id,
//       email: $email,
//       password: $password,
//       firstName: $firstName,
//       lastName: $lastName,
//     }
//     ''';
//   }
// }
// UserDataModel userdata_model = UserDataModel();