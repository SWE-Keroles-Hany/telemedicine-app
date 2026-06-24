import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/book_doctor/data/repo/doctors_repo.dart';

class BookDoctorUseCase {
  final DoctorsRepo doctorsRepo;

  BookDoctorUseCase({required this.doctorsRepo});

  Future<Either<Failure, void>> bookDoctor({
    required String appoinmentDate,
    required int doctorId,
  }) async {
    return await doctorsRepo.bookDoctor(
      appoinmentDate: appoinmentDate,
      doctorId: doctorId,
    );
  }
}
