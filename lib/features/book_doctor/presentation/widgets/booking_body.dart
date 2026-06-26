import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/doctors_cubit.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/doctors_states.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/specialties_cubit.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/specialties_states.dart';
import 'package:telemedicine/features/book_doctor/presentation/widgets/booking_search_bar.dart';
import 'package:telemedicine/features/book_doctor/presentation/widgets/category_filter_chips.dart';
import 'package:telemedicine/features/book_doctor/presentation/widgets/nearby_specialists_section.dart';

class BookingBody extends StatefulWidget {
  const BookingBody({super.key});

  @override
  State<BookingBody> createState() => _BookingBodyState();
}

class _BookingBodyState extends State<BookingBody> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorsCubit>().getAllDoctors();
  }

  String selectedCategory = "All";
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DoctorsCubit>();
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(22),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              //! search
              BookingSearchBar(
                onChanged: (value) async {
                  selectedCategory = "All";
                  setState(() {});
                  if (value.isNotEmpty) {
                    await cubit.getDoctorByName(name: value);
                  } else {
                    await cubit.getAllDoctors();
                  }
                },
              ),
              SizedBox(height: 16.h),
              //! doctor fieldss
              BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
                builder: (context, state) {
                  if (state is GetSpecialtiesLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.yellow,
                      ),
                    );
                  } else if (state is GetSpecialtiesError) {
                    return Center(child: Text(state.message));
                  } else if (state is GetSpecialtiesSuccess) {
                    final specialistes = state.specialties;
                    return CategoryFilterChips(
                      categories: specialistes,
                      selectedCategory: selectedCategory,
                      onCategorySelected: (selected) async {
                        if (selected == "All") {
                          await cubit.getAllDoctors();
                        } else {
                          cubit.getDoctorsBySpeciality(speciality: selected);
                        }
                        selectedCategory = selected;
                        setState(() {});
                      },
                    );
                  }
                  return SizedBox();
                },
              ),
              // const SizedBox(height: 16),
              //  AvailableTodayToggle(value: true, onChanged: (selected) {}),
              const SizedBox(height: 20),

              BlocBuilder<DoctorsCubit, DoctorsState>(
                builder: (context, state) {
                  if (state is GetDoctorsLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.yellow,
                      ),
                    );
                  } else if (state is GetDoctorsError) {
                    return Center(
                      child: Text(
                        state.message,

                        style: TextStyle(color: ColorManager.yellow),
                      ),
                    );
                  } else if (state is GetDoctorsSuccess) {
                    return DoctorsSection(
                      doctors: state.doctors,
                      onSeeAll: () {},
                    );
                  }
                  return SizedBox();
                },
              ),

              const SizedBox(height: 24),
            ]),
          ),
        ),
      ],
    );
  }
}
