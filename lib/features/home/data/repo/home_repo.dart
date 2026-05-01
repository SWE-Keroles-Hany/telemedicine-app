import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<DoctorEntity>>> getTopDoctors();
}
