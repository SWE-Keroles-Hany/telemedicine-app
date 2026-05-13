import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telemedicine/core/shared_models/user/entities/user_entity.dart';
import 'package:telemedicine/features/settings/domain/use_cases/get_user_profile.dart';
import 'package:telemedicine/features/settings/domain/use_cases/update_profile.dart';
import 'package:telemedicine/features/settings/domain/use_cases/update_image_profile.dart';
import 'package:telemedicine/features/settings/domain/use_cases/logout.dart';
import 'package:telemedicine/features/settings/domain/use_cases/change_password.dart';
import 'package:telemedicine/features/settings/presentation/cubit/settings_states.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetUserProfileUseCase getUserProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final UpdateImageProfileUseCase updateImageProfileUseCase;
  final LogoutUseCase logoutUseCase;
  final ChangePasswordUseCase changePasswordUseCase;

  SettingsCubit({
    required this.getUserProfileUseCase,
    required this.updateProfileUseCase,
    required this.updateImageProfileUseCase,
    required this.logoutUseCase,
    required this.changePasswordUseCase,
  }) : super(GetUserProfileInitial());

  //! GET USER PROFILE
  Future<void> getUserProfile() async {
    emit(GetUserProfileLoading());

    final result = await getUserProfileUseCase();

    result.fold(
      (failure) => emit(GetUserProfileError(failure.message)),
      (userProfile) => emit(GetUserProfileSuccess(userProfile)),
    );
  }

  //! UPDATE PROFILE
  Future<void> updateProfile({required UserEntity userProfile}) async {
    emit(UpdateProfileLoading());

    final result = await updateProfileUseCase(userProfile: userProfile);

    result.fold(
      (failure) => emit(UpdateProfileError(failure.message)),
      (_) => emit(UpdateProfileSuccess()),
    );
  }

  //! UPDATE IMAGE PROFILE
  Future<void> updateImageProfile({required XFile image}) async {
    emit(UpdateImageProfileLoading());

    final result = await updateImageProfileUseCase(image: image);

    result.fold(
      (failure) => emit(UpdateImageProfileError(failure.message)),
      (_) => emit(UpdateImageProfileSuccess()),
    );
  }

  //! LOGOUT
  Future<void> logout() async {
    emit(LogoutLoading());

    final result = await logoutUseCase();

    result.fold(
      (failure) => emit(LogoutError(failure.message)),
      (_) => emit(LogoutSuccess()),
    );
  }

  //! CHANGE PASSWORD
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(ChangePasswordLoading());

    final result = await changePasswordUseCase(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );

    result.fold(
      (failure) => emit(ChangePasswordError(failure.message)),
      (_) => emit(ChangePasswordSuccess()),
    );
  }
}
