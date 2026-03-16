import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/book%20appointment/presentation/widgets/booking_app_bar.dart';
import 'package:telemedicine/features/book%20appointment/presentation/widgets/booking_body.dart';

class BookAppointmentScreen extends StatefulWidget {
  static const String routeName = "BookAppointmentScreen";
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
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
