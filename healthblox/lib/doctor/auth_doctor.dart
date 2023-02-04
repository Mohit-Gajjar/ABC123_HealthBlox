import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthblox/doctor/create_account.dart';
import 'package:healthblox/doctor/doctor_home.dart';

class AuthenticationDoctor extends StatefulWidget {
  const AuthenticationDoctor({super.key});

  @override
  State<AuthenticationDoctor> createState() => _AuthenticationDoctorState();
}

class _AuthenticationDoctorState extends State<AuthenticationDoctor> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const DoctorHome();
          } else {
            return const CreateAccount();
          }
        });
  }
}
