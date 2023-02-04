import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthblox/backend.dart';
import 'package:healthblox/doctor/authenticate.dart';
import 'package:healthblox/doctor/doctor_home.dart';
import 'package:healthblox/doctor/login.dart';
import 'package:healthblox/widgets.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  bool isLoading = false;
  void authenticate() {
    if (_emailController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_emailController.text)) {
        if (_userNameController.text.isEmpty) {
          Fluttertoast.showToast(msg: "Username required");
        } else {
          if (_passwordController.text.isNotEmpty) {
            if (_passwordController.text == _confirmPasswordController.text) {
              Authentication auth = Authentication();
              auth
                  .signUp(
                      _emailController.text, _confirmPasswordController.text)
                  .then((value) {
                var id = FirebaseAuth.instance.currentUser?.uid;
                Backend()
                    .addUser(
                        _emailController.text, id!, _userNameController.text)
                    .then((value) {
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DoctorHome()));
                });
              });
            } else {
              Fluttertoast.showToast(msg: "Password doesn't match");
            }
          } else {
            Fluttertoast.showToast(msg: "Password required");
          }
        }
      } else {
        Fluttertoast.showToast(msg: "Enter proper email");
      }
    } else {
      Fluttertoast.showToast(msg: "Email required");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(height: 100),
            const Text(
              "Create your Doctor account",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFieldEmail(controller: TextEditingController()),
            const SizedBox(height: 20),
             TextFieldText(
                        controller: _userNameController,
                        labelText: 'Enter User Name',
                        hintText: 'example',
                      ),
            const SizedBox(height: 20),
            TextFieldPassword(
              controller: _passwordController,
              hintText: "Enter password",
              labelText: "Password",
            ),
            const SizedBox(height: 20),
            TextFieldPassword(
              controller: _confirmPasswordController,
              hintText: "Confirm password",
              labelText: "Confirm Password",
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const BlackTextNormalStart(
                  title: 'Forgot password?',
                  size: 14,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BlackTextNormalCenter(title: "Already a user?", size: 14),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (contex) => const Login())),
                  child: const BlackTextNormalCenter(
                    title: 'Sign In',
                    size: 12,
                  ),
                )
              ],
            ),
            CustomBlackButtonRounded(
                title: "Create Account",
                height: 60,
                width: MediaQuery.of(context).size.width,
                onPressed: authenticate)
          ],
        )),
      ),
    );
  }
}

class TextFieldText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText, labelText;
  const TextFieldText({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.text_fields),
          hintText: hintText,
          label: Text(labelText),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}