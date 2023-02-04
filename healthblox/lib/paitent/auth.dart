import 'package:flutter/material.dart';
import 'package:healthblox/paitent/create_account.dart';
import 'package:healthblox/user_home.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(builder: (context, snapshot) {
      if (snapshot.hasData) {
        return const UserHome();
      } else {
        return const CreateAccount();
      }
    });
  }
}