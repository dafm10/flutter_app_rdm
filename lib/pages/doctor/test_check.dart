import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/data/data.dart';
import 'package:flutter_app_rdm/models/checkbox_model.dart';
import 'package:flutter_app_rdm/utils/constants.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';

class RegisterPatientsPage extends StatefulWidget {
  // CheckBoxModel checkBoxModel;
  // final TrackingScrollController scrollController;

  const RegisterPatientsPage({
    // required this.checkBoxModel,
    // required this.scrollController,
    super.key,
  });

  @override
  State<RegisterPatientsPage> createState() => _RegisterPatientsPageState();
}

class _RegisterPatientsPageState extends State<RegisterPatientsPage> {
  List<CheckBoxModel> checkboxContact = checkboxContacts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: priColor.withOpacity(0.8),
            leading: IconButton(
              onPressed: () {
                print("back");
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
              iconSize: 24.0,
            ),
            title: const Text(
              "Formulario de solicitud de servicio",
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: -0.8,
              ),
            ),
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 2,
                    vertical: defaultPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Hola Dr. ",
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding,
                    horizontal: defaultPadding * 2,
                  ),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          title: "Forma de contacto: ",
                        ),
                        // SliverList(
                        //   delegate: SliverChildBuilderDelegate(
                        //     (context, index) {
                        //       final CheckBoxModel checkboxContact =
                        //           checkboxContacts[index];
                        //       return CheckBoxWidget(
                        //           checkBoxModel: checkboxContact);
                        //     },
                        //     childCount: checkboxContacts.length,
                        //   ),
                        // ),
                        // ListView.builder(
                        //   padding: EdgeInsets.zero,
                        //   itemCount: checkboxContact.length,
                        //   shrinkWrap: true,
                        //   physics: const BouncingScrollPhysics(),
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return Row(
                        //       children: [
                        //         CheckBoxWidget(
                        //           checkBoxModel: checkboxContact[index],
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // ),
                        // CheckBoxWidget(checkBoxModel: checkboxContact[0]),
                        // CheckBoxWidget(checkBoxModel: checkboxContact[1]),
                        SizedBox(
                          height: 30,
                          child: CustomScrollView(
                            slivers: [
                              SliverGrid(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300.0,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 5.0,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    final CheckBoxModel check =
                                        checkboxContacts[index];
                                    return CheckBoxWidget(
                                      checkBoxModel: check,
                                    );
                                  },
                                  childCount: checkboxContacts.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 100,
                        //   child: CustomScrollView(
                        //     slivers: [
                        //       SliverList(
                        //         delegate: SliverChildBuilderDelegate(
                        //           (context, index) {
                        //             final CheckBoxModel check =
                        //                 checkboxContacts[index];
                        //             return Row(
                        //               children: [
                        //                 CheckBoxWidget(
                        //                   checkBoxModel: check,
                        //                 ),
                        //                 CheckBoxWidget(
                        //                   checkBoxModel: check,
                        //                 ),
                        //               ],
                        //             );
                        //           },
                        //           childCount: checkboxContacts.length,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(height: 20.0),
                        Text2RegisterFormWidget(
                          title: "Observaciones",
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
                        const SizedBox(height: 10.0),
                        const Divider(
                          height: 10.0,
                          thickness: 0.5,
                          color: grayColor,
                        ),
                        const SizedBox(height: 10.0),
                        Text2RegisterFormWidget(
                          title: "RADIOGRAFÍAS EXTRABUCALES DIGITALES",
                        ),
                        const SizedBox(height: 20.0),
                      ],
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
