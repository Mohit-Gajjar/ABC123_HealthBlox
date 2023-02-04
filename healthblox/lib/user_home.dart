import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: Text("Welcome to Healthblox this is the user home page"),
      )
    );
  }
}
