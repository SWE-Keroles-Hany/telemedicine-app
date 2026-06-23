import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/medical_history/domain/entities/medical_history_entity.dart';

abstract class MedicalHistoryRepo {
  Future<Either<Failure, List<MedicalHistoryEntity>>> getMedicalHistory();
  Future<Either<Failure, void>> rateDoctor({
    required int doctorId,
    required int medicalRecordId,

    required int starts,
  });
}
