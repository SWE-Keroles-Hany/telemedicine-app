import 'package:telemedicine/core/shared_models/user/models/user_model.dart';

abstract class SettingsRemoteDataSource {
  Future<UserModel> getUserProfile();
  Future<void> updateProfile({required UserModel userProfile});
}
