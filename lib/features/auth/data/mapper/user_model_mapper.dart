import 'package:telemedicine/features/auth/data/models/user_model.dart';
import 'package:telemedicine/features/auth/domain/entities/user_entity.dart';

extension UserEntityMapper on UserEntity {
  UserModel toModel() {
    return UserModel(
      phoneNumber: phoneNumber,
      password: password,
      gender: gender,
      fullName: fullName,
      existingConditions: existingConditions,
      bloodType: bloodType,
      allergies: allergies,
      address: address,
      email: email,
    );
  }
}

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      phoneNumber: phoneNumber,
      password: password,
      gender: gender,
      fullName: fullName,
      existingConditions: existingConditions,
      bloodType: bloodType,
      allergies: allergies,
      address: address,
      email: email,
    );
  }
}
