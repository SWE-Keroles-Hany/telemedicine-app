// domain/usecases/login_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/auth_failure.dart';
import 'package:telemedicine/features/auth/data/repo/auth_repo.dart';
import '../entities/user_entity.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<AuthFailure, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    try {
      return await repository.login(email: email, password: password);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
