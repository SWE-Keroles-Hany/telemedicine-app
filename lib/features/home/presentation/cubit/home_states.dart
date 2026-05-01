import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';

abstract class HomeState {}

// ----- GET TOP DOCTORS STATES -----
abstract class GetTopDoctorsState extends HomeState {}

class GetTopDoctorsInitial extends GetTopDoctorsState {}

class GetTopDoctorsLoading extends GetTopDoctorsState {}

class GetTopDoctorsSuccess extends GetTopDoctorsState {
  final List<DoctorEntity> topDoctors;

  GetTopDoctorsSuccess(this.topDoctors);
}

class GetTopDoctorsError extends GetTopDoctorsState {
  final String message;

  GetTopDoctorsError(this.message);
}
