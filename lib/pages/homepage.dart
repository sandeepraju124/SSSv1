import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/searchbar.dart';
import '../widgets/services.dart';
import '../widgets/restaurent.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(61, 108, 231, 1),
      backgroundColor: const Color(0xff49426C),
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(72.0),
          child: Image.asset(
            "images/logo4.png",
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: CircleAvatar(
              radius: 28,
              child: ClipOval(
                child: Image.asset(
                  "images/prof.png",
                  fit: BoxFit.cover,
                  width: 58,
                  height: 58,
                ),
              ),
            ),
          ),
        ],
        toolbarHeight: 70.0,
        backgroundColor: Colors.white,
        elevation: 3.0,
        // leading: IconButton(
        //   icon: const Icon(Icons.leak_remove, color: Colors.black, size: 35.0),
        //   onPressed: () {},
        // ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: const [
          searchbar(),
          SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 0, 5),
                child: Text(
                  "Services",
                  style: TextStyle(
                      fontFamily: "RobotoMono",
                      fontSize: 27,
                      color: Colors.white),
                ),
              )),
          Services(),
          SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 0, 5),
                child: Text(
                  "restaurant",
                  style: TextStyle(
                      fontFamily: "RobotoMono",
                      fontSize: 27,
                      color: Colors.white),
                ),
              )),
          restaurant(),
        ]),
      ),
    );
  }
}


