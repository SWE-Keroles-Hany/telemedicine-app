class UserModel {
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;
  final String gender;
  final String address;
  final String bloodType;
  final String allergies;
  final String existingConditions;

  UserModel({
    required this.email,
    required this.fullName,
    required this.password,
    required this.phoneNumber,
    required this.gender,
    required this.address,
    required this.bloodType,
    required this.allergies,
    required this.existingConditions,
  });

  // fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
      'address': address,
      'bloodType': bloodType,
      'allergies': allergies,
      'existingConditions': existingConditions,
    };
  }
}
