import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/shared_models/medical_history/mapper/medical_history_model_mapper.dart';
import 'package:telemedicine/core/shared_models/medical_history/models/medical_history_model.dart';
import 'package:telemedicine/features/medical_history/data/datasource/medical_history_data_source.dart';
import 'package:telemedicine/features/medical_history/data/repo/medical_history_repo.dart';
import 'package:telemedicine/features/medical_history/domain/entities/medical_history_entity.dart';

class MedicalHistoryRepoImp implements MedicalHistoryRepo {
  final MedicalHistoryDataSource _medicalHistoryDataSource;

  MedicalHistoryRepoImp(this._medicalHistoryDataSource);

  @override
  Future<Either<Failure, List<MedicalHistoryEntity>>>
  getMedicalHistory() async {
    try {
      List<MedicalHistoryModel> medicalHistoryModel =
          await _medicalHistoryDataSource.getMedicalHistory();
      final medicalHistory = medicalHistoryModel
          .map((record) => record.toEntity)
          .toList();

      return Right(medicalHistory);
    } on Failure catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> rateDoctor({
    required int medicalRecordId,

    required int doctorId,
    required int starts,
  }) async {
    try {
      await _medicalHistoryDataSource.rateDoctor(
        medicalRecordId: medicalRecordId,
        doctorId: doctorId,
        starts: starts,
      );
      return Right(null);
    } on Failure catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
