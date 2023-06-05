import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/pages/doctor/pages.dart';
import 'package:flutter_app_rdm/utils/constants.dart';
import 'package:flutter_app_rdm/utils/responsive.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';
import 'package:lottie/lottie.dart';

class HomeDoctorPage extends StatefulWidget {
  const HomeDoctorPage({super.key});

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
                builder: (context) => InfoDoctorPage(),
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
        Lottie.network(
          "https://assets2.lottiefiles.com/packages/lf20_xyadoh9h.json",
          animate: false,
          height: responsive.hp(25),
        ),
      ]),
    );
  }
}
