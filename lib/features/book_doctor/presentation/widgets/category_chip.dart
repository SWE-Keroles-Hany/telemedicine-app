import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({super.key, 
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorManager.chipSelected
              : ColorManager.chipUnselected,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? ColorManager.chipSelected
                : ColorManager.chipBorder,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: isSelected
                ? AppTextStyles.bookingChipSelected
                : AppTextStyles.bookingChipUnselected,
          ),
        ),
      ),
    );
  }
}
