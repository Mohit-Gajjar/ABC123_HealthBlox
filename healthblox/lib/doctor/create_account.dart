import 'package:flutter/material.dart';
import 'package:healthblox/doctor/login.dart';
import 'package:healthblox/widgets.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
              "Create Account",
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
            TextFieldPassword(
              controller: TextEditingController(),
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
                onPressed: () {})
          ],
        )),
      ),
    );
  }
}
