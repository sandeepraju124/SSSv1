// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:sssv1/bottomnavpages/profilepage/header_drawer.dart';
import 'package:sssv1/bottomnavpages/profilepage/profilelist.dart';

class MyProfilepage extends StatelessWidget {
  const MyProfilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // MyHeaderDrawer(),
          Myprofilelist(),
        ],
      ),
    );
  }
}
