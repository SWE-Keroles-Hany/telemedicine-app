import 'package:telemedicine/features/auth/data/models/user_model.dart';
import 'package:telemedicine/features/auth/domain/entities/user_entity.dart';

extension UserEntityMapper on UserEntity {
  UserModel toModel() {
    return UserModel(uid: id, email: email);
  }
}

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(id: uid, email: email);
  }
}
