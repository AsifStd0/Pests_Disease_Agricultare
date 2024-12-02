// lib/models/user_registration_model.dart

class UserDataModel {
   String? id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? image;
  String? location;
  String? token;

  UserDataModel({
    this.id,
    this.token,
     this.email,
     this.password,
     this.firstName,
     this.lastName,
     this.image,
     this.location,
  });

  // Convert a UserRegistration object into a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'image': image,
      'location': location,
    };
  }

  // Create a UserRegistration object from a Map
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
      location: json['location'],
    );
  }
   @override
  String toString() {
    return '''
    UserDataModel {
      id: $id,
      token: $token,
      email: $email,
      password: $password,
      firstName: $firstName,
      lastName: $lastName,
      image: $image,
      location: $location
    }
    ''';
  }
}

UserDataModel userdata_model = UserDataModel();