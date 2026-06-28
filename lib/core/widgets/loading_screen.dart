import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: ColorManager.primary),
      ),
    );
  }
}
