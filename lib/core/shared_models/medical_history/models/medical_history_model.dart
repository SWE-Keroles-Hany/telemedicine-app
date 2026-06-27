import 'attachment_model.dart';

class MedicalHistoryModel {
  final int recordId;
  final int doctorId;
  final String doctorName;
  final String doctorSpecialty;
  final String diagnosis;
  final String treatmentPlan;
  final DateTime dateCreated;
  final int? patientRating;
  final List<AttachmentModel> attachments;

  MedicalHistoryModel({
    required this.recordId,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.diagnosis,
    required this.treatmentPlan,
    required this.dateCreated,
    required this.attachments,
    this.patientRating,
    required this.doctorId,
  });

  factory MedicalHistoryModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> attachmentsJson = json['attachments'] ?? [];
    final List<AttachmentModel> attachments = attachmentsJson
        .map((attachment) => AttachmentModel.fromJson(attachment))
        .toList();

    return MedicalHistoryModel(
      doctorId: json['doctorId'],
      patientRating: json['patientRating'],
      recordId: json['recordId'] ?? 0,
      doctorName: json['doctorName'] ?? '',
      doctorSpecialty: json['doctorSpecialty'] ?? '',
      diagnosis: json['diagnosis'] ?? '',
      treatmentPlan: json['treatmentPlan'] ?? '',
      dateCreated: DateTime.parse(json['dateCreated']),
      attachments: attachments,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorId': doctorId,
      'patientRating': patientRating,
      'recordId': recordId,
      'doctorName': doctorName,
      'doctorSpecialty': doctorSpecialty,
      'diagnosis': diagnosis,
      'treatmentPlan': treatmentPlan,
      'dateCreated': dateCreated.toIso8601String(),
      'attachments': attachments.map((a) => a.toJson()).toList(),
    };
  }
}
