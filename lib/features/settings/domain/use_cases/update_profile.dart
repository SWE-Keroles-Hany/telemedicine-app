import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/shared_models/user/entities/user_entity.dart'
    show UserEntity;
import 'package:telemedicine/features/settings/data/repo/settings_repo.dart';

class UpdateProfileUseCase {
  final SettingsRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, void>> call({required UserEntity userProfile}) async {
    try {
      return await repository.updateProfile(userProfile: userProfile);
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
