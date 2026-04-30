import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/doctors_cubit.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/specialties_cubit.dart';
import 'package:telemedicine/features/book_doctor/presentation/widgets/booking_app_bar.dart';
import 'package:telemedicine/features/book_doctor/presentation/widgets/booking_body.dart';

class BookAppointmentScreen extends StatefulWidget {
  static const String routeName = 'BookAppointmentScreen';
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<SpecialtiesCubit>().getSpecialties();
    context.read<DoctorsCubit>().getAllDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.bookingScaffoldBg,
        appBar: BookingAppBar(),
        body: BookingBody(),
      ),
    );
  }
}
