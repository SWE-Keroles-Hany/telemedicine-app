import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import '../entities/appointment.dart';
import '../../data/repo/appointment_repo.dart';

class GetMyAppointmentsUseCase {
  final AppointmentRepo repository;

  GetMyAppointmentsUseCase(this.repository);

  Future<Either<Failure, List<Appointment>>> call({
    required int statusNumber,
  }) async {
    return await repository.getMyAppointments(statusNumber: statusNumber);
  }
}
