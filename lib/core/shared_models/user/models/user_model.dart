class UserModel {
  final String? fullName;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? gender;
  final String? address;
  final String? bloodType;
  final String? allergies;
  final String? existingConditions;
  final String? dateOfBirth;
  final String? imgURL;

  UserModel({
    required this.imgURL,
    this.dateOfBirth,
    this.email,
    this.fullName,
    this.password,
    this.phoneNumber,
    this.gender,
    this.address,
    this.bloodType,
    this.allergies,
    this.existingConditions,
  });

  // fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      imgURL: json['pictureUrl'],
      dateOfBirth: json['dateOfBirth'],
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      bloodType: json['bloodType'] ?? '',
      allergies: json['allergies'] ?? '',
      existingConditions: json['existingConditions'] ?? '',
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'gender': gender,
      "dateOfBirth": dateOfBirth,
      'address': address,
      'bloodType': bloodType,
      'allergies': allergies,
      'medicalHistory': existingConditions,
    };
  }
}
