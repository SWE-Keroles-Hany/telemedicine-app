import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

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

  //! Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl<AuthRemoteDataSource>()));

  //! UseCases
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl<AuthRepository>()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl<AuthRepository>()));

  //! Cubit
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      loginUseCase: sl<LoginUseCase>(),
      registerUseCase: sl<RegisterUseCase>(),
    ),
  );
}
