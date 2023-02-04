import 'package:flutter/material.dart';

class PaitentHome extends StatefulWidget {
  const PaitentHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaitentHomeState createState() => _PaitentHomeState();
}

class _PaitentHomeState extends State<PaitentHome> {
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: Text("Welcome to Healthblox this is the Doctor home page"),
      )
    );
  }
}
