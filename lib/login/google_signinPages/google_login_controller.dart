// ignore_for_file: unnecessary_this, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  Future login() async {
    // print("called login");
    try {
      final userAccount = await _googleSignIn.signIn();
      if (userAccount == null) return;
      googleAccount = userAccount;
      print("user account $userAccount");
      final googleAuth = await userAccount.authentication;
      print("google auth $googleAuth");
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      // await FirebaseAuth.instance.signInWithCredential(credentials);
      FirebaseAuth.instance.signInWithCredential(credential);
      // print(googleAuth.accessToken);
      // print(googleAuth.idToken);
      print("googleaccount $googleAccount");
    } catch (e) {
      print("exemption catched");
      print(e.toString());
    }
    notifyListeners();
  }

  logOut() async {
    this.googleAccount = await _googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
