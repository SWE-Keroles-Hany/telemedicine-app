import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

import '../../../../core/theme/app_text_styles.dart';

class ProfileMenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const ProfileMenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        decoration: BoxDecoration(
          color: ColorManager.profileCardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorManager.profileBorder, width: 1),
        ),
        child: Row(
          children: [
            _MenuIconWidget(icon: icon),
            const SizedBox(width: 14),
            Expanded(
              child: _MenuLabelWidget(title: title, subtitle: subtitle),
            ),
            const _MenuChevronWidget(),
          ],
        ),
      ),
    );
  }
}

class _MenuIconWidget extends StatelessWidget {
  final IconData icon;

  const _MenuIconWidget({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: ColorManager.profileIconBg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: ColorManager.teal, size: 20),
    );
  }
}

class _MenuLabelWidget extends StatelessWidget {
  final String title;
  final String? subtitle;

  const _MenuLabelWidget({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    if (subtitle != null) {
      return Row(
        children: [
          Text(title, style: AppTextStyles.s15regular),
          Text(subtitle!, style: AppTextStyles.s14regular),
        ],
      );
    }
    return Text(title, style: AppTextStyles.s15regular);
  }
}

class _MenuChevronWidget extends StatelessWidget {
  const _MenuChevronWidget();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.chevron_right_rounded,
      color: ColorManager.chevron,
      size: 22,
    );
  }
}
