import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telemedicine/features/auth/presentation/screens/login_screen.dart';

class DioInterceptors extends Interceptor {
  final GlobalKey<NavigatorState>? navigatorKey;

  DioInterceptors({this.navigatorKey});
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final token = sharedPreferences.getString("token");
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.remove("token");

      if (navigatorKey?.currentContext != null) {
        navigatorKey?.currentState?.pushNamedAndRemoveUntil(
          LoginScreen.routeName,
          (route) => false,
        );
      }
    }
    super.onError(err, handler);
  }
}
