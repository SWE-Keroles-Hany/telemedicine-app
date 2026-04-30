import '../models/appointment_model.dart';

abstract class AppointmentRemoteDataSource {
  Future<List<AppointmentModel>> getMyAppointments({required int statusNumber});
}
