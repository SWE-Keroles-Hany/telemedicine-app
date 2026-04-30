import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class AppointmentsErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const AppointmentsErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: ColorManager.red,
          ),
          const SizedBox(height: 16),
          Text(
            'Something went wrong',
            style: TextStyle(
              color: ColorManager.bookingTextPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: TextStyle(
              color: ColorManager.textSecondary,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.bookingPrimary,
              foregroundColor: ColorManager.bookingTextOnPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
