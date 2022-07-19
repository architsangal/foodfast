import 'package:flutter/material.dart';
import 'package:foodfast/screens/authenticate/forgot_password.dart';
import 'package:foodfast/screens/authenticate/register.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodfast/screens/userside/home/main_screen.dart';
import 'package:foodfast/screens/managerside/main_screen.dart' as managerside;


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _controllerEMail = TextEditingController();
  final _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.authStateChanges().listen((User user) {
    //  if (user == null) {
    //   print('User is currently signed out!');
    // } else {
    // print('User is signed in!');
    // }
    //});

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: ListView(
            children: <Widget>[
              const Image(
                  image: AssetImage('assets/auth.png'), fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _controllerEMail,
                  cursorColor: Colors.blue,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.blue[300], fontStyle: FontStyle.italic),
                      contentPadding: const EdgeInsets.all(20.0),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      labelText: 'IIITB E-Mail',
                      hintText: '@iiib.org or @iiitb.ac.in',
                      prefixIcon: const Icon(
                        Icons.email_rounded,
                        color: Colors.blue,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _controllerPassword,
                  obscureText: true,
                  cursorColor: Colors.blue,
                  cursorHeight: 25,
                  decoration: const InputDecoration(
                      hoverColor: Colors.blue,
                      contentPadding: EdgeInsets.all(20.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      labelText:
                          // ignore: todo
                          'Password', // TODO show password or don't show password eye symbol
                      prefixIcon: Icon(
                        Icons.vpn_key_rounded,
                        color: Colors.blue,
                      )),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const Forgot())),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.blue[600]),
                          ),
                        )
                      ])),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () {
                            _signIn();
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: const Text('Don\'t have an account?',
                        style: TextStyle(color: Color(0xFF2E3233))),
                    onTap: () {},
                  ),
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Register()),
                          ),
                      child: const Text(
                        'Register.',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ],
          )),
        ));
  }

  void _signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _controllerEMail.text, password: _controllerPassword.text);
      // ignore: avoid_print
      print(userCredential.toString());
      // ignore: use_build_context_synchronously
      // ignore: use_build_context_synchronously
      if(_controllerEMail.text  == "manager@iiitb.org"){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const managerside.MainScreen()));
      }
      else{
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const MainScreen()));
      }
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        print('Wrong password provided for that user.');
      }
    }
  }
}
