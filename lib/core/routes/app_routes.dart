import 'package:flutter/material.dart';
import 'package:telemedicine/features/book%20appointment/presentation/screens/book_appointment_screen.dart';
import 'package:telemedicine/features/doctors/presentation/screens/doctor_profile_screen.dart';
import 'package:telemedicine/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:telemedicine/features/settings/presentation/screens/user_profile.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/check ur self/presentation/screens/check_your_self_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    LoginScreen.routeName: (context) => LoginScreen(),
    SignUpScreen.routeName: (context) => SignUpScreen(),
    HomeScreen.routeName: (context) => HomeScreen(),
    CheckYourSelfScreen.routeName: (context) => CheckYourSelfScreen(),

    DoctorProfileScreen.routeName: (context) => DoctorProfileScreen(),

    UserProfileScreen.routeName: (context) => UserProfileScreen(),
    OnboardingScreen.routeName: (context) => OnboardingScreen(),
    BookAppointmentScreen.routeName: (context) => BookAppointmentScreen(),
  };
}
