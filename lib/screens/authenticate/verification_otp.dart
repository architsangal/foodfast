import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types, must_be_immutable
class verification_otp extends StatefulWidget {
  String email;
  String password;

  verification_otp(this.email, this.password, {Key? key}) : super(key: key);

  // verification_otp(String email, String password,
  //     {Key key, this.email, this.password})
  //     : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _verification_otpState createState() => _verification_otpState();
}

// ignore: camel_case_types
class _verification_otpState extends State<verification_otp> {
  // ignore: unused_field
  final _controllerEMail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.brown),
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: ListView(
            children: <Widget>[
              const Image(
                  image: AssetImage('assets/otp.png'), fit: BoxFit.cover),
              const Text(
                "A verification link has been sent.\nPlease verify your email.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                    fontSize: 20),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: TextField(
              //     keyboardType: TextInputType.number,
              //     style: const TextStyle(
              //       color: Colors.brown,
              //     ),
              //     controller: _controllerEMail,
              //     cursorColor: Colors.amberAccent,
              //     cursorHeight: 25,
              //     decoration: InputDecoration(
              //         hintStyle: TextStyle(
              //             color: Colors.brown[300],
              //             fontStyle: FontStyle.italic),
              //         contentPadding: const EdgeInsets.all(20.0),
              //         enabledBorder: const OutlineInputBorder(
              //             borderSide: BorderSide(color: Colors.brown),
              //             borderRadius: BorderRadius.all(Radius.circular(30))),
              //         border: const OutlineInputBorder(
              //             borderSide: BorderSide(color: Colors.brown),
              //             borderRadius: BorderRadius.all(Radius.circular(30))),
              //         labelText: 'Enter the OTP here',
              //         prefixIcon: Icon(
              //           Icons.security_rounded,
              //           color: Colors.amber[300],
              //         )),
              //   ),
              // ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
                  Widget>[
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber[300],
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () async {
                        String email = widget.email;
                        String password = widget.password;
                        // ignore: avoid_print
                        print(email);
                        // ignore: avoid_print
                        print(password);

                        try {
                          // ignore: unused_local_variable
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            // ignore: avoid_print
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            // ignore: avoid_print
                            print('Wrong password provided for that user.');
                          }
                        }

                        await FirebaseAuth.instance.currentUser.reload();
                        // ignore: avoid_print
                        print(FirebaseAuth.instance.currentUser.emailVerified);
                      },
                      child: const Text(
                        "Verify",
                        style: TextStyle(color: Colors.brown),
                      ),
                    )),
              ]),
            ],
          )),
        ));
  }
}
