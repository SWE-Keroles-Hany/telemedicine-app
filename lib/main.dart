import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:telemedicine/core/bloc_obs.dart';
import 'package:telemedicine/core/routes/app_routes.dart';
import 'package:telemedicine/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:telemedicine/core/si/service_locator.dart';
import 'package:telemedicine/features/auth/presentation/screens/login_screen.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/doctors_cubit.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/specialties_cubit.dart';
import 'package:telemedicine/features/home/presentation/cubit/home_cubit.dart';
import 'package:telemedicine/features/patient_appointments/presentation/cubit/appointment_cubit.dart';
import 'package:telemedicine/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:telemedicine/features/medical_history/presentation/cubit/medical_history_cubit.dart';
import 'package:telemedicine/features/check_yourself/presentation/cubit/check_yourself_cubit.dart';
import 'package:toastification/toastification.dart';
import 'package:telemedicine/features/auth/presentation/widgets/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  final navigatorKey = GlobalKey<NavigatorState>();
  await init(key: navigatorKey);

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<AuthCubit>()),
          BlocProvider(
            create: (context) => sl<DoctorsCubit>()..getAllDoctors(),
          ),
          BlocProvider(
            create: (context) => sl<SpecialtiesCubit>()..getSpecialties(),
          ),
          BlocProvider(
            create: (context) =>
                sl<AppointmentCubit>()..getMyAppointments(statusNumber: 1),
          ),
          BlocProvider(create: (context) => sl<HomeCubit>()..getTopDoctors()),
          BlocProvider(
            create: (context) => sl<SettingsCubit>()..getUserProfile(),
          ),
          BlocProvider(create: (context) => sl<MedicalHistoryCubit>()),
          BlocProvider(create: (context) => sl<CheckYourselfCubit>()),
        ],
        child: Telemedicine(navigatorKey: navigatorKey),
      ),
    ),
  );
}

class Telemedicine extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const Telemedicine({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => ToastificationWrapper(
        child: MaterialApp(
          navigatorKey: navigatorKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.theme,
          debugShowCheckedModeBanner: false,
          routes: AppRoutes.routes,
          initialRoute: LoginScreen.routeName,
          onGenerateInitialRoutes: (initialRoute) {
            return [MaterialPageRoute(builder: (context) => AuthWrapper())];
          },
        ),
      ),
    );
  }
}
