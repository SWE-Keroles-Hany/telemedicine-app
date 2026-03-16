import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Nearby Specialists', style: AppTextStyles.bookingSectionTitle),
      ],
    );
  }
}
