import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/book_doctor/presentation/widgets/calendar_action.dart';

class BookingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookingAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.bookingScaffoldBg,
      elevation: 0,
      leading: const BackButton(color: ColorManager.white),
      title: Text('Book Appointment', style: AppTextStyles.bookingAppBarTitle),
      centerTitle: true,
      actions: const [CalendarAction()],
    );
  }
}
