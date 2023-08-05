// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sssv1/chat%20service/initialchat_inbox.dart';

// ignore: camel_case_types
class chatpage extends StatelessWidget {
  const chatpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChatInboxPage();
                }));
              },
              child: Text("Press here"))),
    );
  }
}
