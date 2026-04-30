import 'package:telemedicine/features/book_doctor/data/models/doctor_model.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';

extension DoctorModelMapper on DoctorModel {
  DoctorEntity get toEntity => DoctorEntity(
    rateCount: rateCount,
    rate: rate,
    bio: bio,
    clinicAddress: clinicAddress,
    email: email,
    fullName: fullName,
    id: id,
    phoneNumber: phoneNumber,
    profilePictureUrl: profilePictureUrl,
    specialty: specialty,
    yearsOfExperience: yearsOfExperience,
  );
}
