import 'package:flutter/material.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: Text("Welcome to Healthblox this is the Doctor home page"),
      )
    );
  }
}
