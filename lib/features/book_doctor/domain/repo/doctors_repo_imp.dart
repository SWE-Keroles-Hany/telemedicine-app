import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/core/shared_models/doctor/mapper/doctor_model_mapper.dart';
import 'package:telemedicine/core/shared_models/doctor/models/doctor_model.dart';
import 'package:telemedicine/features/book_doctor/data/datasource/doctors_data_source.dart';
import 'package:telemedicine/features/book_doctor/data/repo/doctors_repo.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';

class DoctorsRepoImp implements DoctorsRepo {
  final DoctorsDataSource _doctorsDataSoruce;

  DoctorsRepoImp(this._doctorsDataSoruce);

  @override
  Future<Either<Failure, void>> bookDoctor({
    required String doctorId,
    required String appoinmentDate,
  }) async {
    try {
      await _doctorsDataSoruce.bookDoctor(
        doctorId: doctorId,
        appoinmentDate: appoinmentDate,
      );
      return Right(null);
    } on Failure catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getAllDoctors() async {
    try {
      List<DoctorModel> doctorsModel = await _doctorsDataSoruce.getAllDoctors();
      final doctors = doctorsModel.map((doctor) => doctor.toEntity).toList();

      return Right(doctors);
    } on Failure catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctorsBySpeciality({
    required String speciality,
  }) async {
    try {
      final List<DoctorModel> doctorsModel = await _doctorsDataSoruce
          .getDoctorsBySpeciality(speciality: speciality);
      final doctors = doctorsModel.map((doctor) => doctor.toEntity).toList();

      return Right(doctors);
    } on Failure catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctorByName({
    required String name,
  }) async {
    try {
      final List<DoctorModel> doctorsModel = await _doctorsDataSoruce
          .getDoctorByName(name: name);
      final doctors = doctorsModel.map((doctor) => doctor.toEntity).toList();

      return Right(doctors);
    } on Failure catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getSpecialties() async {
    try {
      final specialties = await _doctorsDataSoruce.getSpecialties();
      if (specialties[0] != 'All') {
        specialties.insert(0, "All");
      }
      return Right(specialties);
    } on Failure catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
