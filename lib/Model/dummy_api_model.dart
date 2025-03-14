// class UserModel {
//   int id;
//   String firstName;
//   String lastName;
//   String email;
//   String token; // Added token field

//   UserModel({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.token, // Initialize token
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json, String token) {
//     return UserModel(
//       id: json['id'],
//       firstName: json['first_name'],
//       lastName: json['last_name'],
//       email: json['email'],
//       token: token, // Assign token from API response
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'first_name': firstName,
//       'last_name': lastName,
//       'email': email,
//       'token': token, // Save token
//     };
//   }
// }
