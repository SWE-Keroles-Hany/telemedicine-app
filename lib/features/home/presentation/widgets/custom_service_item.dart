import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/app_theme.dart';

class CustomServiceItem extends StatelessWidget {
  const CustomServiceItem({
    super.key,

    required this.serviceTitle,
    required this.serviceDescription,
    required this.icon,
  });
  final String serviceTitle;
  final String serviceDescription;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.darkGray),
        borderRadius: BorderRadius.circular(32),
        color: AppTheme.charcoalBlack,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: AppTheme.aquaMint, size: 40),
          SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            serviceTitle,
            style: textTheme.titleLarge!.copyWith(
              color: AppTheme.white,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),

          Text(
            serviceDescription,
            style: textTheme.titleSmall!.copyWith(color: AppTheme.blueGray),
          ),
        ],
      ),
    );
  }
}
