import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthblox/doctor/authenticate.dart';
import 'package:healthblox/paitent/create_account.dart';
import 'package:healthblox/user_home.dart';
import 'package:healthblox/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void authenticate() {
    if (_emailController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_emailController.text)) {
        if (_passwordController.text.isNotEmpty) {
          Authentication auth = Authentication();
          auth
              .signIn(_emailController.text, _passwordController.text)
              .then((value) {
            setState(() {
              isLoading = false;
            });
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const UserHome()));
          });
        } else {
          Fluttertoast.showToast(msg: "Password required");
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
              "Login to your Account",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFieldEmail(controller: TextEditingController()),
            const SizedBox(height: 20),
            TextFieldPassword(
              controller: TextEditingController(),
              hintText: "Enter password",
              labelText: "Password",
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BlackTextNormalCenter(
                    title: "Dont have any account?", size: 14),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (contex) => const CreateAccount())),
                  child: const BlackTextNormalCenter(
                    title: 'Sign Up',
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
