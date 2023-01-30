// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sssv1/login/google_login_controller.dart';
import 'package:provider/provider.dart';

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({super.key});

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(height: 460),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                side: BorderSide(color: Colors.black26, width: 0.7),
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInController>(context, listen: false);
                provider.logOut();
              },
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              )),
        )
      ]),
    );
  }
}
