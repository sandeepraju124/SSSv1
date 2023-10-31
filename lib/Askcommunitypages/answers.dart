// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_declarations, avoid_print

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sssv1/models/askthecom_models.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart ' as http;

import 'package:provider/provider.dart';

class Answerpage extends StatefulWidget {
  const Answerpage({super.key, required this.questionid});

  final String questionid;

  @override
  State<Answerpage> createState() => _AnswerpageState();
}

class _AnswerpageState extends State<Answerpage> {
  final TextEditingController _answercontroller = TextEditingController();

  @override
  void dispose() {
    _answercontroller.dispose();
    _answercontroller.clear();
    super.dispose();
  }

  // Future<void> fetchData() async {
  //   final user = FirebaseAuth.instance.currentUser;

  //   final userid = user?.uid;

  //   final provider = Provider.of<AskCommunityProvider>(context, listen: false);

  //   await provider.fetchAskCommunityData(userid.toString());

  //   // provider.notifyListeners();
  // }

  ////////////// HTTP POST MENTHOD BELOW //////////////

  Future<void> PostAnswer(
    String Answer,
    String questionId,
  ) async {
    final String url = "$baseUrl/post_answer";
    final user = FirebaseAuth.instance.currentUser;

    final userid = user?.uid;
    final Map<String, dynamic> data = {
      "answer": Answer,
      "questionid": questionId,
      "userid": userid,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
      );

      if (response.statusCode == 200) {
        print("Answer posted successfully");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Answer posted successfully"),
          ),
        );
        _answercontroller.clear();

        // You can add further logic here if needed, such as showing a success message.
      } else {
        print("Failed to post question. Status code: ${response.statusCode}");
        print('Response body: ${response.body}');
        // You can handle errors here, e.g., showing an error message to the user.
      }
    } catch (e) {
      print('Error: $e');
      // Handle any other exceptions that may occur during the request.
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AskCommunityProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: tgPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(LineAwesomeIcons.angle_left),
          color: tgPrimaryText,
        ),
        title: Text(
          'Answers',
          style: TextStyle(color: tgPrimaryText, fontSize: 15),
        ),
      ),
      body: data.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.askCommunityData!.data.length,
              itemBuilder: (BuildContext context, int questionIndex) {
                var question = data.askCommunityData!.data[questionIndex];

                if (question.qdetails.questionid != widget.questionid) {
                  return SizedBox.shrink();
                }

                var answers = question.answers;
                // var question = answers.question;

                // var questionid = question.qdetails.questionid.toString;

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        // height: 150,
                        width: double.infinity,
                        color: tgLightPrimaryColor,
                        child: Column(
                          children: [
                            ///////// profile image in first container /////////
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 15, left: 10),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://th.bing.com/th/id/R.c9c9904d93d37519ff2dc20a5d49822d?rik=%2b8eGxeUiX6ieLw&riu=http%3a%2f%2fstatic6.businessinsider.com%2fimage%2f56055b87dd0895cb7b8b4645-2400%2felon-musk-387.jpg&ehk=yx7rWOWwuAqxzomXOnkBGh%2bBSK18QWQB8ZwlnXvYDrw%3d&risl=&pid=ImgRaw&r=0"),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Text(
                                    'Musk',
                                    style: TextStyle(color: tgSecondaryText),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, bottom: 5),
                                  child: Text(
                                    "Q: ${question.question}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.3),
                                  ),
                                ),
                                SizedBox(
                                  width: 360,
                                  child: TextField(
                                    style: TextStyle(
                                        color: secondaryColor40LightTheme),
                                    controller: _answercontroller,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        // fillColor: Colors.white,

                                        hintText: "Type your answer here",
                                        hintStyle: TextStyle(
                                            color: secondaryColor20LightTheme,
                                            fontSize: 14),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: tgAccentColor),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black))),
                                    autofocus: false,
                                    maxLines: null,
                                  ),
                                ),
                                SizedBox(height: 8),
                                SizedBox(
                                  height: 40,
                                  width: 360,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: tgPrimaryColor),
                                    onPressed: () {
                                      PostAnswer(_answercontroller.text,
                                          question.qdetails.questionid);
                                    },
                                    child: Text(
                                      "answer",
                                      style: TextStyle(color: tgPrimaryText),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),

                            ////// elevated button ////////

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

                    for (var answer in answers)
                      Container(
                        color: tgLightPrimaryColor,
                        height: 110,
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: secondaryColor20LightTheme,
                                      width: 0.4))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://th.bing.com/th/id/OIP.Mkoh198HKXDWY31rCZoAkwAAAA?pid=ImgDet&rs=1"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10),
                                    child: Text(
                                      'stalin',
                                      style: TextStyle(color: tgSecondaryText),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("A: ${answer.answer}"),
                              )
                            ],
                          ),
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
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://th.bing.com/th/id/OIP.Mkoh198HKXDWY31rCZoAkwAAAA?pid=ImgDet&rs=1"),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  'Rokossovasky',
                                  style: TextStyle(color: tgSecondaryText),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Ans: ${answers.length}"),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
