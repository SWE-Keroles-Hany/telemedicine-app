import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/shared_models/user/entities/user_entity.dart';

abstract class SettingsRepository {
  Future<Either<Failure, UserEntity>> getUserProfile();
  Future<Either<Failure, void>> updateProfile({
    required UserEntity userProfile,
  });
}
