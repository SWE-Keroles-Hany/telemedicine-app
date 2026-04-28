import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/features/book%20appointment/presentation/screens/book_appointment_screen.dart';
import 'package:telemedicine/features/check%20ur%20self/presentation/screens/check_your_self_screen.dart';
import 'package:telemedicine/features/home/presentation/widgets/custom_service_item.dart';

class OurServices extends StatelessWidget {
  OurServices({super.key});

  final List<ServiceData> services = [
    ServiceData(
      icon: Icons.check_box,
      serviceDescription: "Chat With AI",
      serviceTitle: "Check Your Self",
    ),
    ServiceData(
      icon: Icons.calendar_month,
      serviceDescription: "Book your fav Doctor",
      serviceTitle: "Book A Doctor",
    ),
    ServiceData(
      icon: Icons.history,
      serviceDescription: "Show Medical History",
      serviceTitle: "Medical History",
    ),
    ServiceData(
      icon: Icons.lock_clock_outlined,
      serviceDescription: "Show Appointments",
      serviceTitle: "Appointments",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.h,
      ),
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(

        services.length,
        (index) => Container(
          margin: EdgeInsets.only(bottom: 12.h),
          child: GestureDetector(
            onTap: () {
              if (index == 0) {
                Navigator.of(context).pushNamed(CheckYourSelfScreen.routeName);
              } else {
                
              Navigator.of(context).pushNamed(BookAppointmentScreen.routeName);
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
