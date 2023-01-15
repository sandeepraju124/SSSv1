// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import './google_login_controller.dart';

import 'package:provider/provider.dart';

class GloginIntialPage extends StatefulWidget {
  // final String loginControls;
  const GloginIntialPage({
    super.key,
    // required this.loginControls,
  });

  @override
  State<GloginIntialPage> createState() => _GloginIntialPageState();
}

class _GloginIntialPageState extends State<GloginIntialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Google Login",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      body: loginUI(),
    );
  }

  loginUI() {
    return Consumer<GoogleSignInController>(
      builder: (context, model, child) {
        if (model.googleAccount != null) {
          return Center(
            child: loggedUI(model),
          );
        } else {
          return loginControls(context);
        }
      },
    );
  }

  loggedUI(GoogleSignInController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.googleAccount!.photoUrl ?? '').image,
          radius: 50,
        ),
        Text(model.googleAccount!.displayName ?? ''),
        Text(model.googleAccount!.email),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text('Logout'),
          onPressed: (() {
            Provider.of<GoogleSignInController>(context, listen: false)
                .logOut();
          }),
        ),
      ],
    );
  }

  // Future Login() async {
  //   var data = await Provider.of<GoogleSignInController>(context, listen: false)
  //       .login();
  //   return data;
  // }

  // void Login() {
  //   // ignore: void_checks
  //   return Provider.of<GoogleSignInController>(context, listen: false).login();
  // }

  loginControls<widget>(BuildContext context) {
    return Provider.of<GoogleSignInController>(context, listen: false).login();
    // return Column(
    //   children: [
    //     ElevatedButton.icon(
    //       style: ElevatedButton.styleFrom(
    //         backgroundColor: Colors.white,
    //         minimumSize: Size(double.infinity, 50),
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(11),
    //         ),
    //         side: BorderSide(
    //           color: Colors.black45,
    //           width: 0.7,
    //         ),
    //       ),
    //       onPressed: () {
    //         // // Provider.of<GoogleSignInController>(context, listen: false)
    //         // //     .login();
    //         // // // // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //         // // // //   return GoogleAuthI();
    //         // // // // }));

    //         // // // Authgooglesignin().signInWithGoogle();
    //         // Navigator.push(context,
    //         //     MaterialPageRoute(builder: (context) {
    //         //   return GloginIntialPage();
    //         // }));
    //       },
    //       label: Text(
    //         "Sign up with Google",
    //         textAlign: TextAlign.center,
    //         style: TextStyle(
    //           color: Colors.black87,
    //           fontSize: 18,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       icon: FaIcon(
    //         FontAwesomeIcons.google,
    //         color: Colors.red,
    //       ),
    //     ),
    //   ],
    // );
  }
}
