import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/core/routes/app_routes.dart';
import 'package:telemedicine/core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:telemedicine/core/si/service_locator.dart';
import 'package:telemedicine/features/book%20appointment/presentation/screens/book_appointment_screen.dart';
import 'package:telemedicine/features/home/presentation/screens/home_screen.dart';
import 'package:telemedicine/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<AuthCubit>())],
      child: const Telemedicine(),
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
          theme: AppTheme.theme,
          debugShowCheckedModeBanner: false,
          routes: AppRoutes.routes,
          initialRoute: HomeScreen.routeName,
        ),
      ),
    );
  }
}
