import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/models/models.dart';
import 'package:flutter_app_rdm/pages/pages.dart';
import 'package:flutter_app_rdm/services/firebase_service.dart';
import 'package:flutter_app_rdm/utils/utils.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';

class FormDoctorPage extends StatefulWidget {
  UserModel? userModel;
  String title;
  String bottom;

  FormDoctorPage({
    super.key,
    this.userModel,
    required this.title,
    required this.bottom,
  });

  @override
  State<FormDoctorPage> createState() => _FormDoctorPageState();
}

class _FormDoctorPageState extends State<FormDoctorPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseService _userService = FirebaseService(collection: 'users');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _copController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool status = true;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    if (widget.userModel != null) {
      _nameController.text = widget.userModel!.name;
      _copController.text = widget.userModel!.cop;
      _phoneController.text = widget.userModel!.phone;
      _emailController.text = widget.userModel!.email;
    }
    isLoading = false;
    setState(() {});
  }

  void register() async {
    if (_formKey.currentState!.validate()) {
      UserModel userModel = UserModel(
        role: "Doctor",
        cop: _copController.text,
        phone: _phoneController.text,
        name: _nameController.text,
        email: _emailController.text,
        // password: _passwordController.text,
        status: status,
      );
      if (widget.userModel == null) {
        try {
          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
          if (userCredential.user != null) {
            _userService.addUser(userModel).then((value) {
              if (value.isNotEmpty) {
                messageSuccessSnackBar(context, 3);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDoctorPage(
                            userModel: userModel,
                          )),
                  (route) => false,
                );
              }
            });
          }
        } on FirebaseAuthException catch (e) {
          print(e);
        }
      } else {
        userModel.id = widget.userModel!.id;
        _userService.updateUser(userModel).then((value) {
          messageSuccessSnackBar(context, 1);
          Navigator.pop(context);
        });
      }
    }
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
      body: !isLoading
          ? Stack(
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
                          Text(
                            widget.title,
                            style: const TextStyle(
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
                                SizedBox(height: responsive.hp(2)),
                                TextFieldNormalWidget(
                                  maxLines: 1,
                                  hintText: "COP Nº",
                                  icon: "hash",
                                  controller: _copController,
                                  isNumeric: true,
                                  typeInput: TypeInputTextField.cop,
                                ),
                                SizedBox(height: responsive.hp(2)),
                                TextFieldNormalWidget(
                                  maxLines: 1,
                                  hintText: "Teléfono",
                                  icon: "phone",
                                  controller: _phoneController,
                                  isNumeric: true,
                                  typeInput: TypeInputTextField.phone,
                                ),
                                SizedBox(height: responsive.hp(2)),
                                TextFieldNormalWidget(
                                  maxLines: 1,
                                  hintText: "Correo electrónico",
                                  icon: "mail",
                                  controller: _emailController,
                                  isNumeric: false,
                                ),
                                SizedBox(height: responsive.hp(2)),
                                TextFieldPasswordWidget(
                                  validator: true,
                                  controller: _passwordController,
                                ),
                                SizedBox(height: responsive.hp(2)),
                                const Text(
                                  "Todos los datos son obligatorios para su aprobación",
                                  style: TextStyle(
                                    color: grayColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: responsive.hp(3)),
                                ElevatedButtonWidget(
                                  title: widget.bottom,
                                  onFunction: () {
                                    register();
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
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
