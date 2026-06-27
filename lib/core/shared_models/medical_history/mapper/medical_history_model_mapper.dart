import 'package:telemedicine/core/shared_models/medical_history/mapper/attachment_model_mapper.dart';
import 'package:telemedicine/core/shared_models/medical_history/models/medical_history_model.dart';
import 'package:telemedicine/features/medical_history/domain/entities/medical_history_entity.dart';

extension MedicalHistoryModelMapper on MedicalHistoryModel {
  MedicalHistoryEntity get toEntity => MedicalHistoryEntity(
    doctorId: doctorId,
    patientRating: patientRating,
    recordId: recordId,
    doctorName: doctorName,
    doctorSpecialty: doctorSpecialty,
    diagnosis: diagnosis,
    treatmentPlan: treatmentPlan,
    dateCreated: dateCreated,
    attachments: attachments.map((a) => a.toEntity).toList(),
  );
}
