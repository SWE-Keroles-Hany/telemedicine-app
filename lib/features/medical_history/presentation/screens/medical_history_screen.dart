import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/medical_history/presentation/cubit/medical_history_cubit.dart';
import 'package:telemedicine/features/medical_history/presentation/cubit/medical_history_states.dart';
import 'package:telemedicine/features/medical_history/presentation/widgets/medical_history_card.dart';

class MedicalHistoryScreen extends StatefulWidget {
  const MedicalHistoryScreen({super.key});
  static const String routeName = "MedicalHistoryScreen";

  @override
  State<MedicalHistoryScreen> createState() => _MedicalHistoryScreenState();
}

class _MedicalHistoryScreenState extends State<MedicalHistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MedicalHistoryCubit>().getMedicalHistory();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.backGroundColor,
        appBar: AppBar(
          foregroundColor: ColorManager.white,
          backgroundColor: ColorManager.backGroundColor,
          title: Text(
            'Medical History',
            style: AppTextStyles.bookingAppBarTitle,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<MedicalHistoryCubit, MedicalHistoryState>(
          builder: (context, state) {
            if (state is GetMedicalHistoryLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetMedicalHistorySuccess) {
              if (state.medicalHistory.isEmpty) {
                return Center(
                  child: Text(
                    'No medical history records found',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.mediumGray,
                    ),
                  ),
                );
              }
              return ListView(
                padding: EdgeInsets.all(16.r),
                children: state.medicalHistory
                    .map((record) => MedicalHistoryCard(record: record))
                    .toList(),
              );
            } else if (state is GetMedicalHistoryError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 48.sp,
                      color: ColorManager.red,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Error: ${state.message}',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: ColorManager.red),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: () {
                        context.read<MedicalHistoryCubit>().getMedicalHistory();
                      },
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
