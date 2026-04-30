import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/book_doctor/data/repo/doctors_repo.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';

class GetDoctorByNameUseCase {
  final DoctorsRepo doctorsRepo;

  GetDoctorByNameUseCase({required this.doctorsRepo}); 

  Future<Either<Failure, List<DoctorEntity>>> getDoctorByName({
    required String name,
  }) async {
    return await doctorsRepo.getDoctorByName(name: name);
  }
}
