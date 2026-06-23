import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/medical_history/data/repo/medical_history_repo.dart';

class RateDoctorUseCase {
  final MedicalHistoryRepo medicalHistoryRepo;

  RateDoctorUseCase({required this.medicalHistoryRepo});

  Future<Either<Failure, void>> rateDoctor({
    required int medicalRecordId,

    required int doctorId,
    required int starts,
  }) async {
    return await medicalHistoryRepo.rateDoctor(
      medicalRecordId: medicalRecordId,
      doctorId: doctorId,
      starts: starts,
    );
  }
}
