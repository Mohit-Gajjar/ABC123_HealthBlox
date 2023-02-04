import 'package:cloud_firestore/cloud_firestore.dart';

class Backend {
    Future<void> addUser(String email, String id, String userName) async {
    return FirebaseFirestore.instance
        .collection('paitent')
        .doc(id)
        .set({'email': email, 'userName': userName, 'key': 'paitent'});
  }
  Future<void> addDoctor(String email, String id, String userName) async {
    return FirebaseFirestore.instance
        .collection('doctor')
        .doc(id)
        .set({'email': email, 'userName': userName, 'key': 'doctor'});
  }

}