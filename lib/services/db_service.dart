// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class DbService {
  DbService._privateConstructor();
  static final DbService _instance = DbService._privateConstructor();

  factory DbService() {
    return _instance;
  }

  Future<Map<String, dynamic>?> getItemById(
      String collectionName, String documentId) async {
    try {
      DocumentReference documentRef =
          FirebaseFirestore.instance.collection(collectionName).doc(documentId);
      DocumentSnapshot documentSnapshot = await documentRef.get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        print('Document data: $data');
      } else {
        print('Document does not exist on the database');
      }
    } catch (e) {
      print('Error getting document: $e');
    }
    return null;
  }
}
