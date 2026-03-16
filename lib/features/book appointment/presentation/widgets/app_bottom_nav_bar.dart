import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/book%20appointment/presentation/widgets/nav_bar_item.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _items = [
    NavItem(icon: Icons.home_rounded, label: 'Home'),
    NavItem(icon: Icons.calendar_month_rounded, label: 'Booking'),
    NavItem(icon: Icons.folder_copy_rounded, label: 'Records'),
    NavItem(icon: Icons.person_rounded, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.bookingBottomNavBg,
        border: Border(
          top: BorderSide(color: ColorManager.bookingBottomNavBorder, width: 1),
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            children: List.generate(
              _items.length,
              (i) => Expanded(
                child: NavBarItem(
                  item: _items[i],
                  isActive: currentIndex == i,
                  onTap: () => onTap(i),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
