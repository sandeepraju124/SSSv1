// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sssv1/chat%20service/chat_screen.dart';

import '../utils/constants.dart';

class ChatInboxPage extends StatefulWidget {
  const ChatInboxPage({super.key});

  @override
  State<ChatInboxPage> createState() => _InitialChatPageState();
}

class _InitialChatPageState extends State<ChatInboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: tgPrimaryText,
        ),
        backgroundColor: tgPrimaryColor,
        title: Text(
          'Chat inbox',
          style: TextStyle(color: tgPrimaryText),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 370,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    // labelText: "Search your Chat"
                    hintText: "Search your Chat",
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: secondaryColor20LightTheme,
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: secondaryColor10LightTheme)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChatScreenPage();
              }));
            },
            child: Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: tgPrimaryColor),
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ]),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/elon.jpg"),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        padding: EdgeInsets.only(bottom: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Elon musk",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "12:30PM",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 100),
                            child: Text(
                              "Hey dude! WTF is going on?,",
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: secondaryColor20LightTheme,
            indent: 10,
            endIndent: 10,
            thickness: 0.2,
          )
        ],
      ),
    );
  }
}
