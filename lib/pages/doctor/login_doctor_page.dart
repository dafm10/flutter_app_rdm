import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/pages/doctor/home_doctor_page.dart';
import 'package:flutter_app_rdm/pages/doctor/register_doctor_page.dart';
import 'package:flutter_app_rdm/utils/constants.dart';
import 'package:flutter_app_rdm/utils/responsive.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginDoctorPage extends StatefulWidget {
  const LoginDoctorPage({super.key});

  @override
  State<LoginDoctorPage> createState() => _LoginDoctorPageState();
}

class _LoginDoctorPageState extends State<LoginDoctorPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 64.0, bottom: 16),
                  child: Image.asset(
                    "assets/images/logo_RDM.jpg",
                    // width: 176.32,
                    width: ResponsiveUI(context).wp(48),
                  ),
                ),
              ),
              const FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "Inicia sesión o regístrate para tener acceso",
                  style: TextStyle(
                    color: grayColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              Column(
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: priColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: 30.0,
                    height: 1.0,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding,
                    horizontal: defaultPadding * 2,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFieldNormalWidget(
                            maxLines: 1,
                            hintText: "Correo electrónico",
                            icon: "mail",
                            textInputType: TextInputType.text,
                            controller: _emailController,
                          ),
                          const SizedBox(height: 24.0),
                          TextFieldPasswordWidget(
                            validator: true,
                            controller: _passwordController,
                          ),
                          const SizedBox(
                            height: 28.0,
                          ),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Olvidé mi contraseña",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: priColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 51.0),
                          ElevatedButtonWidget(
                            title: "Iniciar Sesión",
                            onFunction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeDoctorPage(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "¿No tienes una cuenta?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: grayColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterDoctorPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Regístrate",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: priColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SvgPicture.asset(
                              "assets/images/login-draw.svg",
                              height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
