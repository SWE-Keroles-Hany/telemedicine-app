import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../error/failure.dart';

dynamic handleResponse(Response response) {
  String? message = "Some Thing Went Wrong";
  if (response.statusCode == 200 || response.statusCode == 201) {
    debugPrint("Response data: ${response.data}");
    return response.data;
  }

  throw Failure(message: message);
}

Never handleDioError(DioException e) {
  final r = e.response?.data;
  final r2 = r['errors'];

  print(r.toString());
  String message = "Something went wrong";
  if (r is List) {
    message = r[0]['description'];
  } else if (r2 is Map) {
    message = r2.values.first.toString();
  }
  throw Failure(message: message);
}
