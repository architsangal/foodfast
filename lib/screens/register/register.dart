import 'package:flutter/material.dart';
import 'package:foodfast/screens/home/home.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _controllerEMail = TextEditingController();
  final _controllerPassword = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.brown),
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 244, 245, 248),
          body: Center(
              child: ListView(
            children: <Widget>[
              Image(
                  image: AssetImage('assets/register.png'), fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.blue[900],
                  ),
                  controller: _controllerEMail,
                  cursorColor: Colors.amberAccent,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.brown[300],
                          fontStyle: FontStyle.italic),
                      contentPadding: EdgeInsets.all(20.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      labelText: 'IIITB E-Mail',
                      hintText: '@iiib.org or @iiitb.ac.in',
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: Colors.brown,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.blue[900],
                  ),
                  controller: _controllerPassword,
                  cursorColor: Colors.amberAccent,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.brown[300],
                          fontStyle: FontStyle.italic),
                      contentPadding: EdgeInsets.all(20.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: Colors.brown,
                      )),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
                  Widget>[
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        var email = _controllerEMail.text.split("@");
                        if (EmailValidator.validate(_controllerEMail.text)) {
                          if (email[1] == "iiitb.org" ||
                              email[1] == "iiitb.ac.in") {
                            register();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          }
                        }
                      },
                      child: new Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.brown,
                    )),
              ]),
            ],
          )),
        ));
  }

  void verification() async {
    User user = FirebaseAuth.instance.currentUser;

    if (!user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  void register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _controllerEMail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
