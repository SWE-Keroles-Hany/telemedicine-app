import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/book_doctor/data/repo/doctors_repo.dart';

class GetSpecialtiesUseCase {
  final DoctorsRepo doctorsRepo;

  GetSpecialtiesUseCase({required this.doctorsRepo});

  Future<Either<Failure, List<String>>> getSpecialties() async {
    
    return await doctorsRepo.getSpecialties();
  }
}
