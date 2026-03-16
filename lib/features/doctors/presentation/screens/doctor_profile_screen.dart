import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/doctors/domain/entities/doctor_entity.dart';

import '../widgets/doctor_hero_header.dart';
import '../widgets/doctor_info_card.dart';
import '../widgets/doctor_stats_row.dart';
import '../widgets/about_doctor_section.dart';
import '../widgets/working_hours_section.dart';
import '../widgets/booking_bottom_bar.dart';

class DoctorProfileScreen extends StatefulWidget {
  static const String routeName = "DoctorProfileScreen";
  const DoctorProfileScreen({super.key});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  final DoctorEntity doctor = DoctorEntity(
    name: "name",
    specialty: "specialty",
    hospital: "hospital",
    location: "hospital",
    rating: 3,
    reviewCount: 3,
    experienceYears: 3,
    patientCount: 3,
    about: "about",
    imageAsset: "hospital",
  );
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.background,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DoctorHeroHeader(
                      imageAsset: doctor.imageAsset,
                      isFavorite: _isFavorite,
                      onBack: () => Navigator.pop(context),
                      onFavoriteToggle: () =>
                          setState(() => _isFavorite = !_isFavorite),
                    ),
                    const SizedBox(height: 16),
                    DoctorInfoCard(doctor: doctor),
                    const SizedBox(height: 16),
                    DoctorStatsRow(
                      experienceYears: doctor.experienceYears,
                      patientCount: doctor.patientCount,
                      reviewCount: doctor.reviewCount,
                    ),
                    const SizedBox(height: 24),
                    AboutDoctorSection(text: doctor.about),
                    const SizedBox(height: 24),
                    const WorkingHoursSection(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            BookingBottomBar(
              onChat: () {},
              onBook: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Appointment booked!'),
                    backgroundColor: ColorManager.snackBarBg,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
