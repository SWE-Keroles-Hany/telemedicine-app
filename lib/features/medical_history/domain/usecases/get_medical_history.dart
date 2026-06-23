import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/medical_history/data/repo/medical_history_repo.dart';
import 'package:telemedicine/features/medical_history/domain/entities/medical_history_entity.dart';

class GetMedicalHistoryUseCase {
  final MedicalHistoryRepo medicalHistoryRepo;

  GetMedicalHistoryUseCase({required this.medicalHistoryRepo});

  Future<Either<Failure, List<MedicalHistoryEntity>>> getMedicalHistory() async {
    return await medicalHistoryRepo.getMedicalHistory();
  }
}
