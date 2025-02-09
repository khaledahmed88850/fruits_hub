import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/services/database_services.dart';
import 'package:flutter/material.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return (data.data() as Map<String, dynamic>);
  }

  @override
  Future<bool> ifDataExists(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<List<Map<String, dynamic>>> getAllData(
      {required String path, Map<String, dynamic>? query}) async {
    if (query == null) {
      var data = await firestore.collection(path).get();
      return data.docs.map((e) => e.data()).toList();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query['orderBy'] != null) {
        var orderByQuery = query['orderBy'];
        var descendingQuery = query['descending'];
        data = data.orderBy(orderByQuery, descending: descendingQuery);
      }
      if (query['limit'] != null) {
        int limitQuery = query['limit'];
        data = data.limit(limitQuery);
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }
}
