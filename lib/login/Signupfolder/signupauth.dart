// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Signupfolder/signuppage.dart';
import '../signedin.dart';

class Signupauth extends StatelessWidget {
  const Signupauth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SignedinPage();
          } else {
            return SignUpPage();
          }
        },
      ),
    );
  }
}
