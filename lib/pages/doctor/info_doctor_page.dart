import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/models/user_model.dart';
import 'package:flutter_app_rdm/utils/constants.dart';
import 'package:flutter_app_rdm/utils/responsive.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';

class InfoDoctorPage extends StatefulWidget {
  UserModel? userModel;

  InfoDoctorPage({this.userModel});

  @override
  State<InfoDoctorPage> createState() => _InfoDoctorPageState();
}

class _InfoDoctorPageState extends State<InfoDoctorPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _copController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.userModel != null) {
      _nameController.text = widget.userModel!.name;
      _copController.text = widget.userModel!.cop;
      _phoneController.text = widget.userModel!.phone;
      _emailController.text = widget.userModel!.email;
    }
    ;
  }

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
                      "Mi Perfil",
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
                            textInputType: TextInputType.text,
                            controller: _nameController,
                            isNumeric: false,
                          ),
                          SizedBox(height: responsive.hp(2)),
                          TextFieldNormalWidget(
                            maxLines: 1,
                            hintText: "COP Nº",
                            icon: "hash",
                            textInputType: TextInputType.number,
                            controller: _copController,
                            isNumeric: true,
                          ),
                          SizedBox(height: responsive.hp(2)),
                          TextFieldNormalWidget(
                            maxLines: 1,
                            hintText: "Teléfono",
                            icon: "phone",
                            textInputType: TextInputType.number,
                            controller: _phoneController,
                            isNumeric: true,
                          ),
                          SizedBox(height: responsive.hp(2)),
                          TextFieldNormalWidget(
                            maxLines: 1,
                            hintText: "Correo electrónico",
                            icon: "mail",
                            textInputType: TextInputType.text,
                            controller: _emailController,
                            isNumeric: false,
                          ),
                          SizedBox(height: responsive.hp(2)),
                          TextFieldPasswordWidget(
                            validator: true,
                            controller: _passwordController,
                          ),
                          SizedBox(height: responsive.hp(3)),
                          const Text(
                            "Por seguridad no puedes editar tu Nro. de COP",
                            style: TextStyle(
                              color: grayColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: responsive.hp(3)),
                          ElevatedButtonWidget(
                            title: "Modificar",
                            onFunction: () {
                              if (_formKey.currentState!.validate()) {}
                            },
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
