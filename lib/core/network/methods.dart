import 'package:dio/dio.dart';

import '../error/failure.dart';

dynamic handleResponse(Response response) {
  if (response.statusCode == 200 || response.statusCode == 201) {
    return response.data;
  }
  final message = (response.data is Map) ? response.data["message"] : null;
  throw Failure(message: message ?? "Something went wrong");
}

Never handleDioError(DioException e) {
  final data = e.response?.data;

  String message = "Something went wrong";

  if (data is Map<String, dynamic>) {
    final serverMessage = data["message"];

    if (serverMessage is String) {
      message = serverMessage;
    } else if (serverMessage is Map) {
      message = serverMessage.values.first.first.toString();
    }
  }

  throw Failure(message: message);
}
