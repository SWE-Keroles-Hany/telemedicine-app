import 'package:flutter/material.dart';
import 'package:telemedicine/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:telemedicine/features/book_doctor/presentation/screens/book_appointment_screen.dart';
import 'package:telemedicine/features/book_doctor/presentation/screens/doctor_profile_screen.dart';
import 'package:telemedicine/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:telemedicine/features/patient_appointments/presentation/screens/patient_appointments_screen.dart';
import 'package:telemedicine/features/settings/presentation/screens/user_profile.dart';
import 'package:telemedicine/features/settings/presentation/screens/personal_information_screen.dart';
import 'package:telemedicine/features/settings/presentation/screens/change_password_screen.dart';
import 'package:telemedicine/features/settings/presentation/screens/language_screen.dart';
import 'package:telemedicine/features/settings/presentation/screens/help_center_screen.dart';
import 'package:telemedicine/features/settings/presentation/screens/privacy_policy_screen.dart';
import 'package:telemedicine/features/medical_history/presentation/screens/medical_history_screen.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/check ur self/presentation/screens/check_your_self_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    LoginScreen.routeName: (context) => LoginScreen(),
    ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
    SignUpScreen.routeName: (context) => SignUpScreen(),
    HomeScreen.routeName: (context) => HomeScreen(),
    CheckYourSelfScreen.routeName: (context) => CheckYourSelfScreen(),

    DoctorProfileScreen.routeName: (context) => DoctorProfileScreen(),

    UserProfileScreen.routeName: (context) => UserProfileScreen(),
    OnboardingScreen.routeName: (context) => OnboardingScreen(),
    BookAppointmentScreen.routeName: (context) => BookAppointmentScreen(),
    PatientAppointmentsScreen.routeName: (context) =>
        PatientAppointmentsScreen(),

    // PersonalInformationScreen.routeName: (context) =>
    //     PersonalInformationScreen(),
    ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
    LanguageScreen.routeName: (context) => LanguageScreen(),
    HelpCenterScreen.routeName: (context) => HelpCenterScreen(),
    PrivacyPolicyScreen.routeName: (context) => PrivacyPolicyScreen(),
    MedicalHistoryScreen.routeName: (context) => MedicalHistoryScreen(),
  };
}
