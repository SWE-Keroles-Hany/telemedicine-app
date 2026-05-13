import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/settings/data/repo/settings_repo.dart';

class ForgetPasswordUseCase {
  final SettingsRepository repository;

  ForgetPasswordUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      return await repository.forgetPassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
