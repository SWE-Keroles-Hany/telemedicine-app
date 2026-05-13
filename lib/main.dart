import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:telemedicine/core/bloc_obs.dart';
import 'package:telemedicine/core/routes/app_routes.dart';
import 'package:telemedicine/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:telemedicine/core/si/service_locator.dart';
import 'package:telemedicine/features/auth/presentation/screens/signup_screen.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/doctors_cubit.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/specialties_cubit.dart';
import 'package:telemedicine/features/home/presentation/cubit/home_cubit.dart';
import 'package:telemedicine/features/home/presentation/screens/home_screen.dart';
import 'package:telemedicine/features/patient_appointments/presentation/cubit/appointment_cubit.dart';
import 'package:telemedicine/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:toastification/toastification.dart';

// === === ======(3)===(2)===(1)===

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await init();
  Bloc.observer = MyBlocObserver();
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
        ],
        child: const Telemedicine(),
      ),
    ),
  );
}

class Telemedicine extends StatelessWidget {
  const Telemedicine({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => ToastificationWrapper(
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.theme,
          debugShowCheckedModeBanner: false,
          routes: AppRoutes.routes,
          initialRoute: SignUpScreen.routeName,
        ),
      ),
    );
  }
}
