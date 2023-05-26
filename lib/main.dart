import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/pages/doctor/pages.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RDM',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: scaffoldColor,
      ),
      home: const LoginDoctorPage(),
    );
  }
}
