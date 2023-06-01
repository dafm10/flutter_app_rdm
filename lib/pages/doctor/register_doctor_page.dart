import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/utils/utils.dart';
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
    ResponsiveUI responsive = ResponsiveUI(context);
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
                    SizedBox(height: responsive.hp(4)),
                    const Text(
                      "Registro",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: priColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: responsive.hp(1)),
                    Container(
                      width: 30.0,
                      height: 1.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(height: responsive.hp(3)),
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
                            controller: _nameController,
                            isNumeric: false,
                          ),
                          SizedBox(height: responsive.hp(2.5)),
                          TextFieldNormalWidget(
                            maxLines: 1,
                            hintText: "COP Nº",
                            icon: "hash",
                            controller: _copController,
                            isNumeric: true,
                            typeInput: TypeInputTextField.dni,
                          ),
                          SizedBox(height: responsive.hp(2.5)),
                          TextFieldNormalWidget(
                            maxLines: 1,
                            hintText: "Teléfono",
                            icon: "phone",
                            controller: _phoneController,
                            isNumeric: true,
                            typeInput: TypeInputTextField.phone,
                          ),
                          SizedBox(height: responsive.hp(2.5)),
                          TextFieldNormalWidget(
                            maxLines: 1,
                            hintText: "Correo electrónico",
                            icon: "mail",
                            controller: _emailController,
                            isNumeric: false,
                          ),
                          SizedBox(height: responsive.hp(2.5)),
                          TextFieldPasswordWidget(
                            validator: true,
                            controller: _passwordController,
                          ),
                          SizedBox(height: responsive.hp(3)),
                          const Text(
                            "Todos los datos son obligatorios para su aprobación",
                            style: TextStyle(
                              color: grayColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: responsive.hp(9)),
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
