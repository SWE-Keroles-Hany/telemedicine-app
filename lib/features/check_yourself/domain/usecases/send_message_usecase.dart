import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/check_yourself/data/repo/check_yourself_repo.dart';
import 'package:telemedicine/features/check_yourself/domain/entities/chat_response_entity.dart';

class SendMessageUseCase {
  final CheckYourselfRepo checkYourselfRepo;

  SendMessageUseCase({required this.checkYourselfRepo});

  Future<Either<Failure, ChatResponseEntity>> sendMessage({
    required int patientId,
    required String message,
    required String route,
    List<File>? files,
  }) async {
    return await checkYourselfRepo.sendMessage(
      patientId: patientId,
      message: message,
      route: route,
      files: files,
    );
  }
}
