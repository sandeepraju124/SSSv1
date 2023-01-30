// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';

class MyHeaderDrawer extends StatefulWidget {
  MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

final user = FirebaseAuth.instance.currentUser!;

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
      child: Container(
        color: Colors.black26,
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('images/prof.png'))),
            ),
            Text(
              user.email!,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
