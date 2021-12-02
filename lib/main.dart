import 'package:flutter/material.dart';
import 'package:foodfast/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'package:splashscreen/splashscreen.dart';
// https://www.youtube.com/watch?v=CcOYbbev5-Y
// code reference taken from - https://www.geeksforgeeks.org/splash-screen-in-flutter/

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          return Wrapper();
        });
  }
}
