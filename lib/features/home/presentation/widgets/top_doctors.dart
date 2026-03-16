import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/features/doctors/presentation/screens/doctor_profile_screen.dart';
import 'package:telemedicine/features/home/presentation/widgets/doctor_item.dart';

class TopDoctors extends StatelessWidget {
  TopDoctors({super.key});
  List<DoctorData> topDoctors = [
    DoctorData(
      doctorImage: "assets/images/kero.jpg",
      doctorField: "CARDIOLOGIST",
      doctorName: "Kareem Ali",
      doctorRate: 3.9,
    ),
    DoctorData(
      doctorImage: "assets/images/kero.jpg",
      doctorField: "NEUROLOGIST",
      doctorName: "Keroles Gab",
      doctorRate: 3.8,
    ),
    DoctorData(
      doctorImage: "assets/images/kero.jpg",
      doctorField: "NEUROLOGIST",
      doctorName: "Keroles Gab",
      doctorRate: 3.8,
    ),
    DoctorData(
      doctorImage: "assets/images/kero.jpg",
      doctorField: "NEUROLOGIST",
      doctorName: "Keroles Gab",
      doctorRate: 3.8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(DoctorProfileScreen.routeName);
        },
        child: DoctorCard(
          doctorField: topDoctors[index].doctorField,
          doctorImage: topDoctors[index].doctorImage,
          doctorName: topDoctors[index].doctorName,
          doctorRate: topDoctors[index].doctorRate,
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(width: 10.w),
      itemCount: topDoctors.length,
    );
  }
}

class DoctorData {
  final String doctorImage;
  final String doctorField;
  final String doctorName;
  final double doctorRate;

  DoctorData({
    required this.doctorImage,
    required this.doctorField,
    required this.doctorName,
    required this.doctorRate,
  });
}
