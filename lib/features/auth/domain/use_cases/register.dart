// domain/usecases/register_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/auth_failure.dart';
import 'package:telemedicine/features/auth/data/repo/auth_repo.dart';
import '../entities/user_entity.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<AuthFailure, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    try {
      return await repository.register(email: email, password: password);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
