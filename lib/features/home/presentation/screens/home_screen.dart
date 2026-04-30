import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/constants/constants_text.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/widgets/custom_app_label.dart';
import 'package:telemedicine/features/home/domain/entities/top_doctor_entity.dart';
import 'package:telemedicine/features/home/presentation/cubit/home_cubit.dart';
import 'package:telemedicine/features/home/presentation/cubit/home_states.dart';
import 'package:telemedicine/features/home/presentation/widgets/home_app_bar.dart';
import 'package:telemedicine/features/home/presentation/widgets/our_services.dart';
import 'package:telemedicine/features/home/presentation/widgets/top_doctors_and_view_all_row.dart';

import '../widgets/top_doctors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTopDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.backGroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.h),
          child: const HomeAppBar(),
        ),
        body: ListView(
          padding: EdgeInsets.all(16.r),
          children: [
            CustomAppLabel(label: ConstantsText.ourServices),
            SizedBox(height: 10.h),
            SizedBox(height: 300.h, child: OurServices()),
            TopDoctorsAndViewAllRow(),
            SizedBox(height: 10.h),
            SizedBox(
              height: 210.h,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is GetTopDoctorsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is GetTopDoctorsSuccess) {
                    return TopDoctors(topDoctors: state.topDoctors);
                  } else if (state is GetTopDoctorsError) {
                    return Center(
                      child: Text(
                        'Error: ${state.message}',
                        style: TextStyle(color: Colors.red),
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
