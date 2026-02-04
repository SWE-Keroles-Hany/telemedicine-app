import 'package:flutter/material.dart';
import 'package:telemedicine/core/routes/app_routes.dart';
import 'package:telemedicine/core/theme/app_theme.dart';
import 'package:telemedicine/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Telemedicine());
}

class Telemedicine extends StatelessWidget {
  const Telemedicine({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MaterialApp(
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
