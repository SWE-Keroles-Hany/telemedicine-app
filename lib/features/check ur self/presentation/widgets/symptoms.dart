import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'symptom_item.dart';

class Symptoms extends StatefulWidget {
  const Symptoms({super.key});

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  int selected = -1;

  List<Symptom> symptoms = [
    Symptom(title: "Fever", icon: "assets/icons/fever.png"),
    Symptom(title: "Fatigue", icon: "assets/icons/stress.png"),
    Symptom(title: "Headache", icon: "assets/icons/stress.png"),
    Symptom(title: "Cough", icon: "assets/icons/cough.png"),
    Symptom(title: "Shortness", icon: "assets/icons/difficulty-breathing.png"),
    Symptom(title: "Nausea", icon: "assets/icons/nausea.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: symptoms.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 60.h,
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selected = index;
              setState(() {});
            },
            child: SymptomItem(
              isSelected: selected == index,
              icon: symptoms[index].icon,
              title: symptoms[index].title,
            ),
          );
        },
      ),
    );
  }
}

class Symptom {
  final String title;
  final String icon;

  Symptom({required this.title, required this.icon});
}
