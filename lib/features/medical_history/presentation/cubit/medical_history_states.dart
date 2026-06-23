import 'package:telemedicine/features/medical_history/domain/entities/medical_history_entity.dart';

abstract class MedicalHistoryState {}

// ----- GET MEDICAL HISTORY STATES -----
abstract class GetMedicalHistoryState extends MedicalHistoryState {}

class GetMedicalHistoryInitial extends GetMedicalHistoryState {}

class GetMedicalHistoryLoading extends GetMedicalHistoryState {}

class GetMedicalHistorySuccess extends GetMedicalHistoryState {
  final List<MedicalHistoryEntity> medicalHistory;

  GetMedicalHistorySuccess(this.medicalHistory);
}

class GetMedicalHistoryError extends GetMedicalHistoryState {
  final String message;

  GetMedicalHistoryError(this.message);
}

// ----- RATE DOCTOR STATES -----
abstract class RateDoctorState extends MedicalHistoryState {}

class RateDoctorInitial extends RateDoctorState {}

class RateDoctorLoading extends RateDoctorState {}

class RateDoctorSuccess extends RateDoctorState {}

class RateDoctorError extends RateDoctorState {
  final String message;

  RateDoctorError(this.message);
}
