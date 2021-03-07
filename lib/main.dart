import 'package:flutter/material.dart';
import 'package:foodfast/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:splashscreen/splashscreen.dart';

// code reference taken from - https://www.geeksforgeeks.org/splash-screen-in-flutter/

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    );
  }
}
