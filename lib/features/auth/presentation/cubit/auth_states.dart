// presentation/cubit/auth_state.dart

abstract class AuthState {}

// ----- LOGIN STATES -----
abstract class LoginState extends AuthState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginSuccess();
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
  RegisterSuccess();
}

class RegisterError extends RegisterState {
  final String message;

  RegisterError(this.message);
}
