import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: ColorManger.backGroundColor,

      actionsPadding: EdgeInsets.only(top: 4.h, right: 16.w),
      actions: [
        Icon(Icons.notifications, size: 28, color: ColorManger.white),
        SizedBox(width: 16),
        Icon(Icons.settings, size: 28.r, color: ColorManger.white),
      ],
      title: Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "GOOD MORNING",
              style: textTheme.labelLarge!.copyWith(
                color: ColorManger.aquaMint,
              ),
            ),
            Text(
              "Keroles",
              style: textTheme.labelLarge!.copyWith(color: ColorManger.white),
            ),
          ],
        ),
      ),
      primary: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 4.h),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/kero.jpg"),
        ),
      ),
    );
  }
}
