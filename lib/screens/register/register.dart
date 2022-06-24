import 'package:flutter/material.dart';
import 'package:foodfast/screens/register/verification_otp.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:toast/toast.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:email_validator/email_validator.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _controllerEMail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerPasswordR = TextEditingController();
  // FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.brown),
        home: Scaffold(
            backgroundColor: const Color.fromARGB(255, 244, 245, 248),
            body: Form(
              key: _formKey,
              child: Center(
                  child: ListView(
                children: <Widget>[
                  const Image(
                      image: AssetImage('assets/register.png'),
                      fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
                          contentPadding: const EdgeInsets.all(15.0),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          labelText: 'IIITB E-Mail',
                          hintText: '@iiib.org or @iiitb.ac.in',
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                            color: Colors.brown,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.blue[900],
                      ),
                      controller: _controllerPassword,
                      autocorrect: false,
                      cursorColor: Colors.amberAccent,
                      validator: (value) {
                        if (value!.length < 2) {
                          return 'Weak Password';
                        }
                        return null;
                      },
                      cursorHeight: 25,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.brown[300],
                              fontStyle: FontStyle.italic),
                          contentPadding: const EdgeInsets.all(15.0),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          labelText: 'Password',
                          prefixIcon: const Icon(
                            Icons.vpn_key_rounded,
                            color: Colors.brown,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
                          contentPadding: const EdgeInsets.all(15.0),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          labelText: 'Confirm Password',
                          prefixIcon: const Icon(
                            Icons.vpn_key_rounded,
                            color: Colors.brown,
                          )),
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.brown,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              onPressed: () {
                                var email = _controllerEMail.text.split("@");
                                if (_formKey.currentState!.validate()) {
                                  if (EmailValidator.validate(
                                      _controllerEMail.text)) {
                                    if (email[1] == "iiitb.org" ||
                                        email[1] == "iiitb.ac.in") {
                                      _register();
                                      // ignore: avoid_print
                                    }
                                  }
                                } else {}
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ]),
                ],
              )),
            )));
  }

  Future<void> _register() async {
    String mail = _controllerEMail.text;
    String pass = _controllerPassword.text;
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _controllerEMail.text, password: _controllerPassword.text);

      User user = FirebaseAuth.instance.currentUser;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
        // ignore: use_build_context_synchronously
        Toast.show("Verification Email Sent", context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            textColor: Colors.deepPurple[900],
            backgroundColor: Colors.grey[50]);
      }

      try {
        // ignore: unused_local_variable
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _controllerEMail.text,
                password: _controllerPassword.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          // ignore: avoid_print
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          // ignore: avoid_print
          print('Wrong password provided for that user.');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
        Toast.show("Account Already exist", context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            textColor: Colors.deepPurple[900],
            backgroundColor: Colors.grey[50]);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    // ignore: use_build_context_synchronously
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => verification_otp(mail, pass)));
  }

  @override
  void dispose() {
    _controllerEMail.dispose();
    _controllerPassword.dispose();
    _controllerPasswordR.dispose();
    super.dispose();
  }
}
