import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/check_yourself/data/datasource/check_yourself_data_source.dart';
import 'package:telemedicine/features/check_yourself/data/repo/check_yourself_repo.dart';
import 'package:telemedicine/features/check_yourself/domain/entities/chat_response_entity.dart';

class CheckYourselfRepoImp implements CheckYourselfRepo {
  final CheckYourselfDataSource _checkYourselfDataSource;

  CheckYourselfRepoImp(this._checkYourselfDataSource);

  @override
  Future<Either<Failure, ChatResponseEntity>> sendMessage({
    required int patientId,
    required String message,
    required String route,
    List<File>? files,
  }) async {
    try {
      final chatResponseModel = await _checkYourselfDataSource.sendMessage(
        patientId: patientId,
        message: message,
        route: route,
        files: files,
      );
      return Right(chatResponseModel.toEntity);
    } on Failure catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteHistory({required int patientId}) async {
    try {
      await _checkYourselfDataSource.deleteHistory(patientId: patientId);
      return Right(null);
    } on Failure catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
