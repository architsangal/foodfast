import 'package:flutter/material.dart';
import 'package:foodfast/screens/wrapper.dart';
//import 'package:splashscreen/splashscreen.dart';

// code reference taken from - https://www.geeksforgeeks.org/splash-screen-in-flutter/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    );
  }
}
