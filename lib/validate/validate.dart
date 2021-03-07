import 'package:flutter/material.dart';
import 'package:foodfast/screens/authenticate/sign_in.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new SignIn(),
      title: new Text(
        'Please register by clicking on the link sent to you via email.',
        style: TextStyle(color: Colors.blue),
        textScaleFactor: 3,
      ),
    );
  }
}
