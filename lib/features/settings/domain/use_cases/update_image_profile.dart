import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/settings/data/repo/settings_repo.dart';

class UpdateImageProfileUseCase {
  final SettingsRepository repository;

  UpdateImageProfileUseCase(this.repository);

  Future<Either<Failure, void>> call({required XFile image}) async {
    try {
      return await repository.updateImageProfile(image: image);
    } on Failure catch (error) {
      return Left(Failure(message: error.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
