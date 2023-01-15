// // ignore_for_file: avoid_print

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInProvider extends ChangeNotifier {
//   final googleSignIn = GoogleSignIn();

//   // final provider = Provider.of(Context,listen: false);
//   // Provider.logout();

//   GoogleSignInAccount? _user;

//   GoogleSignInAccount get user => _user!;

//   Future googleLogin() async {
//     try {
//       final googleUser = await googleSignIn.signIn();

//       if (googleUser == null) return;
//       _user = googleUser;

//       final googleAuth = await googleUser.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       await FirebaseAuth.instance.signInWithCredential(credential);
//     } catch (e) {
//       print(e.toString());
//     }

//     notifyListeners();
//   }

//   Future logout() async {
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authgooglesignin {
  // google sign in
  signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
