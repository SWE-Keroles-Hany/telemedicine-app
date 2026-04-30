import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/home/data/datasource/home_data_source.dart';
import 'package:telemedicine/features/home/data/mapper/top_doctor_model_mapper.dart';
import 'package:telemedicine/features/home/data/models/top_doctor_model.dart';
import 'package:telemedicine/features/home/data/repo/home_repo.dart';
import 'package:telemedicine/features/home/domain/entities/top_doctor_entity.dart';

class HomeRepoImp implements HomeRepo {
  final HomeDataSource _homeDataSource;

  HomeRepoImp(this._homeDataSource);

  @override
  Future<Either<Failure, List<TopDoctorEntity>>> getTopDoctors() async {
    try {
      List<TopDoctorModel> topDoctorsModel = await _homeDataSource.getTopDoctors();
      final topDoctors = topDoctorsModel.map((doctor) => doctor.toEntity).toList();

      return Right(topDoctors);
    } on Failure catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
