class UserEntity {
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

  const UserEntity({
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
}
