import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';

import '../../domain/entities/appointment.dart';

abstract class AppointmentRepo {
  Future<Either<Failure, List<Appointment>>> getMyAppointments({
    required int statusNumber,
  });
  Future<Either<Failure, void>> cancelAppointment({required int appointmentId});
}
