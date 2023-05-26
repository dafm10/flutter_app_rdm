import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/pages/doctor/pages.dart';
import 'package:flutter_app_rdm/utils/constants.dart';
import 'package:flutter_app_rdm/utils/responsive.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDoctorPage extends StatefulWidget {
  const HomeDoctorPage({super.key});

  @override
  State<HomeDoctorPage> createState() => _HomeDoctorPageState();
}

class _HomeDoctorPageState extends State<HomeDoctorPage> {
  @override
  Widget build(BuildContext context) {
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
        const SizedBox(height: 60.0),
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
        const SizedBox(height: 60.0),
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
        const SizedBox(height: 50.0),
        SizedBox(
          height: ResponsiveUI(context).hp(20),
          child: SvgPicture.asset(
            "assets/images/doctors.svg",
          ),
        ),
      ]),
    );
  }
}
