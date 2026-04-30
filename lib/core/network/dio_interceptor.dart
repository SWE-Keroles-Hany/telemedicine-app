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
    final token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFhYWExMUBnbWFpbC5jb20iLCJuYW1lIjoiYWFhYTExQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiYzIxNDgwNjMtNTVlZS00NDZhLWI3NWItN2FiNTdmMTVhZjdjIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiUGF0aWVudCIsImV4cCI6MTc3NzU2OTM5OCwiaXNzIjoiVGVsZW1lZGljaW5lQXBwIiwiYXVkIjoiVGVsZW1lZGljaW5lQXBwVXNlcnMifQ.WkxbZziLPfcjAziftsBmNXDxIflxM4IHzG0Hf--U6-A";
    log("token  $token");
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
