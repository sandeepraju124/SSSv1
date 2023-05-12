// ignore_for_file: prefer_const_constructors, empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailcontroller = TextEditingController();

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailcontroller.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(" Password reset link sent! Check your email"),
            );
          });
    } on FirebaseAuthException catch (e) {
      // print(e);
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

    super.dispose();
  }

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
          'Reset password',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter your Email and we will send you a password reset link',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(181, 0, 0, 0)),
          ),
          //email field//
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _emailcontroller,
              // style: TextStyle(color: Colors.white38),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Enter your E-mail',
                labelStyle: TextStyle(
                    color: Color.fromARGB(191, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 17.5),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                  borderRadius: BorderRadius.circular(12),
                ),
                // hintText: "User E-mail",
                // hintStyle: TextStyle(
                //     color: Colors.black54, fontWeight: FontWeight.bold),
                suffixIcon: Icon(
                  Icons.mail_outlined,
                  color: Colors.deepPurple.shade600,
                ),
              ),
            ),
          ),

          MaterialButton(
            onPressed: passwordReset,
            color: Colors.deepPurple.shade600,
            child: Text(
              'Reset Password',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ],
      ),
      // onPressed: passwordReset,
    );
  }
}
