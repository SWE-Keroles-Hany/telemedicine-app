import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';

abstract class DoctorsRepo {
  Future<Either<Failure, List<DoctorEntity>>> getAllDoctors();
  Future<Either<Failure, List<DoctorEntity>>> getDoctorsBySpeciality({
    required String speciality,
  });
  Future<Either<Failure, List<DoctorEntity>>> getDoctorByName({
    required String name,
  });
  Future<Either<Failure, List<String>>> getSpecialties();
  Future<Either<Failure, void>> bookDoctor({
    required int doctorId,
    required String appoinmentDate,
  });
}
