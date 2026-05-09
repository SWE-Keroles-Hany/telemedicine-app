import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class DoctorStatsRow extends StatelessWidget {
  final int experienceYears;
  final int patientCount;
  final num rate;
  final int reviewCount;

  const DoctorStatsRow({
    super.key,
    required this.reviewCount,
    required this.experienceYears,
    required this.patientCount,
    required this.rate,
  });

  String _fmt(int n) =>
      n >= 1000 ? '${(n / 1000).toStringAsFixed(0)}k+' : '$n+';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _StatCard(
            value: '$experienceYears+',
            label: 'profile.experience'.tr(),
          ),
          const SizedBox(width: 12),
          _StatCard(value: _fmt(patientCount), label: 'profile.patients'.tr()),
          const SizedBox(width: 12),
          _StatCard(value: '$reviewCount', label: 'profile.reviews'.tr()),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: ColorManager.cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: ColorManager.borderLight),
        ),
        child: Column(
          children: [
            Text(value, style: AppTextStyles.s16bold),
            const SizedBox(height: 4),
            Text(label, style: AppTextStyles.s10medium),
          ],
        ),
      ),
    );
  }
}
