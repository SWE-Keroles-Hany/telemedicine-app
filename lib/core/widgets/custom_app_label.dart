import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class CustomAppLabel extends StatelessWidget {
  const CustomAppLabel({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      label,
      style: textTheme.titleLarge!.copyWith(color: ColorManger.sageGreen),
    );
  }
}
