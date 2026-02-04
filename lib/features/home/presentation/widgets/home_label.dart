import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/app_theme.dart';

class HomeLabel extends StatelessWidget {
  const HomeLabel({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      label,
      style: textTheme.titleLarge!.copyWith(color: AppTheme.sageGreen),
    );
  }
}
