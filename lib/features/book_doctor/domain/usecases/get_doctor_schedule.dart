import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/book_doctor/data/repo/doctors_repo.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_schedule_entity.dart';

class GetDoctorScheduleUseCase {
  final DoctorsRepo doctorsRepo;

  GetDoctorScheduleUseCase({required this.doctorsRepo});

  Future<Either<Failure, List<DoctorScheduleEntity>>> getDoctorSchedule({
    required int doctorId,
  }) async {
    return await doctorsRepo.getDoctorSchedule(
      doctorId: doctorId,
    );
  }
}
