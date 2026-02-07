// presentation/cubit/auth_state.dart
import '../../domain/entities/user_entity.dart';

abstract class AuthState {}

// ----- LOGIN STATES -----
abstract class LoginState extends AuthState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity user;

  LoginSuccess(this.user);
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}

// ----- REGISTER STATES -----
abstract class RegisterState extends AuthState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final UserEntity user;

  RegisterSuccess(this.user);
}

class RegisterError extends RegisterState {
  final String message;

  RegisterError(this.message);
}
