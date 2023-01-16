// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sssv1/screens/homepage.dart';

import './initialpage.dart';

class redirection extends StatelessWidget {
  const redirection({super.key});

  // const redirection({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // CircularProgressIndicator shown during user loging
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            // if user already login this screen shows
            return MyHomePage();
          } else if (snapshot.hasError) {
            print("something went worng");
          } else {
            // if user not login this screen shows
            return InitialPage();
          }
          return throw (e) {
            print("through in redirection");
            print(e);
          };
        }));
  }
}

// handleAuthState() {
//   print('stream builderr called');
//   return StreamBuilder(
//
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.hasData) {
//           return Home();
//         } else {
//           return const InitialPage();
//         }
//       });
// }