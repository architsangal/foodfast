import 'package:flutter/material.dart';
import 'package:foodfast/screens/forgot_password/forgot_password.dart';
import 'package:foodfast/screens/register/register.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _controllerEMail = TextEditingController();
  final _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: ListView(
            children: <Widget>[
              Image(image: AssetImage('assets/auth.png'), fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: _controllerEMail,
                  cursorColor: Colors.blue,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.blue[300], fontStyle: FontStyle.italic),
                      contentPadding: EdgeInsets.all(20.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      labelText: 'IIITB E-Mail',
                      hintText: '@iiib.org or @iiitb.ac.in',
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: Colors.blue,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: _controllerPassword,
                  obscureText: true,
                  cursorColor: Colors.blue,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                      hoverColor: Colors.blue,
                      contentPadding: EdgeInsets.all(20.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      labelText:
                          'Password', // TODO show password or don't show password eye symbol
                      prefixIcon: Icon(
                        Icons.vpn_key_rounded,
                        color: Colors.blue,
                      )),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new Forgot())),
                          child: new Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.blue[600]),
                          ),
                        )
                      ])),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(20.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () {},
                          child: new Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        )),
                  ]),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Don\'t have an account?',
                        style: new TextStyle(color: Color(0xFF2E3233))),
                    onTap: () {},
                  ),
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new Register())),
                      child: new Text(
                        'Register.',
                        style: new TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ],
          )),
        ));
  }
}
