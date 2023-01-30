// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, empty_catches, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../google_login_controller.dart';
import '../forgotpwpage.dart';
import '../Signupfolder/signupauth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controller//

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future SignIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

    super.dispose();
  }

  bool passwordObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Log In',
          style: TextStyle(color: Colors.black),
        ),
        // elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(children: [
            // email field //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: _emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(181, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 17.5),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: Icon(
                    Icons.mail_outlined,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            //password field//

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: _passwordcontroller,
                obscureText: passwordObscured,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(181, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 17.5),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        passwordObscured = !passwordObscured;
                      });
                    },
                    child: Icon(
                      passwordObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),

            //forgot PW field//
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgotPasswordPage();
                      }));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Color.fromARGB(207, 5, 68, 82),
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),

            //sign in field//

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GestureDetector(
                onTap: SignIn,
                child: Container(
                  padding: EdgeInsets.all(22.0),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple.shade600,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 310),

            // google signup//

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  side: BorderSide(
                    color: Colors.black45,
                    width: 0.7,
                  ),
                ),
                onPressed: () {
                  final provider = Provider.of<GoogleSignInController>(context,
                      listen: false);
                  provider.login();
                },
                label: Text(
                  "Sign up with Google",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 30),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(children: [
                  Padding(padding: EdgeInsets.only(left: 30)),
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        color: Color.fromARGB(181, 0, 0, 0),
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    // onTap: widget.showSignupPage,

                    onTap: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Signupauth();
                      }));
                    }),
                    child: Text('Sign Up.',
                        style: TextStyle(
                            color: Color.fromARGB(207, 5, 68, 82),
                            fontWeight: FontWeight.bold,
                            fontSize: 21)),
                  ),
                ])),
          ]),
        ),
      ),
    );
  }
}
