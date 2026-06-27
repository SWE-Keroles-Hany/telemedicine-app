import 'dart:io';
import 'package:telemedicine/features/check_yourself/data/models/chat_response_model.dart';

abstract class CheckYourselfDataSource {
  Future<ChatResponseModel> sendMessage({
    required int patientId,
    required String message,
    required String route,
    List<File>? files,
  });
  Future<void> deleteHistory({required int patientId});
}
