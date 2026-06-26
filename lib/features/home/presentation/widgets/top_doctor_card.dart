import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/constants/constants_assets.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';

class TopDoctorCard extends StatelessWidget {
  const TopDoctorCard({required this.doctor, super.key});
  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.42,
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
            child: Image.network(
              errorBuilder: (context, error, stackTrace) => Image.network(
                ConstantAssetImages.defaultDoctorImage,
                fit: BoxFit.fitHeight,
                height: 100.h,
              ),
              fit: BoxFit.fitWidth,
              width: MediaQuery.sizeOf(context).width * 0.35,
              height: 100.h,
              doctor.profilePictureUrl!,
            ),
          ),
          SizedBox(height: 8.h),

          Text(
            doctor.fullName,
            style: textTheme.titleMedium!.copyWith(color: ColorManager.white),
          ),

          Text(
            doctor.specialty,
            style: textTheme.titleMedium!.copyWith(
              color: ColorManager.mediumGray,
              fontWeight: FontWeight.normal,
            ),
          ),

          SizedBox(height: 6.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.star, color: ColorManager.yellow),
              SizedBox(width: 8.w),
              Text(
                "${doctor.rate}",
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
