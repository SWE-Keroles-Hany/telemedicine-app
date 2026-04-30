import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/network/api_constants.dart';
import 'package:telemedicine/core/network/api_services.dart';
import 'package:telemedicine/features/book_doctor/data/datasource/doctors_data_source.dart';
import 'package:telemedicine/features/book_doctor/data/models/doctor_model.dart';

class DoctorsApiDataSource implements DoctorsDataSource {
  DoctorsApiDataSource(this.apiServices);
  final APIServices apiServices;
  @override
  Future<void> bookDoctor({
    required String doctorId,
    required String appoinmentDate,
  }) async {
    try {
      await apiServices.post(
        endPoint: ApiEndPoints.bookDoctor,
        data: {"doctorId": doctorId, "appointmentDate": appoinmentDate},
      );
    } on Failure catch (exception) {
      print("here");
      throw Failure(message: exception.message);
    } catch (e) {
      print(e.toString());
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<List<DoctorModel>> getAllDoctors() async {
    try {
      final List<dynamic> response = await apiServices.get(
        endPoint: ApiEndPoints.doctors,
      );
      final doctors = response
          .map((doctorResponse) => DoctorModel.fromJson(doctorResponse))
          .toList();
      return doctors;
    } on Failure catch (exception) {
      throw Failure(message: exception.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<List<DoctorModel>> getDoctorsBySpeciality({
    required String speciality,
  }) async {
    try {
      final List<dynamic> response = await apiServices.get(
        endPoint: ApiEndPoints.doctorsBySpecialty,
        queryParams: {'Specialty': speciality},
      );

      final doctors = response
          .map((doctorResponse) => DoctorModel.fromJson(doctorResponse))
          .toList();
      return doctors;
    } on Failure catch (exception) {
      throw Failure(message: exception.message);
    } catch (e) {
      print(e.toString());
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<List<DoctorModel>> getDoctorByName({required String name}) async {
    try {
      final List<dynamic> response = await apiServices.get(
        endPoint: ApiEndPoints.getDoctorByName,
        queryParams: {'name': name},
      );
      final doctors = response
          .map((doctorResponse) => DoctorModel.fromJson(doctorResponse))
          .toList();
      return doctors;
    } on Failure catch (exception) {
      throw Failure(message: exception.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<List<String>> getSpecialties() async {
    try {
      final List<dynamic> response = await apiServices.get(
        endPoint: ApiEndPoints.specialties,
      );

      return response.map((speciality) => speciality.toString()).toList();
    } on Failure catch (exception) {
      throw Failure(message: exception.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
