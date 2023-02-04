import 'package:flutter/material.dart';
import 'package:healthblox/doctor/profile_doctor.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('HealthBlox', style: TextStyle(color: Colors.black),), actions: [
        IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DoctorProfile())),
            icon: const Icon(Icons.menu))
      ]),
    );
  }
}
