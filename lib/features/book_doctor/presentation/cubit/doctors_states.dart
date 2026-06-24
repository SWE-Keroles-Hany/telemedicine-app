import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_schedule_entity.dart';

abstract class DoctorsState {}

// ----- GET DOCTORS STATES -----
abstract class GetDoctorsState extends DoctorsState {}

class GetDoctorsInitial extends GetDoctorsState {}

class GetDoctorsLoading extends GetDoctorsState {}

class GetDoctorsSuccess extends GetDoctorsState {
  final List<DoctorEntity> doctors;

  GetDoctorsSuccess(this.doctors);
}

class GetDoctorsError extends GetDoctorsState {
  final String message;

  GetDoctorsError(this.message);
}

// ----- BOOK DOCTOR STATES -----
abstract class BookDoctorState extends DoctorsState {}

class BookDoctorInitial extends BookDoctorState {}

class BookDoctorLoading extends BookDoctorState {}

class BookDoctorSuccess extends BookDoctorState {
  BookDoctorSuccess();
}

class BookDoctorError extends BookDoctorState {
  final String message;

  BookDoctorError(this.message);
}

// ----- GET DOCTOR SCHEDULE STATES -----
abstract class GetDoctorScheduleState extends DoctorsState {}

class GetDoctorScheduleInitial extends GetDoctorScheduleState {}

class GetDoctorScheduleLoading extends GetDoctorScheduleState {}

class GetDoctorScheduleSuccess extends GetDoctorScheduleState {
  final List<DoctorScheduleEntity> schedules;

  GetDoctorScheduleSuccess(this.schedules);
}

class GetDoctorScheduleError extends GetDoctorScheduleState {
  final String message;

  GetDoctorScheduleError(this.message);
}
