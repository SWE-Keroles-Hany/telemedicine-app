import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/settings/data/repo/settings_repo.dart';

class LogoutUseCase {
  final SettingsRepository repository;

  LogoutUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    try {
      return await repository.logout();
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
