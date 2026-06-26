import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:telemedicine/features/book_doctor/presentation/screens/book_appointment_screen.dart';
import 'package:telemedicine/features/check_yourself/presentation/screens/check_yourself_screen.dart';
import 'package:telemedicine/features/home/presentation/widgets/custom_service_item.dart';
import 'package:telemedicine/features/medical_history/presentation/screens/medical_history_screen.dart';
import 'package:telemedicine/features/patient_appointments/presentation/screens/patient_appointments_screen.dart';

class OurServices extends StatelessWidget {
  const OurServices({super.key});
  @override
  Widget build(BuildContext context) {
    final List<ServiceData> services = [
      ServiceData(
        icon: Icons.check_box,
        serviceDescription: 'home.chat_with_ai'.tr(),
        serviceTitle: 'home.check_your_self'.tr(),
      ),
      ServiceData(
        icon: Icons.calendar_month,
        serviceDescription: 'home.book_fav_doctor'.tr(),
        serviceTitle: 'home.book_doctor'.tr(),
      ),
      ServiceData(
        icon: Icons.history,
        serviceDescription: 'home.show_medical_history'.tr(),
        serviceTitle: 'home.medical_history'.tr(),
      ),
      ServiceData(
        icon: Icons.lock_clock_outlined,
        serviceDescription: 'home.show_appointments'.tr(),
        serviceTitle: 'home.appointments'.tr(),
      ),
    ];
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.h,
      ),
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        services.length,
        (index) => Container(
          margin: EdgeInsets.only(bottom: 12.h),
          child: GestureDetector(
            onTap: () {
              if (index == 0) {
                Navigator.of(context).pushNamed(CheckYourselfScreen.routeName);
              } else if (index == 1) {
                Navigator.of(
                  context,
                ).pushNamed(BookAppointmentScreen.routeName);
              } else if (index == 2) {
                Navigator.of(context).pushNamed(MedicalHistoryScreen.routeName);
              } else if (index == 3) {
                Navigator.of(
                  context,
                ).pushNamed(PatientAppointmentsScreen.routeName);
              }
            },
            child: CustomServiceItem(
              serviceTitle: services[index].serviceTitle,
              serviceDescription: services[index].serviceDescription,
              icon: services[index].icon,
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceData {
  final String serviceTitle;
  final String serviceDescription;
  final IconData icon;

  ServiceData({
    required this.serviceTitle,
    required this.serviceDescription,
    required this.icon,
  });
}
