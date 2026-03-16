import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class SymptomItem extends StatelessWidget {
  const SymptomItem({
    super.key,
    required this.title,
    required this.icon,
    this.isSelected = false,
  });
  final String title;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? ColorManager.deepTealGreen
            : ColorManager.midnightTeal,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isSelected ? ColorManager.aquaMint : ColorManager.blueGray,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 15.w),
          Image.asset(
            icon,
            width: 30,
            // height: 10,
          ),
          SizedBox(width: 15.w),
          Text(
            title,
            style: textTheme.titleMedium!.copyWith(color: ColorManager.white),
          ),
        ],
      ),
    );
  }
}
