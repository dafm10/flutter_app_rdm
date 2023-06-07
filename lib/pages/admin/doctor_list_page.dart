import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/models/models.dart';
import 'package:flutter_app_rdm/pages/pages.dart';
import 'package:flutter_app_rdm/services/firebase_service.dart';
import 'package:flutter_app_rdm/utils/utils.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection("users");

  final FirebaseService _userService = FirebaseService(collection: 'users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void deleteUser(String id) {
    _userService.deleteUser(id);
    // _userReference.doc(id).delete().then((value) {}).catchError((onError) {
    //   messageErrorSnackBar(context, 7);
    // });
  }

  Future<void> deleteEmail() async {
    User user = _auth.currentUser!;

    try {
      await user.delete();
      print(user.email);
      print('User account deleted successfully.');
    } catch (e) {
      print('Failed to delete user account: $e');
    }
  }

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: priColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormDoctorPage(
                title: "Registrar",
                bottom: "Guardar",
                userModel: null,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
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
                        onDelete: () {
                          deleteUser(users[index].id.toString());
                          deleteEmail();
                          messageErrorSnackBar(context, 0);
                        },
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
