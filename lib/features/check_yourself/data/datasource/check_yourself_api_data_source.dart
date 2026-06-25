import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/network/api_constants.dart';
import 'package:telemedicine/features/check_yourself/data/datasource/check_yourself_data_source.dart';
import 'package:telemedicine/features/check_yourself/data/models/chat_response_model.dart';

class CheckYourselfApiDataSource implements CheckYourselfDataSource {
  final Dio _dio;

  CheckYourselfApiDataSource(this._dio);

  @override
  Future<ChatResponseModel> sendMessage({
    required int patientId,
    required String message,
    required String route,
    List<File>? files,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "id": patientId,
        "message": message,
        "route": route,
      });

      if (files != null && files.isNotEmpty) {
        for (File file in files) {
          formData.files.add(
            MapEntry(
              "files",
              await MultipartFile.fromFile(
                file.path,
                filename: file.path.split('/').last,
              ),
            ),
          );
        }
      }

      final response = await _dio.post(
        "${ApiEndPoints.chatBaseURL}${ApiEndPoints.chat}",
        data: formData,
      );
      log("sendMessage: ${response.data['response']}");

      return ChatResponseModel.fromJson(response.data);
    } on DioException catch (exception) {
      final message =
          exception.response?.data['description']?.toString() ??
          exception.message ??
          "Something went wrong";
      throw Failure(message: message);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
