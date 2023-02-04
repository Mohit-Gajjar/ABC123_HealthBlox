import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthblox/paitent/create_account.dart';
import 'package:healthblox/paitent/user_home.dart';

class AuthenticationUser extends StatefulWidget {
  const AuthenticationUser({super.key});

  @override
  State<AuthenticationUser> createState() => _AuthenticationUserState();
}

class _AuthenticationUserState extends State<AuthenticationUser> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
      if (snapshot.hasData) {
        return const UserHome();
      } else {
        return const CreateAccount();
      }
    });
  }
}
