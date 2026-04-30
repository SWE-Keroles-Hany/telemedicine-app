import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/home/data/repo/home_repo.dart';
import 'package:telemedicine/features/home/domain/entities/top_doctor_entity.dart';

class GetTopDoctorsUseCase {
  final HomeRepo homeRepo;

  GetTopDoctorsUseCase({required this.homeRepo});

  Future<Either<Failure, List<TopDoctorEntity>>> getTopDoctors() async {
    return await homeRepo.getTopDoctors();
  }
}
