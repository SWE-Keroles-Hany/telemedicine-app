// data/datasources/auth_remote_data_source.dart

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/network/api_constants.dart';
import 'package:telemedicine/core/network/api_services.dart';
import '../models/user_model.dart';
import 'auth_remote_data_source.dart';

class AuthAPIDataSource implements AuthRemoteDataSource {
  final APIServices ApiServices;

  AuthAPIDataSource(this.ApiServices);

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await ApiServices.post(
        endPoint: APICONSTANTS.login,
        queryParams: {"email": email, "password": password},
      );
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<void> register({required UserModel user}) async {
    try {
      await ApiServices.post(
        endPoint: APICONSTANTS.login,
        queryParams: {
          "email": user.email,
          "password": user.password,
          "address": user.address,
          "allergies": user.allergies,
          "existingConditions": user.existingConditions,
          "phoneNumber": user.phoneNumber,
          "gender": user.gender,
          "fullName": user.fullName,
          "bloodType": user.bloodType,
        },
      );
    } on Failure catch (error) {
      throw Failure(message: error.message);
    } catch (_) {
      throw Failure(message: "Some Thing Went Wrong");
    }
  }
}
