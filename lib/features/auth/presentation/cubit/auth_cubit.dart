// presentation/cubit/auth_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/auth_failure.dart';
import 'package:telemedicine/features/auth/domain/use_cases/login.dart';
import 'package:telemedicine/features/auth/domain/use_cases/register.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_states.dart';

import '../../domain/entities/user_entity.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthCubit({required this.loginUseCase, required this.registerUseCase})
    : super(LoginInitial());

  //! LOGIN
  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    final Either<AuthFailure, UserEntity> result = await loginUseCase(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  //! REGISTER
  Future<void> register(String email, String password) async {
    emit(RegisterLoading());

    final Either<AuthFailure, UserEntity> result = await registerUseCase(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (user) => emit(RegisterSuccess(user)),
    );
  }
}
