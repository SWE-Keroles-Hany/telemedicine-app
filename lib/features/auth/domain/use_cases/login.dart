// domain/usecases/login_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/auth/data/repo/auth_repo.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String email,
    required String password,
  }) async {
    try {
      return await repository.login(email: email, password: password);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
