import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class NavBarItem extends StatelessWidget {
  final NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            item.icon,
            color: isActive
                ? ColorManager.bookingBottomNavActive
                : ColorManager.bookingBottomNavInactive,
            size: 22,
          ),
          const SizedBox(height: 3),
          Text(
            item.label,
            style: isActive
                ? AppTextStyles.bookingBottomNavActive
                : AppTextStyles.bookingBottomNavInactive,
          ),
        ],
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final String label;
  const NavItem({required this.icon, required this.label});
}
