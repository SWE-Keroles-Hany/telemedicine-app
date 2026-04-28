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
  final String dateOfBirth;
  final String imgURL;

  UserModel({
    required this.imgURL,
    required this.dateOfBirth,
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
      imgURL: json['ProfilePicture'],
      dateOfBirth: json['DateOfBirth'],
      fullName: json['FullName'] ?? '',
      email: json['Email'] ?? '',
      password: json['Password'] ?? '',
      phoneNumber: json['PhoneNumber'] ?? '',
      gender: json['Gender'] ?? '',
      address: json['Address'] ?? '',
      bloodType: json['BloodType'] ?? '',
      allergies: json['Allergies'] ?? '',
      existingConditions: json['ExistingConditions'] ?? '',
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'FullName': fullName,
      'Email': email,
      'Password': password,
      'PhoneNumber': phoneNumber,
      'Gender': gender,
      "DateOfBirth": "2004/01/22",
      'Address': address,
      'BloodType': bloodType,
      'Allergies': allergies,
      'ExistingConditions': existingConditions,
      'ProfilePicture': "",
    };
  }
}
