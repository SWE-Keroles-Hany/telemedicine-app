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
    final token = sharedPreferences.getString("token");
    // final token =
    // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im5qbmpAZ21haWwuY29tIiwibmFtZSI6Im5qbmpAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJmMmEwZTQzMy0xZjQyLTQyMWEtYTQ1Yi0yYWNhYjViMTI3MzgiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJQYXRpZW50IiwiZXhwIjoxNzgyMjUyNzY4LCJpc3MiOiJUZWxlbWVkaWNpbmVBcHAiLCJhdWQiOiJUZWxlbWVkaWNpbmVBcHBVc2VycyJ9.6OPx1Gf8P0UK206bAcT36vlxTv1p_UpmpUJdyjgvw-Y";
    log("token  $token");
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
