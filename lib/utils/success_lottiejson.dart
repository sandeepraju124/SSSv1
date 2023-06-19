import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class lottie extends StatelessWidget {
  const lottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Lottie.asset("images/success.json"),));
  }
}