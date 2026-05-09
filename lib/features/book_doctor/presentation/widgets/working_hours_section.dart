import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class WorkingDayesSection extends StatefulWidget {
  const WorkingDayesSection({super.key, this.onDateSelected});

  final Function(String selectedDate)? onDateSelected;

  @override
  State<WorkingDayesSection> createState() => _WorkingHoursSectionState();
}

class _WorkingHoursSectionState extends State<WorkingDayesSection> {
  int _selectedDay = 0;

  static const _days = [
    {'day': 'Mon', 'date': '21'},
    {'day': 'Tue', 'date': '22'},
    {'day': 'Wed', 'date': '23'},
    {'day': 'Thu', 'date': '24'},
    {'day': 'Fri', 'date': '25'},
  ];

  String get _selectedDate => '2026-05-${_days[_selectedDay]['date']}';

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
              Text('profile.working_days'.tr(), style: AppTextStyles.s17bold),
              Text('May, 2026', style: AppTextStyles.s13medium),
            ],
          ),
          const SizedBox(height: 14),

          // Day chips
          Row(
            children: List.generate(_days.length, (i) {
              final sel = i == _selectedDay;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() => _selectedDay = i);
                    _notifyDateChanged();
                  },
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
        ],
      ),
    );
  }

  void _notifyDateChanged() {
    if (widget.onDateSelected != null) {
      widget.onDateSelected!(_selectedDate);
    }
  }
}
