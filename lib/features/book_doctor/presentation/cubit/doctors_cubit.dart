import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/features/book_doctor/domain/usecases/book_doctor.dart';
import 'package:telemedicine/features/book_doctor/domain/usecases/get_all_doctors.dart';
import 'package:telemedicine/features/book_doctor/domain/usecases/get_doctor_by_name.dart';
import 'package:telemedicine/features/book_doctor/domain/usecases/get_doctors_by_speciality.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/doctors_states.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final GetAllDoctorsUseCase getAllDoctorsUseCase;
  final GetDoctorsBySpecialityUseCase getDoctorsBySpecialityUseCase;
  final GetDoctorByNameUseCase getDoctorByNameUseCase;
  final BookDoctorUseCase bookDoctorUseCase;

  DoctorsCubit({
    required this.getAllDoctorsUseCase,
    required this.getDoctorsBySpecialityUseCase,
    required this.getDoctorByNameUseCase,
    required this.bookDoctorUseCase,
  }) : super(GetDoctorsInitial());

  Future<void> getAllDoctors() async {
    emit(GetDoctorsLoading());

    final result = await getAllDoctorsUseCase.getAllDoctors();

    result.fold(
      (failure) => emit(GetDoctorsError(failure.message)),
      (doctors) => emit(GetDoctorsSuccess(doctors)),
    );
  }

  Future<void> getDoctorsBySpeciality({required String speciality}) async {
    emit(GetDoctorsLoading());

    final result = await getDoctorsBySpecialityUseCase.getDoctorsBySpeciality(
      speciality: speciality,
    );

    result.fold(
      (failure) => emit(GetDoctorsError(failure.message)),
      (doctors) => emit(GetDoctorsSuccess(doctors)),
    );
  }

  Future<void> getDoctorByName({required String name}) async {
    emit(GetDoctorsLoading());

    final result = await getDoctorByNameUseCase.getDoctorByName(name: name);

    result.fold(
      (failure) => emit(GetDoctorsError(failure.message)),
      (doctors) => emit(GetDoctorsSuccess(doctors)),
    );
  }

  Future<void> bookDoctor({
    required String appoinmentDate,
    required String doctorId,
  }) async {
    emit(BookDoctorLoading());

    final result = await bookDoctorUseCase.bookDoctor(
      appoinmentDate: appoinmentDate,
      doctorId: doctorId,
    );

    result.fold(
      (failure) => emit(BookDoctorError(failure.message)),
      (_) => emit(BookDoctorSuccess()),
    );
  }
}
