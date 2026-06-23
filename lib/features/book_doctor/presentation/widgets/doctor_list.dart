import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';
import 'package:telemedicine/features/book_doctor/presentation/screens/doctor_profile_screen.dart';
import 'package:telemedicine/features/home/presentation/widgets/doctor_item.dart';

class DoctorList extends StatelessWidget {
  final List<DoctorEntity> doctors;

  const DoctorList({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    if (doctors.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Text(
            'No doctors found',
            style: TextStyle(color: ColorManager.bookingIconDefault),
          ),
        ),
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 220.h,
        crossAxisCount: 2,
      ),

      // shrinkWrap: true,
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).pushNamed(DoctorProfileScreen.routeName, arguments: doctor);
          },
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: DoctorCard(doctor: doctor),
          ),
        );
      },
    );
  }
}
