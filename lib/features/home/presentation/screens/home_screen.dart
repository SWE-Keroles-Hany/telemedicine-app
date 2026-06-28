import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/constants/constants_assets.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/widgets/custom_app_label.dart';
import 'package:telemedicine/features/home/presentation/cubit/home_cubit.dart';
import 'package:telemedicine/features/home/presentation/cubit/home_states.dart';
import 'package:telemedicine/features/home/presentation/widgets/home_app_bar.dart';
import 'package:telemedicine/features/home/presentation/widgets/our_services.dart';
import 'package:telemedicine/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:telemedicine/features/settings/presentation/cubit/settings_states.dart';

import '../widgets/top_doctors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? userId;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTopDoctors();
    context.read<SettingsCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.backGroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.h),
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              if (state is GetUserProfileSuccess) {
                return HomeAppBar(
                  imgURL:
                      state.userProfile.imgURL ??
                      ConstantAssetImages.defaultUserImage,
                  userName: state.userProfile.fullName ?? "...",
                );
              }
              return HomeAppBar(
                imgURL: ConstantAssetImages.defaultUserImage,
                userName: "...",
              );
            },
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(22.r),
          children: [
            CustomAppLabel(label: 'home.our_services'.tr()),
            SizedBox(height: 10.h),
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                if (state is GetUserProfileSuccess) {
                  return SizedBox(
                    height: 270.h,
                    child: OurServices(
                      userId: state.userProfile.patientId ?? 00,
                    ),
                  );
                } else if (state is GetUserProfileLoading) {
                  return SizedBox(
                    height: 270.h,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primary,
                      ),
                    ),
                  );
                } else if (state is GetUserProfileError) {
                  return Center(
                    child: Icon(
                      Icons.error,
                      size: 60.r,
                      color: ColorManager.red,
                    ),
                  );
                }
                return SizedBox();
              },
            ),
            CustomAppLabel(label: 'home.top_doctors'.tr()),
            SizedBox(height: 10.h),
            SizedBox(
              height: 200.h,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is GetTopDoctorsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is GetTopDoctorsSuccess) {
                    return TopDoctors(topDoctors: state.topDoctors);
                  } else if (state is GetTopDoctorsError) {
                    return Center(
                      child: Icon(
                        Icons.error,
                        size: 60.r,
                        color: ColorManager.red,
                      ),
                    );
                  } else {
                    return TopDoctors(topDoctors: []);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
