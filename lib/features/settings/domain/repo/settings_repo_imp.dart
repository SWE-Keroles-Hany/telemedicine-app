import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/shared_models/user/entities/user_entity.dart';
import 'package:telemedicine/core/shared_models/user/mapper/user_model_mapper.dart';
import 'package:telemedicine/features/settings/data/data_source/settings_remote_data_source.dart';
import 'package:telemedicine/features/settings/data/repo/settings_repo.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource remoteDataSource;

  SettingsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> getUserProfile() async {
    try {
      final model = await remoteDataSource.getUserProfile();
      print("model: ${model.toJson()}");
      return Right(model.toEntity());
    } on Failure catch (error) {
      print("error: ${error.message}");
      return Left(Failure(message: error.message));
    } catch (e) {
      print("error: ${e.toString()}");
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile({
    required UserEntity userProfile,
  }) async {
    try {
      await remoteDataSource.updateProfile(userProfile: userProfile.toModel());
      return Right(null);
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateImageProfile({
    required XFile image,
  }) async {
    try {
      await remoteDataSource.updateImageProfile(image: image);
      return Right(null);
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return Right(null);
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      await remoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      return Right(null);
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
