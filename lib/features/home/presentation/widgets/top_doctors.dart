import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';
import 'package:telemedicine/features/book_doctor/presentation/screens/doctor_profile_screen.dart';
import 'package:telemedicine/features/home/presentation/widgets/doctor_item.dart';

class TopDoctors extends StatelessWidget {
  TopDoctors({super.key});
  List<DoctorEntity> topDoctors = [];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(DoctorProfileScreen.routeName);
        },
        child: DoctorCard(doctor: topDoctors[index]),
      ),
      separatorBuilder: (context, index) => SizedBox(width: 10.w),
      itemCount: topDoctors.length,
    );
  }
}
