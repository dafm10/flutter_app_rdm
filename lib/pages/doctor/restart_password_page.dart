import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/utils/utils.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';

class RestartPasswordPage extends StatelessWidget {
  RestartPasswordPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ResponsiveUI responsive = ResponsiveUI(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recuperar contraseña",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding * 2, vertical: defaultPadding * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quieres \nrecuperar tu \ncontraseña?",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: priColor.withOpacity(0.8),
              ),
            ),
            SizedBox(height: responsive.hp(1.5)),
            const Text(
              "Ingresa el correo electrónico \nasociado con tu cuenta",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: responsive.hp(2)),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldNormalWidget(
                    hintText: "Correo electrónico",
                    icon: "mail",
                    maxLines: 1,
                    controller: _emailController,
                    isNumeric: false,
                  ),
                  SizedBox(height: responsive.hp(4)),
                  ElevatedButtonWidget(
                    title: "Recuperar contraseña",
                    onFunction: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
