// data/datasources/auth_remote_data_source.dart

import 'dart:developer';

import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/network/api_constants.dart';
import '../../../../core/network/dio_services.dart';
import '../models/user_model.dart';
import 'auth_remote_data_source.dart';

class AuthAPIDataSource implements AuthRemoteDataSource {
  final DioServices dioServices;

  AuthAPIDataSource(this.dioServices);

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await dioServices.post(
        endPoint: APICONSTANTS.login,
        data: {"email": email, "password": password},
      );
    } on Failure catch (error) {
      throw Failure(message: error.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<void> register({required UserModel user}) async {
    try {
      await dioServices.post(
        endPoint: APICONSTANTS.registerPatient,
        data: user.toJson(),
      );
    } on Failure catch (error) {
      log(error.message);
      throw Failure(message: error.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
