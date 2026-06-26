import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_schedule_entity.dart';

class WorkingDayesSection extends StatelessWidget {
  final List<DoctorScheduleEntity> schedules;
  const WorkingDayesSection({super.key, required this.schedules});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Working ( Days - Time)", style: AppTextStyles.s17bold),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: ColorManager.aquaMint,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Day', style: TextStyle(color: Colors.black)),
                Text('Time', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          Divider(),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return DayTimeRowInfo(schedule: schedules[index]);
            },
            separatorBuilder: (context, index) => SizedBox(height: 8.h),
            itemCount: schedules.length,
          ),
        ],
      ),
    );
  }
}

class DayTimeRowInfo extends StatelessWidget {
  final DoctorScheduleEntity schedule;
  const DayTimeRowInfo({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(schedule.dayOfWeek, style: TextStyle(color: Colors.white)),
          Text(
            'From ${schedule.startTime} To ${schedule.endTime}',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
