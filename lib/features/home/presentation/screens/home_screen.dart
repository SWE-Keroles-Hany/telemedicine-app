import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/constants/constants_text.dart';
import 'package:telemedicine/core/theme/app_theme.dart';
import 'package:telemedicine/features/home/presentation/widgets/home_app_bar.dart';
import 'package:telemedicine/features/home/presentation/widgets/home_label.dart';
import 'package:telemedicine/features/home/presentation/widgets/our_services.dart';
import 'package:telemedicine/features/home/presentation/widgets/top_doctors.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.h),
          child: const HomeAppBar(),
        ),
        body: ListView(
          padding: EdgeInsets.all(16.r),
          children: [
            HomeLabel(label: ConstantsText.ourServices),
            SizedBox(height: 10.h),
            SizedBox(height: 300.h, child: OurServices()),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HomeLabel(label: ConstantsText.topDoctors),
                InkWell(
                  onTap: () {},
                  child: Text(
                    ConstantsText.viewAll,
                    style: textTheme.titleMedium!.copyWith(
                      color: AppTheme.aquaMint,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),

            /// Top Doctors List
            SizedBox(height: 210.h, child: TopDoctors()),
          ],
        ),
      ),
    );
  }
}
