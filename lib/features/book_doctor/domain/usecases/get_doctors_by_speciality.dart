import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/book_doctor/data/repo/doctors_repo.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';

class GetDoctorsBySpecialityUseCase {
  final DoctorsRepo doctorsRepo;

  GetDoctorsBySpecialityUseCase({required this.doctorsRepo});

  Future<Either<Failure, List<DoctorEntity>>> getDoctorsBySpeciality({
    required String speciality,
  }) async {
    return await doctorsRepo.getDoctorsBySpeciality(speciality: speciality);
  }
}
