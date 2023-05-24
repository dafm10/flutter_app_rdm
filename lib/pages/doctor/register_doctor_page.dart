import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/utils/constants.dart';
import 'package:flutter_app_rdm/utils/responsive.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';

class RegisterDoctorPage extends StatefulWidget {
  const RegisterDoctorPage({super.key});

  @override
  State<RegisterDoctorPage> createState() => _RegisterDoctorPageState();
}

class _RegisterDoctorPageState extends State<RegisterDoctorPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _copController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/logo_RDM.jpg",
                        // width: 176.32,
                        width: ResponsiveUI(context).wp(48),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    const Text(
                      "Registro",
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
                            hintText: "Nombres y Apellidos",
                            icon: "user",
                            textInputType: TextInputType.text,
                            controller: _nameController,
                          ),
                          const SizedBox(height: 24.0),
                          TextFieldNormalWidget(
                            maxLines: 1,
                            hintText: "COP Nº",
                            icon: "hash",
                            textInputType: TextInputType.number,
                            controller: _copController,
                          ),
                          const SizedBox(height: 24.0),
                          TextFieldNormalWidget(
                            maxLines: 1,
                            hintText: "Teléfono",
                            icon: "phone",
                            textInputType: TextInputType.number,
                            controller: _phoneController,
                          ),
                          const SizedBox(height: 24.0),
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
                          const SizedBox(height: 24.0),
                          const Text(
                            "Todos los datos son obligatorios para su aprobación",
                            style: TextStyle(
                              color: grayColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 80.0),
                          ElevatedButtonWidget(
                            title: "Registrar",
                            onFunction: () {},
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
