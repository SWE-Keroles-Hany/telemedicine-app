import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_button.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/doctors_cubit.dart';

class BookingBottomBar extends StatefulWidget {
  final int doctorId;
  const BookingBottomBar({super.key, required this.doctorId});

  @override
  State<BookingBottomBar> createState() => _BookingBottomBarState();
}

class _BookingBottomBarState extends State<BookingBottomBar> {
  DateTime? selectedDate;
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
      decoration: const BoxDecoration(
        color: ColorManager.background,
        border: Border(top: BorderSide(color: ColorManager.borderLight)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: ColorManager.cardBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorManager.borderLight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Date'.tr(),
                      style: AppTextStyles.s13medium.copyWith(
                        color: ColorManager.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                        );
                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }

                        //! select date
                      },
                      icon: Icon(Icons.date_range, color: ColorManager.white),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: ColorManager.teal,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      dateFormat.format(selectedDate ?? DateTime.now()),
                      style: AppTextStyles.s15semibold,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          CustomButton(
            width: double.infinity,
            onPressed: () {
              context.read<DoctorsCubit>().bookDoctor(
                appoinmentDate: dateFormat.format(
                  selectedDate ?? DateTime.now(),
                ),
                doctorId: widget.doctorId, // TODO: Get actual doctor ID
              );
            },
            title: 'profile.confirm_booking'.tr(),
            titleColor: ColorManager.black,
            radiusNumber: 20,
            bgColor: ColorManager.teal,
          ),
        ],
      ),
    );
  }
}
