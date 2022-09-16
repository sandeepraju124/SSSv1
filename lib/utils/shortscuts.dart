import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShortCuts{

  void push(context,newscreen){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => newscreen()));
  }

}