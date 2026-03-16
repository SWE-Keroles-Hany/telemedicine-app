import 'package:flutter/material.dart';
import 'package:telemedicine/core/constants/constants_text.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/widgets/custom_app_label.dart';

class TopDoctorsAndViewAllRow extends StatelessWidget {
  const TopDoctorsAndViewAllRow({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppLabel(label: ConstantsText.topDoctors),
        InkWell(
          onTap: () {},
          child: Text(
            ConstantsText.viewAll,
            style: textTheme.titleMedium!.copyWith(
              color: ColorManager.aquaMint,
            ),
          ),
        ),
      ],
    );
  }
}
