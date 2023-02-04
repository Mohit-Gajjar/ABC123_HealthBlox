import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthblox/doctor/auth_doctor.dart';
import 'package:healthblox/paitent/auth_user.dart';
import 'doctor/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Healthblox',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthenticationUser(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Healthblox',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthenticationDoctor(),
      );
    }
  }
}
