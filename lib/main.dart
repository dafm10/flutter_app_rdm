import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/pages/doctor/login_doctor_page.dart';

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
        ),
        home: const LoginDoctorPage());
  }
}
