import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_button.dart';

class BookingBottomBar extends StatelessWidget {
  final VoidCallback? onBook;
  final String? selectedDate;

  const BookingBottomBar({super.key, this.onBook, this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
      decoration: const BoxDecoration(
        color: ColorManager.background,
        border: Border(top: BorderSide(color: ColorManager.borderLight)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Show selected date
          if (selectedDate != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: ColorManager.cardBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: ColorManager.borderLight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Appointment Date',
                    style: AppTextStyles.s13medium.copyWith(
                      color: ColorManager.mediumGray,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: ColorManager.teal,
                      ),
                      const SizedBox(width: 6),
                      Text(selectedDate!, style: AppTextStyles.s15semibold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          if (selectedDate != null) const SizedBox(height: 12),
          CustomButton(
            width: double.infinity,
            onPressed: onBook,
            title: selectedDate != null ? 'Confirm Booking' : 'Select Date',
            titleColor: ColorManager.black,
            radiusNumber: 20,
            bgColor: ColorManager.teal,
          ),
        ],
      ),
    );
  }
}
