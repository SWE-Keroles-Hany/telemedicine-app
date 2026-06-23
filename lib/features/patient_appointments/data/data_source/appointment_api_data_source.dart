import 'package:dio/dio.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/network/api_constants.dart';
import '../../../../core/network/dio_services.dart';
import '../models/appointment_model.dart';
import 'appointment_remote_data_source.dart';

class AppointmentAPIDataSource implements AppointmentRemoteDataSource {
  final DioServices dioServices;

  AppointmentAPIDataSource(this.dioServices);

  @override
  Future<List<AppointmentModel>> getMyAppointments({
    required int statusNumber,
  }) async {
    try {
      final List<dynamic> response = await dioServices.get(
        queryParams: {'status': statusNumber},
        endPoint: ApiEndPoints.myAppointments,
      );

      return response.map((json) => AppointmentModel.fromJson(json)).toList();
    } on Failure catch (error) {
      throw Failure(message: error.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<void> cancelAppointment({required int appointmentId}) async {
    FormData formData = FormData.fromMap({"appointmentId": appointmentId});
    try {
      await dioServices.patch(
        data: formData,
        endPoint: ApiEndPoints.cancelAppointment,
      );
    } on Failure catch (error) {
      throw Failure(message: error.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
