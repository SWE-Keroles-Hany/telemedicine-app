import 'package:telemedicine/core/shared_models/medical_history/models/medical_history_model.dart';

abstract class MedicalHistoryDataSource {
  Future<List<MedicalHistoryModel>> getMedicalHistory();
  Future<void> rateDoctor({
    required int doctorId,
    required int starts,
    required int medicalRecordId,
  });
}
