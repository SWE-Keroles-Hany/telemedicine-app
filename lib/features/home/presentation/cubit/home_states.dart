import 'package:telemedicine/features/home/domain/entities/top_doctor_entity.dart';

abstract class HomeState {}

// ----- GET TOP DOCTORS STATES -----
abstract class GetTopDoctorsState extends HomeState {}

class GetTopDoctorsInitial extends GetTopDoctorsState {}

class GetTopDoctorsLoading extends GetTopDoctorsState {}

class GetTopDoctorsSuccess extends GetTopDoctorsState {
  final List<TopDoctorEntity> topDoctors;

  GetTopDoctorsSuccess(this.topDoctors);
}

class GetTopDoctorsError extends GetTopDoctorsState {
  final String message;

  GetTopDoctorsError(this.message);
}
