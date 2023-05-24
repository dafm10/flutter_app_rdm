import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/models/checkbox_model.dart';
import 'package:flutter_app_rdm/utils/constants.dart';
import 'package:flutter_app_rdm/utils/responsive.dart';
import 'package:flutter_app_rdm/widget/checkbox_widget.dart';
import 'package:flutter_app_rdm/widget/elevated_button_widget.dart';
import 'package:flutter_app_rdm/widget/textfield_normal_widget.dart';

class RegisterPatientPage extends StatefulWidget {
  const RegisterPatientPage({super.key});

  @override
  State<RegisterPatientPage> createState() => _RegisterPatientPageState();
}

class _RegisterPatientPageState extends State<RegisterPatientPage> {
  final List<CheckBoxModel> _checkContacts = [];
  final _formKey = GlobalKey<FormState>();
  bool isCheckedPhone = false;
  bool isCheckedWhatsApp = false;

  @override
  void initState() {
    _checkContacts.addAll({
      CheckBoxModel(id: 1, title: "WhatsApp", selected: false),
      CheckBoxModel(id: 2, title: "Teléfono", selected: false),
    });
    super.initState();
  }

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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(height: 20.0),
                const Text(
                  "Formulario de solicitud de servicio",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: priColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  width: 150.0,
                  height: 1.0,
                  color: Colors.black,
                ),
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Buenas tardes Dr. ",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        "Juan Pérez",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: priColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
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
                          TextRegisterFormWidget(
                            title: "Nombres completos del paciente: ",
                          ),
                          TextFieldNormalWidget(
                            hintText: "Nombres",
                            icon: "user",
                            maxLines: 1,
                          ),
                          const SizedBox(height: 20.0),
                          TextFieldNormalWidget(
                            hintText: "Apellidos",
                            icon: "user",
                            maxLines: 1,
                          ),
                          const SizedBox(height: 20.0),
                          TextRegisterFormWidget(
                            title: "Número de celular: ",
                          ),
                          TextFieldNormalWidget(
                            hintText: "Teléfono",
                            icon: "phone",
                            maxLines: 1,
                          ),
                          const SizedBox(height: 20.0),
                          TextRegisterFormWidget(
                            title: "Forma de contacto ",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CheckBoxWidget(
                                isChecked: isCheckedWhatsApp,
                                title: "WhatsApp",
                              ),
                              CheckBoxWidget(
                                isChecked: isCheckedPhone,
                                title: "Teléfono",
                              ),
                            ],
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Observaciones: ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: priColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            maxLines: 5,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: grayColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: grayColor,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: grayColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 150,
                              child: ElevatedButtonWidget(
                                title: "Siguiente",
                                onFunction: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
