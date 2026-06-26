import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/core/si/service_locator.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/utils/ui_utils.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/doctors_cubit.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/doctors_states.dart';
import 'package:telemedicine/features/patient_appointments/presentation/cubit/appointment_cubit.dart';
import 'package:telemedicine/features/patient_appointments/presentation/screens/patient_appointments_screen.dart';

import '../widgets/doctor_hero_header.dart';
import '../widgets/doctor_info_card.dart';
import '../widgets/doctor_stats_row.dart';
import '../widgets/about_doctor_section.dart';
import '../widgets/working_hours_section.dart';
import '../widgets/booking_bottom_bar.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key});
  static const String routeName = "DoctorProfileScreen";

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final doctor = ModalRoute.of(context)!.settings.arguments as DoctorEntity;
      context.read<DoctorsCubit>().getDoctorSchedule(
        doctorId: int.parse(doctor.id),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as DoctorEntity;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<DoctorsCubit>().getAllDoctors();
            },
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: ColorManager.background,
          foregroundColor: ColorManager.white,
        ),
        backgroundColor: ColorManager.background,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DoctorHeroHeader(imageAsset: doctor.profilePictureUrl!),
                      const SizedBox(height: 16),
                      DoctorInfoCard(doctor: doctor),
                      const SizedBox(height: 16),
                      DoctorStatsRow(
                        reviewCount: doctor.rateCount,
                        experienceYears: doctor.yearsOfExperience,
                        // numberOfPatients: 10,
                        rate: doctor.rate,
                      ),
                      const SizedBox(height: 24),
                      AboutDoctorSection(text: doctor.bio),
                      const SizedBox(height: 24),
                      BlocBuilder<DoctorsCubit, DoctorsState>(
                        builder: (context, state) {
                          log("state: $state");
                          if (state is GetDoctorScheduleSuccess) {
                            return WorkingDayesSection(
                              schedules: state.schedules,
                            );
                          } else if (state is GetDoctorScheduleLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is GetDoctorScheduleError) {
                            return Center(
                              child: Text('Failed to load schedule'),
                            );
                          }
                          return WorkingDayesSection(schedules: []);
                        },
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
            BlocConsumer<DoctorsCubit, DoctorsState>(
              listener: (context, state) {
                if (state is BookDoctorLoading) {
                  UiUtils.showLoadingIndicator(context);
                }
                if (state is BookDoctorSuccess) {
                  UiUtils.hideLoading(context);
                  UiUtils.showMessage(
                    message: "Booked Successfully",
                    isSuccessMessage: true,
                  );

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PatientAppointmentsScreen(),
                    ),
                    (route) => route.isFirst,
                  ).then((_) async {
                    await sl<AppointmentCubit>().getMyAppointments(
                      statusNumber: 1,
                    );
                  });
                } else if (state is BookDoctorError) {
                  UiUtils.hideLoading(context);
                  context.read<DoctorsCubit>().getDoctorSchedule(
                    doctorId: int.parse(doctor.id),
                  );
                  UiUtils.showMessage(
                    message: state.message,
                    isErrorMessage: true,
                  );
                }
              },
              builder: (context, state) =>
                  BookingBottomBar(doctorId: int.parse(doctor.id)),
            ),
          ],
        ),
      ),
    );
  }
}
