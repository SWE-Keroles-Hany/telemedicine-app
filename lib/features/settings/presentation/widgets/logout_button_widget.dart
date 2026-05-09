import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

import '../../../../core/theme/app_text_styles.dart';

class LogoutButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const LogoutButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: ColorManager.logoutBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: ColorManager.logoutBorder, width: 1),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _LogoutIconWidget(),
            SizedBox(width: 10),
            _LogoutTextWidget(),
          ],
        ),
      ),
    );
  }
}

class _LogoutIconWidget extends StatelessWidget {
  const _LogoutIconWidget();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.logout_rounded,
      color: ColorManager.logoutText,
      size: 20,
    );
  }
}

class _LogoutTextWidget extends StatelessWidget {
  const _LogoutTextWidget();

  @override
  Widget build(BuildContext context) {
    return Text('settings.logout'.tr(), style: AppTextStyles.s16logoutRed);
  }
}
