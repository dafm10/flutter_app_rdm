import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/models/models.dart';
import 'package:flutter_app_rdm/pages/pages.dart';
import 'package:flutter_app_rdm/utils/utils.dart';
import 'package:flutter_app_rdm/widget/doctor_list_widget.dart';

class DoctorListPage extends StatelessWidget {
  DoctorListPage({super.key});

  // final FirebaseService _userService = FirebaseService(collection: 'users');
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: priColor,
        title: const Text(
          "Lista de Doctores",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: _userReference.snapshots(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  QuerySnapshot collection = snap.data;
                  List<UserModel> users = collection.docs.map<UserModel>((e) {
                    UserModel user =
                        UserModel.fromJson(e.data() as Map<String, dynamic>);
                    user.id = e.id;
                    return user;
                  }).toList();
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: ((context, index) {
                      return DoctorListWidget(
                        title: users[index].name,
                        status: users[index].status,
                        onDelete: () {},
                        onEdit: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormDoctorPage(
                                userModel: users[index],
                                title: "Mi Perfil",
                                bottom: "Guardar",
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
