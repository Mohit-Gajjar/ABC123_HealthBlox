import 'package:flutter/material.dart';
import 'package:healthblox/paitent/profile_user.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.black,),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserProfile())),
            )
          ],
          title:
              const Text("Healthblox", style: TextStyle(color: Colors.black)),
        ),
        body: const Center(
          child: Text("Welcome to Healthblox this is the user home page"),
        ));
  }
}
