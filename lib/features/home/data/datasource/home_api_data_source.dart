import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/network/api_constants.dart';
import 'package:telemedicine/core/network/api_services.dart';
import 'package:telemedicine/core/shared_models/doctor/models/doctor_model.dart';
import 'package:telemedicine/features/home/data/datasource/home_data_source.dart';

class HomeApiDataSource implements HomeDataSource {
  HomeApiDataSource(this.apiServices);
  final APIServices apiServices;

  @override
  Future<List<DoctorModel>> getTopDoctors() async {
    try {
      final List<dynamic> response = await apiServices.get(
        endPoint: ApiEndPoints.topDoctors,
      );
      final topDoctors = response
          .map((doctorResponse) => DoctorModel.fromJson(doctorResponse))
          .toList();

      return topDoctors;
    } on Failure catch (exception) {
      throw Failure(message: exception.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
