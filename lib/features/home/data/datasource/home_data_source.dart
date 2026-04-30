import 'package:telemedicine/features/home/data/models/top_doctor_model.dart';

abstract class HomeDataSource {
  Future<List<TopDoctorModel>> getTopDoctors();
}
