import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

import '../../../../../core/theme/app_text_styles.dart';

class AvailableTodayToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AvailableTodayToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: ColorManager.bookingCardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: ColorManager.bookingBorder, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Available Today',
                  style: AppTextStyles.bookingToggleTitle,
                ),
                const SizedBox(height: 2),
                Text(
                  'Show doctors with immediate slots',
                  style: AppTextStyles.bookingToggleSubtitle,
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: ColorManager.toggleActive,
            inactiveTrackColor: ColorManager.toggleInactive,
            inactiveThumbColor: ColorManager.bookingIconDefault,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
