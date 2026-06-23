import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/medical_history/domain/entities/medical_history_entity.dart';
import 'package:telemedicine/features/medical_history/presentation/screens/medical_record_details_screen.dart';

class MedicalHistoryCard extends StatelessWidget {
  const MedicalHistoryCard({required this.record, super.key});
  final MedicalHistoryEntity record;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MedicalRecordDetailsScreen(record: record),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.r),
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.white),
          borderRadius: BorderRadius.circular(16.r),
          color: ColorManager.charcoalBlack,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Doctor',
                        style: textTheme.bodySmall!.copyWith(
                          color: ColorManager.aquaMint,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        record.doctorName,
                        style: textTheme.titleMedium!.copyWith(
                          color: ColorManager.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.darkGray,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    record.doctorSpecialty,
                    style: textTheme.bodySmall!.copyWith(
                      color: ColorManager.yellow,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16.sp,
                  color: ColorManager.mediumGray,
                ),
                SizedBox(width: 8.w),
                Text(
                  dateFormat.format(record.dateCreated),
                  style: textTheme.bodySmall!.copyWith(
                    color: ColorManager.aquaMint,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(
                  record.attachments.isEmpty
                      ? Icons.attach_file_outlined
                      : Icons.attach_file,
                  size: 16.sp,
                  color: ColorManager.aquaMint,
                ),
                SizedBox(width: 8.w),
                Text(
                  record.attachments.isEmpty
                      ? 'No attachments'
                      : '${record.attachments.length} attachment(s)',
                  style: textTheme.bodySmall!.copyWith(
                    color: ColorManager.aquaMint,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
