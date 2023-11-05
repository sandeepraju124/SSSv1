// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sssv1/Askcommunitypages/answers.dart';
import 'package:sssv1/Askcommunitypages/questions.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'dart:math';

class AskForCommunityWidget extends StatefulWidget {
  const AskForCommunityWidget({Key? key, required this.uid}) : super(key: key);

  final String uid;

  @override
  _AskForCommunityWidgetState createState() => _AskForCommunityWidgetState();
}

class _AskForCommunityWidgetState extends State<AskForCommunityWidget> {
  int displayQuestionCount = 2;
  Map<int, bool> showRemainingAnswers = {};

  // @override
  // void initState() {
  //   super.initState();
  //   // var data = Provider.of<AskCommunityProvider>(context, listen: false);
  //   // data.askCommunityProvider(widget.uid);
  // }

  void showAllQuestions() {
    var data = Provider.of<AskCommunityProvider>(context, listen: true);
    setState(() {
      displayQuestionCount = data.askCommunityData?.data.length ?? 0;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Questionpage(id: "");
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AskCommunityProvider>(context, listen: true);
    return SizedBox(
      height: 600,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Text(
                  " Ask Your Community",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: tgPrimaryText),
                ),
                Container(
                  height: 03,
                  width: 90,
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: tgPrimaryColor))),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Questionpage(id: "");
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: tgPrimaryColor, elevation: 5),
                    child: Text(
                      "Would you like to Know (or) Ask anything ?",
                      style: TextStyle(color: Colors.black),
                    )),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  endIndent: 0.1,
                  indent: 0.1,
                  color: Colors.grey, // Optional - set the color of the divider
                  thickness: 1, // Optional - set the thickness of the divider
                ),
              ],
            ),
          ),
          data.isLoading
              ? Center(child: CircularProgressIndicator())
              : data.askCommunityData?.data.isEmpty == true
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Text("be the first one to ask",
                              style: TextStyle(color: Colors.grey)),
                          Image.asset(
                            height: 200,
                            "images/empty.gif",
                          ),
                        ],
                      ),
                    ))
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: min(displayQuestionCount,
                          data.askCommunityData!.data.length),
                      itemBuilder: (BuildContext context, int int) {
                        var question = data.askCommunityData!.data[int];
                        var answers = question.answers;

                        var hasRemainingAnswers = answers.length > 2 &&
                            !showRemainingAnswers.containsKey(int);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Answerpage(
                                        questionid:
                                            question.qdetails.questionid);
                                  }));
                                },
                                child: Container(
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: secondaryColor10LightTheme),
                                  child: Text(
                                    "Q: ${question.question}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  hasRemainingAnswers ? 2 : answers.length,
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "A: ${answers[index].answer}",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                            if (hasRemainingAnswers)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showRemainingAnswers[int] = true;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 5),
                                  height: 30,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: secondaryColor20LightTheme),
                                  ),
                                  child: Text(
                                      "Show ${answers.length - 2} more answers"),
                                ),
                              )
                            else if (int == displayQuestionCount - 1 &&
                                displayQuestionCount <
                                    data.askCommunityData!.data.length)
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Questionpage(id: "");
                                  }));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 5),
                                  height: 30,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: secondaryColor20LightTheme),
                                  ),
                                  child: Text(
                                      "Show ${data.askCommunityData!.data.length - displayQuestionCount} questions"),
                                ),
                              ),
                            const Divider(),
                          ],
                        );
                      },
                    ),
        ],
      ),
    );
  }
}
