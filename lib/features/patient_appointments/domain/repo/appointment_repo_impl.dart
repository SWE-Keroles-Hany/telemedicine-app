import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/patient_appointments/data/data_source/appointment_remote_data_source.dart';
import 'package:telemedicine/features/patient_appointments/data/mapper/appointment_model_mapper.dart';
import 'package:telemedicine/features/patient_appointments/data/models/appointment_model.dart';
import 'package:telemedicine/features/patient_appointments/domain/entities/appointment.dart';
import '../../data/repo/appointment_repo.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final AppointmentRemoteDataSource _remoteDataSource;

  AppointmentRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Appointment>>> getMyAppointments({
    required int statusNumber,
  }) async {
    try {
      final List<AppointmentModel> appointmentModels = await _remoteDataSource
          .getMyAppointments(statusNumber: statusNumber);
      final appointments = appointmentModels
          .map((model) => model.toEntity)
          .toList();

      return Right(appointments);
    } on Failure catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cancelAppointment({
    required int appointmentId,
  }) async {
    try {
      await _remoteDataSource.cancelAppointment(appointmentId: appointmentId);
      return const Right(null);
    } on Failure catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
