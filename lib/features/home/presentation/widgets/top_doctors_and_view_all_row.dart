import 'package:flutter/material.dart';
import 'package:telemedicine/core/constants/constants_text.dart';
import 'package:telemedicine/core/theme/app_theme.dart';
import 'package:telemedicine/features/home/presentation/widgets/home_label.dart';

class TopDoctorsAndViewAllRow extends StatelessWidget {
  const TopDoctorsAndViewAllRow({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeLabel(label: ConstantsText.topDoctors),
        InkWell(
          onTap: () {},
          child: Text(
            ConstantsText.viewAll,
            style: textTheme.titleMedium!.copyWith(color: AppTheme.aquaMint),
          ),
        ),
      ],
    );
  }
}
