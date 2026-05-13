// data/datasources/auth_remote_data_source.dart

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/network/api_constants.dart';
import '../../../../core/network/dio_services.dart';
import '../../../../core/shared_models/user/models/user_model.dart';
import 'auth_remote_data_source.dart';

class AuthAPIDataSource implements AuthRemoteDataSource {
  final DioServices dioServices;

  AuthAPIDataSource(this.dioServices);
  @override
  Future<void> login({required String email, required String password}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      final response = await dioServices.post(
        endPoint: ApiEndPoints.login,
        data: {"email": email, "password": password},
      );
      final token = response['token'];
      await sharedPreferences.setString("token", token);
    } on Failure catch (error) {
      throw Failure(message: error.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<void> register({required UserModel user}) async {
    try {
      FormData formData = FormData.fromMap({
        "FullName": user.fullName,
        "Email": user.email,
        "Password": user.password,
        "PhoneNumber": user.phoneNumber,
        "Gender": user.gender,
        "DateOfBirth": user.dateOfBirth, // format depends on backend
        "Address": user.address,
        "BloodType": user.bloodType,
        "Allergies": "Allergies",
        "ExistingConditions": "Allergies",
        "ProfilePicture": "",
      });

      await dioServices.post(
        endPoint: ApiEndPoints.registerPatient,
        data: formData,
      );
    } on Failure catch (e) {
      throw Failure(message: e.message);
    }
  }

  @override
  Future<void> forgotPasswordSendCode({required String email}) async {
    try {
      await dioServices.post(
        queryParams: {"email": email},
        endPoint: ApiEndPoints.forgotPasswordSendCode,
      );
    } on Failure catch (error) {
      throw Failure(message: error.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<void> forgotPasswordVerifyCode({
    required String email,
    required String code,
  }) async {
    try {
      await dioServices.post(
        endPoint: ApiEndPoints.forgotPasswordVerifyCode,
        data: {"email": email, "code": code},
      );
    } on Failure catch (error) {
      throw Failure(message: error.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<void> forgotPasswordReset({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      await dioServices.post(
        endPoint: ApiEndPoints.forgotPasswordReset,
        data: {
          "email": email,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword,
        },
      );
    } on Failure catch (error) {
      throw Failure(message: error.message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
