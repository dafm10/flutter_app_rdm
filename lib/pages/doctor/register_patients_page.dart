import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_rdm/data/data.dart';
import 'package:flutter_app_rdm/models/checkbox_model.dart';
import 'package:flutter_app_rdm/utils/constants.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: priColor.withOpacity(0.8),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_outlined),
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
                        const TextFieldNormalWidget(
                          hintText: "Nombres",
                          icon: "user",
                          maxLines: 1,
                        ),
                        const SizedBox(height: 20.0),
                        const TextFieldNormalWidget(
                          hintText: "Apellidos",
                          icon: "user",
                          maxLines: 1,
                        ),
                        const SizedBox(height: 20.0),
                        TextRegisterFormWidget(
                          title: "Número de celular: ",
                        ),
                        const TextFieldNormalWidget(
                          hintText: "Teléfono",
                          icon: "phone",
                          maxLines: 1,
                          isNumeric: true,
                          textInputType: TextInputType.number,
                        ),
                        const SizedBox(height: 20.0),
                        TextRegisterFormWidget(
                          title: "Forma de contacto: ",
                        ),
                        SizedBox(
                          height: 30,
                          child: CustomScrollView(
                            physics: const NeverScrollableScrollPhysics(),
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
                        ExpansionTileWidget(
                          title: "RADIOGRAFÍAS EXTRABUCALES DIGITALES",
                          childrens: SizedBox(
                            height: 360,
                            width: double.infinity,
                            child: CustomScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              slivers: [
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      final CheckBoxModel checkRed =
                                          checkRED[index];
                                      return CheckBoxWidget(
                                        checkBoxModel: checkRed,
                                      );
                                    },
                                    childCount: checkRED.length,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        ExpansionTileWidget(
                          title: "ANÁLISIS CEFALOMÉTRICOS COMPUTARIZADOS",
                          childrens: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextSubtitleWidget(
                                subTitle: "Radíografía lateral digital :",
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                height: 130,
                                child: CustomScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
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
                                          final CheckBoxModel checkRld =
                                              checkRLD[index];
                                          return CheckBoxWidget(
                                            checkBoxModel: checkRld,
                                          );
                                        },
                                        childCount: checkRLD.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextSubtitleWidget(
                                subTitle: "Frontal :",
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                height: 50,
                                child: CustomScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
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
                                          final CheckBoxModel checkFront =
                                              checkFrontal[index];
                                          return CheckBoxWidget(
                                            checkBoxModel: checkFront,
                                          );
                                        },
                                        childCount: checkFrontal.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextSubtitleWidget(
                                subTitle: "Radiografía Bite Wing Molar :",
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                height: 50,
                                child: CustomScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
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
                                          final CheckBoxModel checkRbwm =
                                              checkRBWM[index];
                                          return CheckBoxWidget(
                                            checkBoxModel: checkRbwm,
                                          );
                                        },
                                        childCount: checkRBWM.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextSubtitleWidget(
                                subTitle: "Radiografía Bite Wing Pre Molar :",
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                height: 50,
                                child: CustomScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
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
                                          final CheckBoxModel checkRbwpm =
                                              checkRBWPM[index];
                                          return CheckBoxWidget(
                                            checkBoxModel: checkRbwpm,
                                          );
                                        },
                                        childCount: checkRBWPM.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextSubtitleWidget(
                                subTitle: "Radiografía Oclusal :",
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                height: 50,
                                child: CustomScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
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
                                          final CheckBoxModel checkOclu =
                                              checOclusal[index];
                                          return CheckBoxWidget(
                                            checkBoxModel: checkOclu,
                                          );
                                        },
                                        childCount: checOclusal.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ExpansionTileWidget(
                          title: "FOTOGRAFÍA CLÍNICA DENTAL",
                          childrens: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextSubtitleWidget(
                                subTitle: "EXTRABUCALES :",
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                height: 100,
                                child: CustomScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
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
                                          final CheckBoxModel checkExtrabucal =
                                              checExtrabucales[index];
                                          return CheckBoxWidget(
                                            checkBoxModel: checkExtrabucal,
                                          );
                                        },
                                        childCount: checExtrabucales.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextSubtitleWidget(
                                subTitle: "INTRABUCALES :",
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                height: 130,
                                child: CustomScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
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
                                          final CheckBoxModel checkIntrabucal =
                                              checkIntrabucales[index];
                                          return CheckBoxWidget(
                                            checkBoxModel: checkIntrabucal,
                                          );
                                        },
                                        childCount: checkIntrabucales.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ExpansionTileWidget(
                          title: "RADIOGRAFÍAS INTRABUCALES",
                          childrens: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: CustomScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
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
                                          final CheckBoxModel checkPeriap =
                                              checkPeriapical[index];
                                          return CheckBoxWidget(
                                            checkBoxModel: checkPeriap,
                                          );
                                        },
                                        childCount: checkPeriapical.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset("assets/images/Dientes.jpg"),
                              const SizedBox(height: 20.0),
                              Row(
                                children: [
                                  TextSubtitleWidget(
                                    subTitle: "Escribir las piezas: ",
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: grayColor.withOpacity(0.08),
                                            offset: const Offset(4, 4),
                                            blurRadius: 12.0,
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9.]')),
                                        ],
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.0,
                                              color: grayColor,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.0,
                                              color: grayColor,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.0,
                                              color: grayColor,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.0,
                                              color: grayColor,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.0,
                                              color: grayColor,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        ExpansionTileWidget(
                          title: "EXÁMENES COMPLEMENTARIOS",
                          childrens: SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: CustomScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              slivers: [
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      final CheckBoxModel checkExam =
                                          checkExamenes[index];
                                      return CheckBoxWidget(
                                        checkBoxModel: checkExam,
                                      );
                                    },
                                    childCount: checkExamenes.length,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButtonWidget(
                          onFunction: () {},
                          title: "Enviar Registro",
                        ),
                        const SizedBox(height: 16.0),
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
