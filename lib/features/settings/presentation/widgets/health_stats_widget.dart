import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

import '../../../../core/theme/app_text_styles.dart';

class HealthStatsWidget extends StatelessWidget {
  final String bloodType;
  final double weightKg;
  final double heightCm;

  const HealthStatsWidget({
    super.key,
    required this.bloodType,
    required this.weightKg,
    required this.heightCm,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatCardWidget(
          label: 'settings.blood_type'.tr(),
          value: bloodType,
          isAccent: false,
        ),
        const SizedBox(width: 10),
        _StatCardWidget(
          label: 'settings.weight'.tr(),
          value: '${weightKg.toStringAsFixed(0)}kg',
          isAccent: false,
        ),
        const SizedBox(width: 10),
        _StatCardWidget(
          label: 'settings.height'.tr(),
          value: '${heightCm.toStringAsFixed(0)}cm',
          isAccent: true,
        ),
      ],
    );
  }
}

class _StatCardWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool isAccent;

  const _StatCardWidget({
    required this.label,
    required this.value,
    required this.isAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: ColorManager.statCardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorManager.profileBorder, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StatLabelWidget(label: label),
            const SizedBox(height: 8),
            _StatValueWidget(value: value, isAccent: isAccent),
          ],
        ),
      ),
    );
  }
}

class _StatLabelWidget extends StatelessWidget {
  final String label;

  const _StatLabelWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label, style: AppTextStyles.s9capsLabel);
  }
}

class _StatValueWidget extends StatelessWidget {
  final String value;
  final bool isAccent;

  const _StatValueWidget({required this.value, required this.isAccent});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: isAccent ? AppTextStyles.s18boldTeal : AppTextStyles.s18bold,
    );
  }
}
