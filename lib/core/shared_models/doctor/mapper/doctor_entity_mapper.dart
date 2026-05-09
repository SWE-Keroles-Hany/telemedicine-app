import 'package:telemedicine/core/shared_models/doctor/models/doctor_model.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';

extension DoctorEntityMapper on DoctorEntity {
  DoctorModel get toEntity => DoctorModel(
    rate: rate,
    rateCount: rateCount,
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
