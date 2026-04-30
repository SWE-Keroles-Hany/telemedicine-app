import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: ColorManager.bookingTextPrimary,
        size: 18,
      ),
      onPressed: () => Navigator.maybePop(context),
    );
  }
}
