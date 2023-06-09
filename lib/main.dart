import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/pages/pages.dart';
import 'package:flutter_app_rdm/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SPGlobal prefs = SPGlobal();
  await prefs.initShared();
  await Firebase.initializeApp();
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
      home: PreInit(),
      // home: DoctorListPage(),
    );
  }
}

class PreInit extends StatelessWidget {
  Future<String> getRole() async {
    // ignore: no_leading_underscores_for_local_identifiers
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString("isLogin") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRole(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          String role = snap.data;
          if (role == "Administrator") {
            return DoctorListPage();
          } else if (role == "Doctor") {
            return HomeDoctorPage();
          } else {
            return const LoginDoctorPage();
          }
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
