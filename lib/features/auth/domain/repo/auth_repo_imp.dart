// data/repositories/auth_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:telemedicine/core/shared_models/user/mapper/user_model_mapper.dart';
import 'package:telemedicine/features/auth/data/repo/auth_repo.dart';
import '../../../../core/shared_models/user/entities/user_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      await remoteDataSource.login(email: email, password: password);
      return Right(null);
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> register({required UserEntity user}) async {
    try {
      await remoteDataSource.register(user: user.toModel());
      return Right(null);
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPasswordSendCode({
    required String email,
  }) async {
    try {
      await remoteDataSource.forgotPasswordSendCode(email: email);
      return Right(null);
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPasswordVerifyCode({
    required String email,
    required String code,
  }) async {
    try {
      await remoteDataSource.forgotPasswordVerifyCode(email: email, code: code);
      return Right(null);
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPasswordReset({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      await remoteDataSource.forgotPasswordReset(
        email: email,
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
