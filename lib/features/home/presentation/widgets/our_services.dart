import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/features/home/presentation/widgets/custom_service_item.dart';

class OurServices extends StatelessWidget {
  OurServices({super.key});

  final List<ServiceData> services = [
    ServiceData(
      icon: Icons.person,
      serviceDescription: "Sympton Analysis",
      serviceTitle: "Check Yourself",
    ),
    ServiceData(
      icon: Icons.upload,
      serviceDescription: "Upload & Ai",
      serviceTitle: "All Labs Results",
    ),
    ServiceData(
      icon: Icons.calendar_month,
      serviceDescription: "Book Doctor",
      serviceTitle: "Virtual Consults",
    ),
    ServiceData(
      icon: Icons.notes,
      serviceDescription: "Prescritpions",
      serviceTitle: "Active Orders",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6.w,
          mainAxisSpacing: 6.h,
        ),
        itemBuilder: (context, index) => CustomServiceItem(
          icon: services[index].icon,
          serviceDescription: services[index].serviceTitle,
          serviceTitle: services[index].serviceDescription,
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
