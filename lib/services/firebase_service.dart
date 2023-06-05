import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_rdm/models/models.dart';

class FirebaseService {
  final String collection;

  FirebaseService({required this.collection});

  late final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(collection);

  Future<List<UserModel>> getUserList() async {
    try {
      List<UserModel> userList = [];
      QuerySnapshot collection = await _collectionReference.get();
      if (collection.docs.isNotEmpty) {
        for (var element in collection.docs) {
          Map<String, dynamic> myMap = element.data() as Map<String, dynamic>;
          UserModel user = UserModel.fromJson(myMap);
          user.id = element.id;
          userList.add(user);
        }
      }
      return userList;
    } on TimeoutException catch (e) {
      return Future.error("Error 1 $e");
    } on SocketException catch (e) {
      return Future.error("Error 2 $e");
    } on Error catch (e) {
      return Future.error("Error 3 $e");
    }
  }
}
