import 'package:flutter/material.dart';

import '../backend.dart';
import '../widgets.dart';

class AddTreatment extends StatelessWidget {
  final String email, name, userid;
  const AddTreatment(
      {super.key,
      required this.email,
      required this.name,
      required this.userid});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    void makeTreatment() async {
      await Backend()
          .addPaitentTreatment(userid, userNameController.text, email, name)
          .then((value) => Navigator.pop(context));
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('Add Treatment',
              style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextFieldText(
                controller: userNameController,
                labelText: 'Enter treatment',
                hintText: 'example',
              ),
              const SizedBox(height: 20),
              CustomBlackButtonRounded(
                  title: "Add",
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {
                    if (userNameController.text.isNotEmpty) {
                      makeTreatment();
                    }
                  })
            ],
          ),
        ));
  }
}
