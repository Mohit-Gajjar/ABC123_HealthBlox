import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthblox/backend.dart';

import '../widgets.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    populateValues();
    super.initState();
  }

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _medicalHistoryController =
      TextEditingController();
  String email = "";
  String name = "";
  String userId = "";
  final TextEditingController _allergiesController = TextEditingController();
  void populateValues() {
    Backend().getPaitentINFO().then((value) {
      email = value.data()!['email'] as String;
      name = value.data()!['userName'] as String;
      userId = FirebaseAuth.instance.currentUser!.uid;
      _phoneController.text = value.data()!['number'] as String;
      _addressController.text = value.data()!['address'] as String;
      _bloodGroupController.text = value.data()!['bloodGroup'] as String;
      _heightController.text = value.data()!['height'] as String;
      _weightController.text = value.data()!['weight'] as String;
      _medicalHistoryController.text =
          value.data()!['medicalHistory'] as String;
      _allergiesController.text = value.data()!['allergies'] as String;
      setState(() {});
    });
  }

  void updateProfile() {
    Backend()
        .addPaitentInfo(
            _phoneController.text,
            _addressController.text,
            _bloodGroupController.text,
            _heightController.text,
            _weightController.text,
            _medicalHistoryController.text,
            _allergiesController.text)
        .then((value) => Fluttertoast.showToast(
            msg: "Profile Updated",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text("Update your profile",
              style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: $name",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 20.0),
                Text(
                  "Email: $email",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                TextButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: userId)).then(
                          (result) => Fluttertoast.showToast(
                              msg: "Copied to clipboard",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0));
                    },
                    child: Text("User ID: $userId")),
                const SizedBox(height: 20.0),
                TextFieldText(
                    controller: _phoneController,
                    hintText: "1234567890",
                    labelText: "Enter your phone number"),
                const SizedBox(height: 20.0),
                TextFieldText(
                    controller: _addressController,
                    hintText: "23 Park Street, New York, U",
                    labelText: "Enter your address"),
                const SizedBox(height: 20.0),
                TextFieldText(
                    controller: _bloodGroupController,
                    hintText: "O+",
                    labelText: "Enter your Blood Group"),
                const SizedBox(height: 20.0),
                TextFieldText(
                    controller: _heightController,
                    hintText: "5.4",
                    labelText: "Enter your height"),
                const SizedBox(height: 20.0),
                TextFieldText(
                    controller: _weightController,
                    hintText: "64",
                    labelText: "Enter your weight"),
                const SizedBox(height: 20.0),
                TextFieldText(
                    controller: _medicalHistoryController,
                    hintText: "Diabetes",
                    labelText: "Enter your medical history"),
                const SizedBox(height: 20.0),
                TextFieldText(
                    controller: _allergiesController,
                    hintText: "Allergies",
                    labelText: "Enter your allergies"),
                const SizedBox(height: 20.0),
                CustomBlackButtonRounded(
                    title: "Update",
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    onPressed: () {
                      if (_addressController.text.isNotEmpty &&
                          _bloodGroupController.text.isNotEmpty &&
                          _heightController.text.isNotEmpty &&
                          _weightController.text.isNotEmpty &&
                          _medicalHistoryController.text.isNotEmpty &&
                          _allergiesController.text.isNotEmpty &&
                          _phoneController.text.isNotEmpty) {
                        updateProfile();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please fill all the fields")));
                      }
                    }),
                    const SizedBox(height: 20.0)
              ],
            ),
          ),
        ));
  }
}
