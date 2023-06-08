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

  Future<String> addUser(UserModel userModel) async {
    try {
      DocumentReference document =
          await _collectionReference.add(userModel.toJson());
      return document.id;
    } on TimeoutException catch (e) {
      return Future.error("Error 1 $e");
    } on SocketException catch (e) {
      return Future.error("Error 2 $e");
    } on Error catch (e) {
      return Future.error("Error 3 $e");
    }
  }

  Future<String> updateUser(UserModel userModel) async {
    try {
      await _collectionReference.doc(userModel.id).update(userModel.toJson());
      return userModel.id!;
    } on TimeoutException catch (e) {
      return Future.error("Error 1 $e");
    } on SocketException catch (e) {
      return Future.error("Error 2 $e");
    } on Error catch (e) {
      return Future.error("Error 3 $e");
    }
  }

  deleteUser(String id) async {
    try {
      await _collectionReference.doc(id).delete();
      return 1;
    } on TimeoutException catch (e) {
      return Future.error("Error 1 $e");
    } on SocketException catch (e) {
      return Future.error("Error 2 $e");
    } on Error catch (e) {
      return Future.error("Error 3 $e");
    }
  }

  Future<UserModel?> getUser(String email) async {
    try {
      QuerySnapshot collection =
          await _collectionReference.where('email', isEqualTo: email).get();
      if (collection.docs.isNotEmpty) {
        QueryDocumentSnapshot doc = collection.docs.first;
        Map<String, dynamic> myMap = doc.data() as Map<String, dynamic>;
        UserModel userModel = UserModel.fromJson(myMap);
        userModel.id = doc.id;
        return userModel;
      }
    } on TimeoutException catch (e) {
      return Future.error("Error 1 $e");
    } on SocketException catch (e) {
      return Future.error("Error 2 $e");
    } on Error catch (e) {
      return Future.error("Error 3 $e");
    }
    return null;
  }
}
