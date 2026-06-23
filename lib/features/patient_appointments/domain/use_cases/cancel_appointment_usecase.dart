import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import '../../data/repo/appointment_repo.dart';

class CancelAppointmentUseCase {
  final AppointmentRepo repository;

  CancelAppointmentUseCase(this.repository);

  Future<Either<Failure, void>> call({required int appointmentId}) async {
    return await repository.cancelAppointment(appointmentId: appointmentId);
  }
}
