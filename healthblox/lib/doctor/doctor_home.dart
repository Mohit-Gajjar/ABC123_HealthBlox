import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthblox/backend.dart';
import 'package:healthblox/doctor/profile_doctor.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  String address = '';
  String bloodGroup = '';
  String height = '';
  String weight = '';
  String medicalHistory = '';
  String allergies = '';
  String number = '';
  String email = '';
  String userName = '';
  String id = '';
  bool isLoading = true;
  void getDoctorData(String id) async {
    isLoading = true;
    setState(() {});
    await Backend().getPaitents(id).then((value) {
      setState(() {
        address = value.data()!['address'];
        bloodGroup = value.data()!['bloodGroup'];
        height = value.data()!['height'];
        weight = value.data()!['weight'];
        medicalHistory = value.data()!['medicalHistory'];
        allergies = value.data()!['allergies'];
        number = value.data()!['number'];
        email = value.data()!['email'];
        userName = value.data()!['userName'];
        isLoading = false;
      });
    });
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'HealthBlox',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DoctorProfile())),
                icon: const Icon(Icons.menu))
          ]),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onSubmitted: (val) {
                  getDoctorData(val);
                },
                keyboardType: TextInputType.text,
                controller: controller,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.text_fields),
                    hintText: "askldflasdf",
                    label: const Text("Enter paitent id check record"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              isLoading
                  ? const Center(child: Text("Paitent's data will show here"))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text('Name: $userName'),
                        const SizedBox(height: 20),
                        Text('Email: $email'),
                        const SizedBox(height: 20),
                        Text('Number: $number'),
                        const SizedBox(height: 20),
                        Text('Address: $address'),
                        const SizedBox(height: 20),
                        Text('Blood Group: $bloodGroup'),
                        const SizedBox(height: 20),
                        Text('Height: $height'),
                        const SizedBox(height: 20),
                        Text('Weight: $weight'),
                        const SizedBox(height: 20),
                        Text('Medical History: $medicalHistory'),
                        const SizedBox(height: 20),
                        Text('Allergies: $allergies'),
                        const SizedBox(height: 20),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
