import 'package:flutter/material.dart';

class Navigators{

void navigatorPush(BuildContext context,Widget page){
Navigator.push(context,MaterialPageRoute(builder: (context) =>page),);


}

}
