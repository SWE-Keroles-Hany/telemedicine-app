import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

import '../../../../../core/theme/app_text_styles.dart';

class TopRatedBadge extends StatelessWidget {
  const TopRatedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: ColorManager.topRatedBadgeBg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: ColorManager.bookingPrimaryDark, width: 1),
      ),
      child: Text('TOP RATED', style: AppTextStyles.bookingTopRatedBadge),
    );
  }
}
