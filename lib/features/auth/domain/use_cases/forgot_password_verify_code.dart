// domain/usecases/forgot_password_verify_code.dart
import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/auth/data/repo/auth_repo.dart';

class ForgotPasswordVerifyCodeUseCase {
  final AuthRepository repository;

  ForgotPasswordVerifyCodeUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String email,
    required String code,
  }) async {
    try {
      return await repository.forgotPasswordVerifyCode(
        email: email,
        code: code,
      );
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
