import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/shared_models/user/entities/user_entity.dart';

abstract class SettingsRepository {
  Future<Either<Failure, UserEntity>> getUserProfile();
  Future<Either<Failure, void>> updateProfile({
    required UserEntity userProfile,
  });
  Future<Either<Failure, void>> updateImageProfile({required XFile image});
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> forgetPassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  });
}
