import 'package:flutter/material.dart';
import 'package:telemedicine/features/book_doctor/presentation/widgets/doctor_list.dart';
import 'package:telemedicine/features/book_doctor/presentation/widgets/section_header.dart';
import 'package:telemedicine/features/book_doctor/domain/entities/doctor_entity.dart';

class DoctorsSection extends StatelessWidget {
  final List<DoctorEntity> doctors;
  final VoidCallback onSeeAll;

  const DoctorsSection({
    super.key,
    required this.doctors,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(),
        const SizedBox(height: 12),
        DoctorList(doctors: doctors),
      ],
    );
  }
}
