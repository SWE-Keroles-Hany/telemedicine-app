import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/patient_appointments/domain/entities/appointment.dart';
import 'appointment_card.dart';

class AppointmentsList extends StatelessWidget {
  final List<Appointment> appointments;

  const AppointmentsList({super.key, required this.appointments});

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_month,
              size: 64,
              color: ColorManager.bookingIconDefault,
            ),
            const SizedBox(height: 16),
            Text(
              'No appointments found',
              style: TextStyle(
                color: ColorManager.bookingTextPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You don\'t have any appointments scheduled',
              style: TextStyle(
                color: ColorManager.textSecondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        return AppointmentCard(appointment: appointments[index]);
      },
    );
  }
}
