import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/features/book%20appointment/presentation/widgets/booking_search_bar.dart';
import 'package:telemedicine/features/book%20appointment/presentation/widgets/category_filter_chips.dart';
import 'package:telemedicine/features/book%20appointment/presentation/widgets/nearby_specialists_section.dart';
import 'package:telemedicine/features/doctors/domain/entities/doctor_entity.dart';

class BookingBody extends StatelessWidget {
  const BookingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              BookingSearchBar(onChanged: (value) {}),
              SizedBox(height: 16.h),
              CategoryFilterChips(
                categories: ["a", "b", "c", "c", "c", "c", "c", "c", "c"],
                selectedCategory: "a",
                onCategorySelected: (selected) {},
              ),
              // const SizedBox(height: 16),
              // AvailableTodayToggle(value: true, onChanged: (selected) {}),
              const SizedBox(height: 20),
              NearbySpecialistsSection(
                doctors: [
                  DoctorEntity(
                    about: "aaa",
                    experienceYears: 1,
                    hospital: "aaa",
                    imageAsset: "assets/images/kero.jpg",
                    location: "ass",
                    name: "keroles",
                    patientCount: 3,
                    rating: 3,
                    reviewCount: 2,
                    specialty: "asdf",
                  ),
                  DoctorEntity(
                    about: "aaa",
                    experienceYears: 1,
                    hospital: "aaa",
                    imageAsset: "assets/images/kero.jpg",
                    location: "ass",
                    name: "keroles",
                    patientCount: 3,
                    rating: 3,
                    reviewCount: 2,
                    specialty: "asdf",
                  ),
                  DoctorEntity(
                    about: "aaa",
                    experienceYears: 1,
                    hospital: "aaa",
                    imageAsset: "assets/images/kero.jpg",
                    location: "ass",
                    name: "keroles",
                    patientCount: 3,
                    rating: 3,
                    reviewCount: 2,
                    specialty: "asdf",
                  ),
                ],
                onSeeAll: () {},
              ),

              const SizedBox(height: 24),
            ]),
          ),
        ),
      ],
    );
  }
}
