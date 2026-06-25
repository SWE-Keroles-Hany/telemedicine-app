import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/check_yourself/domain/entities/chat_response_entity.dart';

abstract class CheckYourselfRepo {
  Future<Either<Failure, ChatResponseEntity>> sendMessage({
    required int patientId,
    required String message,
    required String route,
    List<File>? files,
  });
}
