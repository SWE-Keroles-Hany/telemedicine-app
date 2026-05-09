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

// ----- UPDATE IMAGE PROFILE STATES -----
abstract class UpdateImageProfileState extends SettingsState {}

class UpdateImageProfileInitial extends UpdateImageProfileState {}

class UpdateImageProfileLoading extends UpdateImageProfileState {}

class UpdateImageProfileSuccess extends UpdateImageProfileState {
  UpdateImageProfileSuccess();
}

class UpdateImageProfileError extends UpdateImageProfileState {
  final String message;

  UpdateImageProfileError(this.message);
}

// ----- LOGOUT STATES -----
abstract class LogoutState extends SettingsState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {
  LogoutSuccess();
}

class LogoutError extends LogoutState {
  final String message;

  LogoutError(this.message);
}
