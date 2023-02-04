import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  Future<void> addAppointment(
      String id,
      String doctorId,
      String doctorName,
      String paitentName,
      String paitentId,
      String date,
      String time,
      String status) async {
    return FirebaseFirestore.instance.collection('appointment').doc(id).set({
      'doctorId': doctorId,
      'doctorName': doctorName,
      'paitentName': paitentName,
      'paitentId': paitentId,
      'date': date,
      'time': time,
      'status': status
    });
  }

  Future<void> addPaitentInfo(
      String number,
      String address,
      String bloodGroup,
      String height,
      String weight,
      String medicalHistory,
      String allergies) async {
    return FirebaseFirestore.instance
        .collection('paitent')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      'number': number,
      'address': address,
      'bloodGroup': bloodGroup,
      'height': height,
      'weight': weight,
      'medicalHistory': medicalHistory,
      'allergies': allergies
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getPaitentINFO() async {
    return FirebaseFirestore.instance
        .collection('paitent')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> populateFieldsDoctor() async {
    return FirebaseFirestore.instance
        .collection('doctor')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
  }

  Future<void> updateProfileDoctor(
      String number, String qualification, String experience) {
    return FirebaseFirestore.instance
        .collection('doctor')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      'number': number,
      'qualification': qualification,
      'experience': experience
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getPaitents(String id) async {
    return FirebaseFirestore.instance.collection('paitent').doc(id).get();
  }
}
