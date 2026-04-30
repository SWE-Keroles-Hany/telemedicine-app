import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/book_doctor/data/repo/doctors_repo.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';

class GetAllDoctorsUseCase {
  final DoctorsRepo doctorsRepo;

  GetAllDoctorsUseCase({required this.doctorsRepo}); 

  Future<Either<Failure,List<DoctorEntity>>> getAllDoctors()async{ 

    
   return await doctorsRepo.getAllDoctors(); 
  }

  

}
