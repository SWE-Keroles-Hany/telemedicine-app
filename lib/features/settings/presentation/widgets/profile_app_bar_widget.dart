import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

import '../../../../core/theme/app_text_styles.dart';

class ProfileAppBarWidget extends StatelessWidget {
  final VoidCallback? onSettingsTap;

  const ProfileAppBarWidget({super.key, this.onSettingsTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Profile', style: AppTextStyles.s22bold),
        
      ],
    );
  }
}
