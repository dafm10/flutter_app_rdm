import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/models/models.dart';
import 'package:flutter_app_rdm/pages/pages.dart';
import 'package:flutter_app_rdm/utils/constants.dart';
import 'package:flutter_app_rdm/utils/responsive.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';
import 'package:lottie/lottie.dart';

class HomeDoctorPage extends StatefulWidget {
  UserModel? userModel;

  HomeDoctorPage({this.userModel});

  @override
  State<HomeDoctorPage> createState() => _HomeDoctorPageState();
}

class _HomeDoctorPageState extends State<HomeDoctorPage> {
  @override
  Widget build(BuildContext context) {
    ResponsiveUI responsive = ResponsiveUI(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
      body: Column(children: [
        Center(
          child: Image.asset(
            "assets/images/logo_c.jpeg",
            width: ResponsiveUI(context).wp(45),
          ),
        ),
        SizedBox(height: responsive.hp(7)),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormDoctorPage(
                  bottom: "Guardar",
                  title: "Mi Perfil",
                ),
              ),
            );
          },
          child: ContainerHomeWidget(
            icon: Icons.manage_accounts_outlined,
            title: "MI PERFIL",
            subTitle: "Ver y Editar Información",
            color: greenColor,
          ),
        ),
        SizedBox(height: responsive.hp(7)),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPatientsPage(),
              ),
            );
          },
          child: ContainerHomeWidget(
            icon: Icons.list_alt_outlined,
            title: "CREAR SOLICITUD",
            subTitle: "Ingresa registro de tu paciente",
            color: purpleColor,
          ),
        ),
        Lottie.asset(
          "assets/lotties/profile.json",
          animate: false,
          height: responsive.hp(20),
        ),
      ]),
    );
  }
}
