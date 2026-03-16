import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class WorkingHoursSection extends StatefulWidget {
  const WorkingHoursSection({super.key});

  @override
  State<WorkingHoursSection> createState() => _WorkingHoursSectionState();
}

class _WorkingHoursSectionState extends State<WorkingHoursSection> {
  int _selectedDay = 0;
  int _selectedTime = 0;

  static const _days = [
    {'day': 'Mon', 'date': '21'},
    {'day': 'Tue', 'date': '22'},
    {'day': 'Wed', 'date': '23'},
    {'day': 'Thu', 'date': '24'},
    {'day': 'Fri', 'date': '25'},
  ];

  static const _times = ['09:00 AM', '10:30 AM', '01:00 PM'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Working Hours', style: AppTextStyles.s17bold),
              Text('October, 2023', style: AppTextStyles.s13medium),
            ],
          ),
          const SizedBox(height: 14),

          // Day chips
          Row(
            children: List.generate(_days.length, (i) {
              final sel = i == _selectedDay;
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedDay = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    margin: EdgeInsets.only(
                      right: i < _days.length - 1 ? 8 : 0,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: sel
                          ? ColorManager.selectedDay
                          : ColorManager.cardBg,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: sel
                            ? ColorManager.teal
                            : ColorManager.borderLight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          _days[i]['day']!,
                          style: AppTextStyles.s12medium(selected: sel),
                        ),
                        const SizedBox(height: 4),
                        Text(_days[i]['date']!, style: AppTextStyles.s16bold),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),

          // Time slots
          Row(
            children: List.generate(_times.length, (i) {
              final sel = i == _selectedTime;
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedTime = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    margin: EdgeInsets.only(
                      right: i < _times.length - 1 ? 8 : 0,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    decoration: BoxDecoration(
                      color: sel ? ColorManager.teal : ColorManager.cardBg,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: sel
                            ? ColorManager.teal
                            : ColorManager.borderLight,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _times[i],
                      style: AppTextStyles.s13semibold(selected: sel),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
