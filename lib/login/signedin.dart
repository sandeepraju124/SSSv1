// // // ignore_for_file: prefer_const_constructors, non_constant_identifier_names

// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:login_ui/google_signinPages/googlesigin.dart';
// // import 'package:provider/provider.dart';

// // class SignedinPage extends StatefulWidget {
// //   const SignedinPage({super.key});

// //   @override
// //   State<SignedinPage> createState() => _SignedinPageState();
// // }

// // class _SignedinPageState extends State<SignedinPage> {
// //   final User = FirebaseAuth.instance.currentUser!;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back),
// //           // color: Colors.black,
// //           onPressed: () {
// //             Navigator.of(context).pop();
// //           },
// //         ),
// //         title: Text(
// //           'Logged In',
// //           style: TextStyle(color: Colors.black),
// //         ),
// //         centerTitle: true,
// //         actions: [
// //           TextButton(
// //               onPressed: () {
// //                 final provider =
// //                     Provider.of<GoogleSignInProvider>(context, listen: false);
// //                 provider.logout();
// //               },
// //               child: Text('Logout')),
// //         ],
// //       ),
// //       body: Container(
// //         alignment: Alignment.center,
// //         color: Colors.white,
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               "Signed in as ",
// //               style: TextStyle(fontSize: 20),
// //             ),
// //             SizedBox(height: 10),
// //             Text(
// //               'Name: ' + User.email!,
// //               style: TextStyle(fontSize: 16),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // ignore_for_file: prefer_const_constructors, non_constant_identifier_names

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'google_signinPages/Authgooglesigin.dart';

// class SignedinPage extends StatefulWidget {
//   const SignedinPage({super.key});

//   @override
//   State<SignedinPage> createState() => _SignedinPageState();
// }

// class _SignedinPageState extends State<SignedinPage> {
//   final User = FirebaseAuth.instance.currentUser!;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'if you have logged in using Email, Make sure to Signout',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 12),
//           Text(
//             // ignore: prefer_interpolation_to_compose_strings
//             'Signed in as :' + User.email!,
//             style: TextStyle(fontSize: 15),
//           ),
//           MaterialButton(
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//               // TextButton(
//               //     onPressed: () {
//               //       final provider = Provider.of<GoogleSignInProvider>(context,
//               //           listen: false);
//               //       provider.logout();
//               //     },
//               //     child: Text('Logout'));
//             },
//             color: Colors.deepPurple.shade700,
//             child: Text(
//               'Sign out',
//               style: TextStyle(
//                   fontSize: 17,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             "if you've logged in using Google signup, Make sure to logout",
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 12),
//           Text(
//             // ignore: prefer_interpolation_to_compose_strings
//             'Signed in as :' + User.email!,
//             style: TextStyle(fontSize: 15),
//           ),
//           MaterialButton(
//             onPressed: () {
//               final provider =
//                   Provider.of<GoogleSignInProvider>(context, listen: false);
//               provider.logout();
//             },
//             color: Colors.deepPurple.shade700,
//             child: Text(
//               'Logout',
//               style: TextStyle(
//                   fontSize: 17,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignedinPage extends StatelessWidget {
  SignedinPage({super.key});

  final User = FirebaseAuth.instance.currentUser!;

  void signUserout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: signUserout,
            icon: Icon(
              Icons.logout,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'LOGGED IN AS :' + User.email!,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
