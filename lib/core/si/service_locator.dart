import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:telemedicine/features/book_doctor/data/datasource/doctors_api_data_source.dart';
import 'package:telemedicine/features/book_doctor/data/datasource/doctors_data_source.dart';
import 'package:telemedicine/features/book_doctor/data/repo/doctors_repo.dart';
import 'package:telemedicine/features/book_doctor/domain/repo/doctors_repo_imp.dart';
import 'package:telemedicine/features/book_doctor/domain/usecases/book_doctor.dart';
import 'package:telemedicine/features/book_doctor/domain/usecases/get_all_doctors.dart';
import 'package:telemedicine/features/book_doctor/domain/usecases/get_doctor_by_name.dart';
import 'package:telemedicine/features/book_doctor/domain/usecases/get_doctors_by_speciality.dart';
import 'package:telemedicine/features/book_doctor/domain/usecases/get_specialties.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/doctors_cubit.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/specialties_cubit.dart';
import 'package:telemedicine/features/patient_appointments/data/data_source/appointment_api_data_source.dart';
import 'package:telemedicine/features/patient_appointments/data/data_source/appointment_remote_data_source.dart';
import 'package:telemedicine/features/patient_appointments/data/repo/appointment_repo.dart';
import 'package:telemedicine/features/patient_appointments/domain/repo/appointment_repo_impl.dart';
import 'package:telemedicine/features/patient_appointments/domain/use_cases/get_my_appointments_usecase.dart';
import 'package:telemedicine/features/patient_appointments/presentation/cubit/appointment_cubit.dart';

import '../../features/auth/data/data_source/auth_api_data_source.dart';
import '../../features/auth/data/data_source/auth_remote_data_source.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/domain/repo/auth_repo_imp.dart';
import '../../features/auth/domain/use_cases/login.dart';
import '../../features/auth/domain/use_cases/register.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../network/api_services.dart';
import '../network/dio_services.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Core
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<DioServices>(DioServices(sl<Dio>()));
  sl.registerSingleton<APIServices>(sl<DioServices>());

  //! Data Source
  sl.registerSingleton<AuthRemoteDataSource>(AuthAPIDataSource(sl<DioServices>()));
  sl.registerSingleton<DoctorsDataSource>(
    DoctorsApiDataSource(sl<APIServices>()),
  );
  sl.registerSingleton<AppointmentRemoteDataSource>(
    AppointmentAPIDataSource(sl<DioServices>()),
  );

  //! Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl<AuthRemoteDataSource>()));
  sl.registerSingleton<DoctorsRepo>(DoctorsRepoImp(sl<DoctorsDataSource>()));
  sl.registerSingleton<AppointmentRepo>(
    AppointmentRepoImpl(sl<AppointmentRemoteDataSource>()),
  );

  //! UseCases
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl<AuthRepository>()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl<AuthRepository>()));
  sl.registerSingleton<GetAllDoctorsUseCase>(
    GetAllDoctorsUseCase(doctorsRepo: sl<DoctorsRepo>()),
  );
  sl.registerSingleton<BookDoctorUseCase>(
    BookDoctorUseCase(doctorsRepo: sl<DoctorsRepo>()),
  );
  sl.registerSingleton<GetDoctorsBySpecialityUseCase>(
    GetDoctorsBySpecialityUseCase(doctorsRepo: sl<DoctorsRepo>()),
  );
  sl.registerSingleton<GetSpecialtiesUseCase>(
    GetSpecialtiesUseCase(doctorsRepo: sl<DoctorsRepo>()),
  );
  sl.registerSingleton<GetMyAppointmentsUseCase>(
    GetMyAppointmentsUseCase(sl<AppointmentRepo>()),
  );

  //! Cubit
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      loginUseCase: sl<LoginUseCase>(),
      registerUseCase: sl<RegisterUseCase>(),
    ),
  );
  sl.registerSingleton<GetDoctorByNameUseCase>(
    GetDoctorByNameUseCase(doctorsRepo: sl<DoctorsRepo>()),
  );
  sl.registerFactory<DoctorsCubit>(
    () => DoctorsCubit(
      getAllDoctorsUseCase: sl<GetAllDoctorsUseCase>(),
      getDoctorsBySpecialityUseCase: sl<GetDoctorsBySpecialityUseCase>(),
      getDoctorByNameUseCase: sl<GetDoctorByNameUseCase>(),
      bookDoctorUseCase: sl<BookDoctorUseCase>(),
    ),
  );
  sl.registerFactory<SpecialtiesCubit>(
    () => SpecialtiesCubit(getSpecialtiesUseCase: sl<GetSpecialtiesUseCase>()),
  );
  sl.registerFactory<AppointmentCubit>(
    () => AppointmentCubit(
      getMyAppointmentsUseCase: sl<GetMyAppointmentsUseCase>(),
    ),
  );
}
