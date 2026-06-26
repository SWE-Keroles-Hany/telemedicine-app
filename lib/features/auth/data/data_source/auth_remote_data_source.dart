import '../../../../core/shared_models/user/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> login({required String email, required String password});

  Future<void> register({required UserModel user});

  Future<void> forgotPasswordSendCode({required String email});

  Future<void> forgotPasswordVerifyCode({
    required String email,
    required String code,
  });

  Future<void> forgotPasswordReset({
    required String email,
    required String newPassword,
    required String confirmPassword,
  });

  Future<bool> isUserLogged();
}
