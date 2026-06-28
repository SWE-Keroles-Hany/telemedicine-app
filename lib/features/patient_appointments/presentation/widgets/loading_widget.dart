import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class AppointmentsLoadingWidget extends StatelessWidget {
  const AppointmentsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: ColorManager.primary,
            strokeWidth: 3,
          ),
          const SizedBox(height: 16),
          Text(
            'Loading appointments...',
            style: TextStyle(
              color: ColorManager.bookingTextPrimary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
