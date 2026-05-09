// presentation/cubit/auth_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:telemedicine/features/auth/domain/use_cases/login.dart';
import 'package:telemedicine/features/auth/domain/use_cases/register.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_states.dart';

import '../../../../core/shared_models/user/entities/user_entity.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthCubit({required this.loginUseCase, required this.registerUseCase})
    : super(LoginInitial());

  //! LOGIN
  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    final result = await loginUseCase(email: email, password: password);

    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (_) => emit(LoginSuccess()),
    );
  }

  //! REGISTER
  Future<void> register({required UserEntity user}) async {
    emit(RegisterLoading());

    final result = await registerUseCase(user: user);

    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (user) => emit(RegisterSuccess()),
    );
  }
}
