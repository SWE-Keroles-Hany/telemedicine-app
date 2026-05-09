import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/core/shared_models/user/entities/user_entity.dart';
import 'package:telemedicine/features/settings/domain/use_cases/get_user_profile.dart';
import 'package:telemedicine/features/settings/domain/use_cases/update_profile.dart';
import 'package:telemedicine/features/settings/presentation/cubit/settings_states.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetUserProfileUseCase getUserProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  SettingsCubit({
    required this.getUserProfileUseCase,
    required this.updateProfileUseCase,
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
}
