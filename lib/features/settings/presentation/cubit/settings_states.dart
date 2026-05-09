import 'package:telemedicine/core/shared_models/user/entities/user_entity.dart';

abstract class SettingsState {}

// ----- GET USER PROFILE STATES -----
abstract class GetUserProfileState extends SettingsState {}

class GetUserProfileInitial extends GetUserProfileState {}

class GetUserProfileLoading extends GetUserProfileState {}

class GetUserProfileSuccess extends GetUserProfileState {
  final UserEntity userProfile;

  GetUserProfileSuccess(this.userProfile);
}

class GetUserProfileError extends GetUserProfileState {
  final String message;

  GetUserProfileError(this.message);
}

// ----- UPDATE PROFILE STATES -----
abstract class UpdateProfileState extends SettingsState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  UpdateProfileSuccess();
}

class UpdateProfileError extends UpdateProfileState {
  final String message;

  UpdateProfileError(this.message);
}
