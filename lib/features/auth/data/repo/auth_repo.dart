// domain/repositories/auth_repository.dart
import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/auth_failure.dart';
import 'package:telemedicine/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<AuthFailure, UserEntity>> register({
    required String email,
    required String password,
  });
}
