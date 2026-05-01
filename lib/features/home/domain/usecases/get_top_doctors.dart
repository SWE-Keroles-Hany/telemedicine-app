import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';
import 'package:telemedicine/features/home/data/repo/home_repo.dart';

class GetTopDoctorsUseCase {
  final HomeRepo homeRepo;

  GetTopDoctorsUseCase({required this.homeRepo});

  Future<Either<Failure, List<DoctorEntity>>> getTopDoctors() async {
    return await homeRepo.getTopDoctors();
  }
}
