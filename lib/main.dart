import 'package:flutter/material.dart';

void main() {
  runApp(const Telemedicine());
}

class Telemedicine extends StatelessWidget {
  const Telemedicine({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(appBar: AppBar()));
  }
}
