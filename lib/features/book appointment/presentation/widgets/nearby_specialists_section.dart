import 'package:flutter/material.dart';
import 'package:telemedicine/features/book%20appointment/presentation/widgets/doctor_list.dart';
import 'package:telemedicine/features/book%20appointment/presentation/widgets/section_header.dart';
import 'package:telemedicine/features/doctors/domain/entities/doctor_entity.dart';

class NearbySpecialistsSection extends StatelessWidget {
  final List<DoctorEntity> doctors;
  final VoidCallback onSeeAll;

  const NearbySpecialistsSection({
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
