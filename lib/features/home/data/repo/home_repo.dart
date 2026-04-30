import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/home/domain/entities/top_doctor_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<TopDoctorEntity>>> getTopDoctors();
}
