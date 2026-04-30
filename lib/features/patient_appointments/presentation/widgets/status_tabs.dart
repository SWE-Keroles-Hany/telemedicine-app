import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class StatusTabs extends StatelessWidget {
  final String selectedStatus;
  final Function(String) onStatusChanged;

  const StatusTabs({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  static const List<String> statuses = [
    'Pending',
    'Confirmed',
    'Completed',
    'Cancelled',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.bookingCardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorManager.bookingBorder),
      ),
      child: Row(
        children: statuses.map((status) {
          final isSelected = selectedStatus == status;
          return Expanded(
            child: GestureDetector(
              onTap: () => onStatusChanged(status),
              child: Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? ColorManager.bookingPrimary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected
                        ? ColorManager.bookingTextOnPrimary
                        : ColorManager.bookingTextPrimary,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
