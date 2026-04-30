import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';

class DoctorInfoCard extends StatelessWidget {
  final DoctorEntity doctor;
  const DoctorInfoCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: ColorManager.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorManager.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(doctor.fullName, style: AppTextStyles.s20bold),
              ),
              const Icon(
                Icons.star_rounded,
                color: ColorManager.teal,
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(doctor.rate.toString(), style: AppTextStyles.s15semibold),
            ],
          ),
          const SizedBox(height: 4),
          Text(doctor.specialty, style: AppTextStyles.s14medium),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: ColorManager.textSecondary,
                size: 15,
              ),
              const SizedBox(width: 4),
              Text(doctor.clinicAddress, style: AppTextStyles.s13regular),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
