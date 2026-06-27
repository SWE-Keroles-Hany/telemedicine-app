import 'package:telemedicine/core/shared_models/medical_history/models/attachment_entity.dart';

class MedicalHistoryEntity {
  final int recordId;
  final int doctorId;

  final String doctorName;
  final String doctorSpecialty;
  final String diagnosis;
  final String treatmentPlan;
  final DateTime dateCreated;
  final List<AttachmentEntity> attachments;
  final int? patientRating;

  const MedicalHistoryEntity({
    required this.doctorId,
    required this.recordId,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.diagnosis,
    required this.treatmentPlan,
    required this.dateCreated,
    required this.attachments,
    this.patientRating,
  });
}
