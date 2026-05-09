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
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZsdXR0ZXJAZ21haWwuY29tIiwibmFtZSI6ImZsdXR0ZXJAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI0YjRkYmE0Yi1iZmZiLTQ1MzctOGE1Ni1kNjhkMDE3ZjQ2NWEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJQYXRpZW50IiwiZXhwIjoxNzc4MzM5NTQ4LCJpc3MiOiJUZWxlbWVkaWNpbmVBcHAiLCJhdWQiOiJUZWxlbWVkaWNpbmVBcHBVc2VycyJ9.SVPRMeoACqOqJxMvzMl5JkEd_pLUE955QZX-FDvNhfs";
    // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFhYWExMUBnbWFpbC5jb20iLCJuYW1lIjoiYWFhYTExQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiYzIxNDgwNjMtNTVlZS00NDZhLWI3NWItN2FiNTdmMTVhZjdjIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiUGF0aWVudCIsImV4cCI6MTc3ODMzODQ4OCwiaXNzIjoiVGVsZW1lZGljaW5lQXBwIiwiYXVkIjoiVGVsZW1lZGljaW5lQXBwVXNlcnMifQ.nup_gmHrWkRnfBHuRlmJcjLjRfvN7ZfL6S_LVXWOy94";
    log("token  $token");
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
