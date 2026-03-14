import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> login({required String email, required String password});

  Future<void> register({required UserModel user});
}
