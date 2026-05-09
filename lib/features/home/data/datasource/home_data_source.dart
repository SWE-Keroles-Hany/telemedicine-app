import 'package:telemedicine/core/shared_models/doctor/models/doctor_model.dart';

abstract class HomeDataSource {
  Future<List<DoctorModel>> getTopDoctors();
}
