// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sssv1/utils/constants.dart';

class Answerpage extends StatefulWidget {
  const Answerpage({super.key});

  @override
  State<Answerpage> createState() => _AnswerpageState();
}

class _AnswerpageState extends State<Answerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tgPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: tgPrimaryText,
        ),
        title: Text(
          'Answers',
          style: TextStyle(color: tgPrimaryText),
        ),
      ),
      body: ListView(
        ////////////// first container //////////
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: tgLightPrimaryColor,
                  child: Column(
                    children: [
                      ///////// profile image in first container /////////
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 10),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://th.bing.com/th/id/R.c9c9904d93d37519ff2dc20a5d49822d?rik=%2b8eGxeUiX6ieLw&riu=http%3a%2f%2fstatic6.businessinsider.com%2fimage%2f56055b87dd0895cb7b8b4645-2400%2felon-musk-387.jpg&ehk=yx7rWOWwuAqxzomXOnkBGh%2bBSK18QWQB8ZwlnXvYDrw%3d&risl=&pid=ImgRaw&r=0"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              'Musk',
                              style: TextStyle(color: tgSecondaryText),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13, right: 140),
                        child: Text(
                          'is this family friendly restaurant?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 0.3),
                        ),
                      ),
                      SizedBox(height: 10),

                      ////// elevated button ////////

                      SizedBox(
                        height: 40,
                        width: 360,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: tgPrimaryColor),
                          onPressed: () {},
                          child: Text(
                            'Answer',
                            style: TextStyle(color: tgPrimaryText),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      // Container(
                      //   color: tgLightPrimaryColor,
                      //   height: 200,
                      // )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              ///// second container //////////////
              ///
              Container(
                color: tgLightPrimaryColor,
                height: 110,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://th.bing.com/th/id/OIP.Mkoh198HKXDWY31rCZoAkwAAAA?pid=ImgDet&rs=1"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'stalin',
                            style: TextStyle(color: tgSecondaryText),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "I can't be sure, but i doubt it. Most paces aren't organic and when they are, they lead with it "),
                    )
                  ],
                ),
              ),

              SizedBox(height: 10),

              /////////////////// third container /////////////////
              Container(
                color: tgLightPrimaryColor,
                height: 110,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://th.bing.com/th/id/OIP.Mkoh198HKXDWY31rCZoAkwAAAA?pid=ImgDet&rs=1"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Rokossovasky',
                            style: TextStyle(color: tgSecondaryText),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "I can't be sure, but i doubt it. Most paces aren't organic and when they are, they lead with it "),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
