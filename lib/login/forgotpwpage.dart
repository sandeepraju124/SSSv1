// ignore_for_file: prefer_const_constructors, empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sssv1/utils/constants.dart';

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
        backgroundColor: Colors.white54,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: tgDarkPrimaryColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Reset password',
          style: TextStyle(
              color: tgDarkPrimaryColor,
              fontWeight: FontWeight.w200,
              fontSize: 15),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter your Email and we will send you a password reset link',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.w300,
                // color: Color.fromARGB(181, 0, 0, 0)
                color: Colors.black),
          ),
          //email field//
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _emailcontroller,
              // style: TextStyle(color: Colors.white38),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Enter your E-mail',
                labelStyle: TextStyle(
                    color: Color.fromARGB(191, 0, 0, 0),
                    fontWeight: FontWeight.w200,
                    fontSize: 14),
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
                suffixIcon:
                    Icon(Icons.mail_outlined, color: tgLightPrimaryColor),
              ),
            ),
          ),

          MaterialButton(
            onPressed: passwordReset,
            color: tgDarkPrimaryColor,
            child: Text(
              'Reset Password',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
      // onPressed: passwordReset,
    );
  }
}
