import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:foodfast/screens/authenticate/sign_in.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _controllerEMail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerPasswordR = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _success;
  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.brown),
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 244, 245, 248),
            body: Form(
              key: _formKey,
              child: Center(
                  child: ListView(
                children: <Widget>[
                  Image(
                      image: AssetImage('assets/register.png'),
                      fit: BoxFit.cover),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.blue[900],
                      ),
                      controller: _controllerEMail,
                      cursorColor: Colors.amberAccent,
                      validator: (value) {
                        var email = _controllerEMail.text.split("@");
                        if (!EmailValidator.validate(value) ||
                            (!(email[1] == "iiitb.org" ||
                                email[1] == "iiitb.ac.in"))) {
                          return "Enter Correct Email";
                        }
                        return null;
                      },
                      autocorrect: false,
                      cursorHeight: 25,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.brown[300],
                              fontStyle: FontStyle.italic),
                          contentPadding: EdgeInsets.all(15.0),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          labelText: 'IIITB E-Mail',
                          hintText: '@iiib.org or @iiitb.ac.in',
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: Colors.brown,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.blue[900],
                      ),
                      controller: _controllerPassword,
                      autocorrect: false,
                      cursorColor: Colors.amberAccent,
                      validator: (value) {
                        if (value.length < 6) {
                          return 'Weak Password';
                        }
                        return null;
                      },
                      cursorHeight: 25,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.brown[300],
                              fontStyle: FontStyle.italic),
                          contentPadding: EdgeInsets.all(15.0),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.vpn_key_rounded,
                            color: Colors.brown,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.blue[900],
                      ),
                      controller: _controllerPasswordR,
                      cursorColor: Colors.amberAccent,
                      cursorHeight: 25,
                      validator: (value) {
                        if (value != _controllerPassword.text) {
                          return 'Password Mismatch';
                        }
                        return null;
                      },
                      autocorrect: false,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.brown[300],
                              fontStyle: FontStyle.italic),
                          contentPadding: EdgeInsets.all(15.0),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(
                            Icons.vpn_key_rounded,
                            color: Colors.brown,
                          )),
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(15.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              onPressed: () {
                                var email = _controllerEMail.text.split("@");
                                if (_formKey.currentState.validate()) {
                                  if (EmailValidator.validate(
                                      _controllerEMail.text)) {
                                    if (email[1] == "iiitb.org" ||
                                        email[1] == "iiitb.ac.in") {
                                      var r = _register();
                                      print(r);
                                      if (r == 1) {}
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignIn()),
                                      );
                                    }
                                  }
                                } else {}
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
            )));
  }

  _register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _controllerEMail.text, password: _controllerPassword.text);

      User user = FirebaseAuth.instance.currentUser;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
        Toast.show("Verification Email Sent", context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            textColor: Colors.deepPurple[900],
            backgroundColor: Colors.grey[50]);
      }
      return 0;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Toast.show("Account Already exist", context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            textColor: Colors.deepPurple[900],
            backgroundColor: Colors.grey[50]);
        print('The account already exists for that email.');
      }
    }
  }

  @override
  void dispose() {
    _controllerEMail.dispose();
    _controllerPassword.dispose();
    _controllerPasswordR.dispose();
    super.dispose();
  }
}
