import 'package:telemedicine/core/shared_models/user/models/user_model.dart';
import 'package:telemedicine/core/shared_models/user/entities/user_entity.dart';

extension UserEntityMapper on UserEntity {
  UserModel toModel() {
    return UserModel(
      id: id,
      imgURL: imgURL,
      dateOfBirth: dateOfBirth,
      phoneNumber: phoneNumber,
      password: password,
      gender: gender,
      fullName: fullName,
      existingConditions: existingConditions,
      bloodType: bloodType,
      allergies: allergies,
      address: address,
      email: email,
      height: height,
      weight: weight,
    );
  }
}

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      dateOfBirth: dateOfBirth,
      imgURL: imgURL,
      phoneNumber: phoneNumber,
      password: password,
      gender: gender,
      fullName: fullName,
      existingConditions: existingConditions,
      bloodType: bloodType,
      allergies: allergies,
      address: address,
      email: email,
      height: height,
      weight: weight,
    );
  }
}
