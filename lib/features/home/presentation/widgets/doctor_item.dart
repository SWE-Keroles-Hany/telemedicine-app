import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.doctorImage,
    required this.doctorField,
    required this.doctorName,
    required this.doctorRate,
  });
  final String doctorImage;
  final String doctorField;
  final String doctorName;
  final double doctorRate;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.45,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.darkGray),
        borderRadius: BorderRadius.circular(32.r),
        color: ColorManager.charcoalBlack,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16.r),
            child: Image.asset(
              fit: BoxFit.fitWidth,
              width: MediaQuery.sizeOf(context).width * 0.45,
              height: 100.h,
              doctorImage,
            ),
          ),
          SizedBox(height: 8.h),

          Text(
            "Dr.$doctorName",
            style: textTheme.titleMedium!.copyWith(color: ColorManager.white),
          ),

          SizedBox(height: 4.h),
          Text(
            doctorField,
            style: textTheme.titleMedium!.copyWith(
              color: ColorManager.mediumGray,
              fontWeight: FontWeight.normal,
            ),
          ),

          SizedBox(height: 4.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.star, color: ColorManager.yellow),
              SizedBox(width: 8.w),
              Text(
                "$doctorRate",
                style: textTheme.titleMedium!.copyWith(
                  color: ColorManager.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
