// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../login/google_signinPages/google_login_controller.dart';
import 'package:provider/provider.dart';

class Myprofilelist extends StatefulWidget {
  const Myprofilelist({super.key});

  @override
  State<Myprofilelist> createState() => _MyprofilelistState();
}

class _MyprofilelistState extends State<Myprofilelist> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 300),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                minimumSize: Size(300, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(11)))),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInController>(context, listen: false);
              provider.logOut();
            },
            child: Text(
              'logout',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ))
      ],
    );
  }
}
