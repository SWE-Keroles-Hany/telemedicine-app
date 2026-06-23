import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/network/api_constants.dart';
import 'package:telemedicine/core/network/api_services.dart';
import 'package:telemedicine/core/shared_models/medical_history/models/medical_history_model.dart';
import 'package:telemedicine/features/medical_history/data/datasource/medical_history_data_source.dart';

class MedicalHistoryApiDataSource implements MedicalHistoryDataSource {
  MedicalHistoryApiDataSource(this.apiServices);
  final APIServices apiServices;

  @override
  Future<List<MedicalHistoryModel>> getMedicalHistory() async {
    try {
      final List<dynamic> response = await apiServices.get(
        endPoint: ApiEndPoints.medicalHistory,
      );
      final medicalHistory = response
          .map((record) => MedicalHistoryModel.fromJson(record))
          .toList();

      return medicalHistory;
    } on Failure catch (exception) {
      throw Failure(message: exception.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<void> rateDoctor({
    required int doctorId,
    required int starts,
    required int medicalRecordId,
  }) async {
    try {
      await apiServices.post(
        endPoint: ApiEndPoints.rateDoctor,
        data: {
          'doctorId': doctorId,
          'stars': starts,
          'medicalRecordId': medicalRecordId,
        },
      );
    } on Failure catch (exception) {
      throw Failure(message: exception.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
