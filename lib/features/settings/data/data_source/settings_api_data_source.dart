import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/network/api_constants.dart';
import 'package:telemedicine/core/shared_models/user/models/user_model.dart';
import '../../../../core/network/dio_services.dart';
import 'settings_remote_data_source.dart';

class SettingsAPIDataSource implements SettingsRemoteDataSource {
  final DioServices dioServices;

  SettingsAPIDataSource(this.dioServices);

  @override
  Future<UserModel> getUserProfile() async {
    try {
      final response = await dioServices.get(
        endPoint: ApiEndPoints.patientProfile,
      );
      return UserModel.fromJson(response);
    } on Failure catch (error) {
      print("here1 ${error.message}");
      throw Failure(message: error.message);
    } catch (e) {
      print("here2 ${e.toString()}");

      throw Failure(message: e.toString());
    }
  }

  @override
  Future<void> updateProfile({required UserModel userProfile}) async {
    try {
      await dioServices.patch(
        endPoint: ApiEndPoints.updateProfile,
        data: userProfile.toJson(),
      );
    } on Failure catch (error) {
      throw Failure(message: error.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
