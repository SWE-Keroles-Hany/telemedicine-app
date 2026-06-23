import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    // final token = sharedPreferences.getString("token");
    final token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imtsa2wxQGdtYWlsLmNvbSIsIm5hbWUiOiJrbGtsMUBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijk5YTg1Y2EzLWY2MWQtNDc0ZC1hNTNlLWM0NWEzMjA2OTNlYyIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlBhdGllbnQiLCJleHAiOjE3ODIyMTg5ODksImlzcyI6IlRlbGVtZWRpY2luZUFwcCIsImF1ZCI6IlRlbGVtZWRpY2luZUFwcFVzZXJzIn0.u40d-_7aKON4MfATfQJL4cvHAHMJsp8p3YsOVWA4a-Y";
    log("token  $token");
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
