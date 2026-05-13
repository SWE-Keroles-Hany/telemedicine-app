// domain/repositories/auth_repository.dart
import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/shared_models/user/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> register({required UserEntity user});

  Future<Either<Failure, void>> forgotPasswordSendCode({required String email});

  Future<Either<Failure, void>> forgotPasswordVerifyCode({
    required String email,
    required String code,
  });

  Future<Either<Failure, void>> forgotPasswordReset({
    required String email,
    required String newPassword,
    required String confirmPassword,
  });
}
