import 'package:telemedicine/features/home/data/models/top_doctor_model.dart';
import 'package:telemedicine/features/home/domain/entities/top_doctor_entity.dart';

extension TopDoctorModelMapper on TopDoctorModel {
  TopDoctorEntity get toEntity {
    return TopDoctorEntity(
      id: id,
      name: name,
      specialty: specialty,
      rate: rate,
      pictureUrl: pictureUrl,
    );
  }
}
