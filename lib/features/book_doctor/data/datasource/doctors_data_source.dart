import 'package:telemedicine/features/book_doctor/data/models/doctor_model.dart';

abstract class DoctorsDataSource {
  Future<List<DoctorModel>> getAllDoctors();
  Future<List<DoctorModel>> getDoctorsBySpeciality({
    required String speciality,
  });
  Future<List<DoctorModel>> getDoctorByName({required String name});
  Future<List<String>> getSpecialties();
  Future<void> bookDoctor({
    required String doctorId,
    required String appoinmentDate,
  });
}
