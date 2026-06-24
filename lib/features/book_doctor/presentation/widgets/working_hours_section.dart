import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class WorkingDayesSection extends StatelessWidget {
  const WorkingDayesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              return DayTimeRowInfo();
            },
            separatorBuilder: (context, index) => SizedBox(height: 8.h),
            itemCount: 7,
          ),
        ],
      ),
    );
  }
}

class DayTimeRowInfo extends StatelessWidget {
  const DayTimeRowInfo({super.key});

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
          Text('Saturday', style: TextStyle(color: Colors.white)),
          Text('From 10AM To 6PM', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
