// core/di/service_locator.dart
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:telemedicine/features/auth/data/data_source/auth_firebase_data_source.dart';
import 'package:telemedicine/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:telemedicine/features/auth/data/repo/auth_repo.dart';
import 'package:telemedicine/features/auth/domain/repo/auth_repo_imp.dart';
import 'package:telemedicine/features/auth/domain/use_cases/login.dart';
import 'package:telemedicine/features/auth/domain/use_cases/register.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_cubit.dart';

final sl = GetIt.instance; // Service Locator

Future<void> init() async {
  //! ------------------ Cubit ------------------
  sl.registerFactory(
    () => AuthCubit(loginUseCase: sl(), registerUseCase: sl()),
  );

  //! ------------------ Use Cases ------------------
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  //! ------------------ Repository ------------------
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  //! ------------------ Data Source ------------------
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthAPIDataSource(sl()));

  //! ------------------ Firebase Auth ------------------
  sl.registerLazySingleton(() => FirebaseAuth.instance);
}
