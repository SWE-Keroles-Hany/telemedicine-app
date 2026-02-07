// data/repositories/auth_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/auth_failure.dart';
import 'package:telemedicine/core/error/firbase_errors.dart';
import 'package:telemedicine/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:telemedicine/features/auth/data/mapper/user_model_mapper.dart';
import 'package:telemedicine/features/auth/data/repo/auth_repo.dart';
import '../entities/user_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AuthFailure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.login(
        email: email,
        password: password,
      );
      return Right(userModel.toEntity());
    } catch (e) {
      final error = FirebaseAuthErrors.getMessage(e.toString());

      return Left(AuthFailure(error));
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity>> register({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.register(
        email: email,
        password: password,
      );
      return Right(userModel.toEntity());
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
