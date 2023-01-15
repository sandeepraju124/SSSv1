// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './signedin.dart';
import './login folder/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthState extends StatelessWidget {
  const AuthState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SignedinPage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}

// // ignore_for_file: prefer_const_constructors

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:login_ui/loginpage.dart';
// // import 'package:login_ui/loginpage.dart';
// import 'package:login_ui/signedin.dart';

// class AuthState extends StatelessWidget {
//   const AuthState({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasData) {
//             return SignedinPage();
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Something went wrong!'),
//             );
//           } else {
//             return LoginPage();
//           }
//         },
//       ),
//     );
//   }
// }
