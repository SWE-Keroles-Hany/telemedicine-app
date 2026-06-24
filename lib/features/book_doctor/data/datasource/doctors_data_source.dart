import 'package:telemedicine/core/shared_models/doctor/models/doctor_model.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_schedule_entity.dart';

abstract class DoctorsDataSource {
  Future<List<DoctorModel>> getAllDoctors();
  Future<List<DoctorModel>> getDoctorsBySpeciality({
    required String speciality,
  });
  Future<List<DoctorModel>> getDoctorByName({required String name});
  Future<List<String>> getSpecialties();
  Future<void> bookDoctor({
    required int doctorId,
    required String appoinmentDate,
  });
  Future<List<DoctorScheduleEntity>> getDoctorSchedule({required int doctorId});
}
