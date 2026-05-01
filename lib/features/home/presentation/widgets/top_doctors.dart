import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';
import 'package:telemedicine/features/book_doctor/presentation/screens/doctor_profile_screen.dart';
import 'package:telemedicine/features/home/presentation/widgets/top_doctor_card.dart';

class TopDoctors extends StatelessWidget {
  const TopDoctors({super.key, required this.topDoctors});
  final List<DoctorEntity> topDoctors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            DoctorProfileScreen.routeName,
            arguments: topDoctors[index],
          );
        },
        child: TopDoctorCard(doctor: topDoctors[index]),
      ),
      separatorBuilder: (context, index) => SizedBox(width: 10.w),
      itemCount: topDoctors.length,
    );
  }
}
