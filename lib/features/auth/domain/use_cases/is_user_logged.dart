// domain/usecases/is_user_logged.dart
import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/auth/data/repo/auth_repo.dart';

class IsUserLoggedUseCase {
  final AuthRepository repository;

  IsUserLoggedUseCase(this.repository);

  Future<Either<Failure, bool>> call() async {
    try {
      return await repository.isUserLogged();
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
