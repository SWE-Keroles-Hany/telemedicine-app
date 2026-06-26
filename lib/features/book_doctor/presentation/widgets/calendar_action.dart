import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/patient_appointments/presentation/screens/patient_appointments_screen.dart';

class CalendarAction extends StatelessWidget {
  const CalendarAction({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.calendar_today_outlined,
        color: ColorManager.bookingTextPrimary,
        size: 20,
      ),
      onPressed: () {
        Navigator.of(
          context,
        ).pushReplacementNamed(PatientAppointmentsScreen.routeName);
      },
    );
  }
}
