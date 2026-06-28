import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

import '../../../settings/presentation/screens/user_profile.dart';

class HomeAppBar extends StatelessWidget {
  final String userName;
  final String imgURL;

  const HomeAppBar({super.key, required this.userName, required this.imgURL});

  @override
  Widget build(BuildContext context) {
    log("good img $imgURL");
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: ColorManager.backGroundColor,
      actionsPadding: EdgeInsets.only(top: 15.h, right: 16.w),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(UserProfileScreen.routeName);
          },
          icon: Icon(Icons.settings, size: 30.r, color: ColorManager.white),
        ),
      ],
      title: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Text(
          "Hi, $userName".tr(),
          style: textTheme.titleLarge!.copyWith(color: ColorManager.aquaMint),
        ),
      ),
      primary: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 15.h),
        child: CircleAvatar(backgroundImage: NetworkImage(imgURL)),
      ),
    );
  }
}
