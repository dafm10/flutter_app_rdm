import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/pages/pages.dart';
import 'package:flutter_app_rdm/services/firebase_service.dart';
import 'package:flutter_app_rdm/utils/utils.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';
import 'package:lottie/lottie.dart';

class LoginDoctorPage extends StatefulWidget {
  const LoginDoctorPage({super.key});

  @override
  State<LoginDoctorPage> createState() => _LoginDoctorPageState();
}

class _LoginDoctorPageState extends State<LoginDoctorPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  SPGlobal prefs = SPGlobal();

  final FirebaseService _userService = FirebaseService(collection: 'users');

  getData() {
    // _userReference.get().then((QuerySnapshot value) {
    //   List<QueryDocumentSnapshot> docs = value.docs;
    //   docs.forEach((QueryDocumentSnapshot element) {
    //     // print(element.id);
    //     // print(element.data());
    //     Map<String, dynamic> myMap = element.data() as Map<String, dynamic>;
    //     // print(myMap["cop"]);
    //   });
    // });
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      try {
        isLoading = true;
        setState(() {});
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (userCredential.user != null) {
          String email = userCredential.user!.email!;
          _userService.getUser(email).then((value) {
            if (value != null) {
              prefs.isLogin = value.role;
              prefs.userName = value.name.split(" ").first;
              prefs.roleAdmin = value.role;
              prefs.doctorId = value.id!;

              if (value.role == "Administrator") {
                isLoading = false;
                setState(() {});
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorListPage(),
                  ),
                  (route) => false,
                );
              } else {
                isLoading = false;
                setState(() {});
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDoctorPage(),
                    ),
                    (route) => false);
              }
            }
          });
        }
      } on FirebaseAuthException catch (e) {
        errorSwitch(e.code, context);
        isLoading = false;
        setState(() {});
      }
      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveUI responsive = ResponsiveUI(context);
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
              SizedBox(height: responsive.hp(4)),
              Column(
                children: [
                  const Text(
                    "Iniciar Sesión",
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
              SizedBox(height: responsive.hp(4)),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding,
                    horizontal: defaultPadding * 2,
                  ),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFieldNormalWidget(
                            maxLines: 1,
                            hintText: "Correo electrónico",
                            icon: "mail",
                            controller: _emailController,
                            isNumeric: false,
                          ),
                          SizedBox(height: responsive.hp(3)),
                          TextFieldPasswordWidget(
                            hinText: "Contraseña",
                            validator: true,
                            controller: _passwordController,
                          ),
                          SizedBox(height: responsive.hp(3)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RestartPasswordPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Olvidé mi contraseña",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: priColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: responsive.hp(5.5)),
                          ElevatedButtonWidget(
                            title: "Iniciar Sesión",
                            onFunction: () {
                              login();
                            },
                          ),
                          SizedBox(height: responsive.hp(3)),
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
                                      builder: (context) => FormDoctorPage(
                                        title: "Registro",
                                        bottom: "Registrar",
                                      ),
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
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Lottie.asset(
                              "assets/lotties/login.json",
                              animate: false,
                              height: responsive.hp(25),
                              fit: BoxFit.contain,
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
          isLoading
              ? Container(
                  color: grayColor.withOpacity(0.6),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
