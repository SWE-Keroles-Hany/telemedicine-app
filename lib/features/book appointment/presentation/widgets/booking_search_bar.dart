import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

import '../../../../../core/theme/app_text_styles.dart';

class BookingSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const BookingSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: ColorManager.bookingSearchBarBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorManager.bookingBorder, width: 1),
      ),
      child: TextField(
        onChanged: onChanged,
        style: AppTextStyles.bookingSearchInput,
        decoration: InputDecoration(
          hintText: 'Search doctors by name or specialty',
          hintStyle: AppTextStyles.bookingSearchHint,
          prefixIcon: Icon(
            Icons.search_rounded,
            color: ColorManager.bookingIconDefault,
            size: 30.r,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
