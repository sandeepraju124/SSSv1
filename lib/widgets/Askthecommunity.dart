// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sssv1/Askcommunitypages/questions.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/utils/constants.dart';

class AskForCommunityWidget extends StatefulWidget {
  final String uid;

  const AskForCommunityWidget({Key? key, required this.uid}) : super(key: key);

  @override
  _AskForCommunityWidgetState createState() => _AskForCommunityWidgetState();
}

class _AskForCommunityWidgetState extends State<AskForCommunityWidget> {
  Map<int, bool> showRemainingAnswers = {};

  int displayQuestionCount = 2;

  @override
  void initState() {
    super.initState();
    // var data = Provider.of<AskCommunityProvider>(context, listen: false);
    // data.askCommunityProvider(widget.uid);
  }

  void showAllQuestions() {
    var data = Provider.of<AskCommunityProvider>(context);
    setState(() {
      displayQuestionCount = data.askCommunityData?.data.length ?? 0;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Questionpage(id: "");
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AskCommunityProvider>(context);
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 58,
              width: 400,
              child: Padding(
                // padding: const EdgeInsets.all(15.0),
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: tgPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      // Navigator.of(context)
                      //     .push(HeroDialogRoute(builder: (context) {
                      //   return AskCommPage();
                      // }));
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Questionpage(id: "");
                      }));
                    },
                    child: Text(
                      'Would you like to know anything ? Ask',
                      style: TextStyle(
                        color: tgPrimaryText,
                        fontSize: 13,
                      ),
                    )),
              ),
            ),
          ),
          data.isLoading
              ? Center(child: CircularProgressIndicator())
              : data.askCommunityData?.data.isEmpty == true
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
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
                  : Container(
                      decoration: BoxDecoration(
                          ///////////////////////// this container implements divider line b\w button and questions
                          border: Border(
                              top: BorderSide(
                                  color: Colors.blueGrey, width: 0.6))),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: displayQuestionCount,
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
                                child: Text(
                                  question.question,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
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
                                      answers[index].answer,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  );
                                },
                              ),
                              // if (hasRemainingAnswers)
                              //   GestureDetector(
                              //     onTap: () {
                              //       setState(() {
                              //         showRemainingAnswers[int] = true;
                              //       });
                              //     },
                              //     child: Container(
                              //       alignment: Alignment.center,
                              //       margin: EdgeInsets.symmetric(
                              //           horizontal: 30, vertical: 5),
                              //       height: 30,
                              //       width: double.infinity,
                              //       decoration: BoxDecoration(
                              //           // color: Colors.grey,
                              //           border: Border.all(
                              //               color: secondaryColor20LightTheme)),
                              //       child: Text(
                              //           "Show ${answers.length - 2} more answers"),
                              //     ),
                              //   ) ,

                              // const Divider(),
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
                                    child: Text("Show more questions"),
                                  ),
                                ),

                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
