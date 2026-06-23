class UserEntity {
  String? fullName;
  String? email;
  String? password;
  String? phoneNumber;
  String? gender;
  String? address;
  String? bloodType;
  String? allergies;
  String? existingConditions;
  String? dateOfBirth;
  String? imgURL;
  double? height;
  double? weight;

  UserEntity({
    this.imgURL,
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
    this.height,
    this.weight,
  });
}
