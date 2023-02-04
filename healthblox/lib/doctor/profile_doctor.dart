import 'package:flutter/material.dart';
import 'package:healthblox/backend.dart';

import '../widgets.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _qualificationController =
      TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  @override
  void initState() {
    populateFields();
    super.initState();
  }

  void populateFields() {
    Backend().populateFieldsDoctor().then((value) {
      setState(() {
        _numberController.text = value.data()!['number'];
        _qualificationController.text = value.data()!['qualification'];
        _experienceController.text = value.data()!['experience'];
      });
    });
  }

  void updateProfile() {
    Backend()
        .updateProfileDoctor(_numberController.text,
            _qualificationController.text, _experienceController.text)
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Profile Updated Successfully"))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Profile', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFieldText(
                  controller: _numberController,
                  hintText: "1234567890",
                  labelText: "Enter your number",
                ),
                const SizedBox(height: 20),
                TextFieldText(
                  controller: _qualificationController,
                  hintText: "MBBS, PHD",
                  labelText: "Enter your Qualifications",
                ),
                const SizedBox(height: 20),
                TextFieldText(
                  controller: _experienceController,
                  hintText: "3years",
                  labelText: "Enter your Experience",
                ),
                const SizedBox(height: 20),
                CustomBlackButtonRounded(
                    title: "Update Profile",
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    onPressed: () {
                      if (_experienceController.text.isEmpty &&
                          _numberController.text.isEmpty &&
                          _qualificationController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please fill all the fields")));
                      } else {
                        updateProfile();
                      }
                    })
              ],
            ),
          ),
        ));
  }
}

class CustomBlackButtonRounded extends StatelessWidget {
  final String title;
  final double height, width;
  final VoidCallback onPressed;
  const CustomBlackButtonRounded({
    Key? key,
    required this.title,
    required this.height,
    required this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            fixedSize: MaterialStateProperty.all(Size(width, height)),
            backgroundColor: MaterialStateProperty.all(Colors.black)),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
