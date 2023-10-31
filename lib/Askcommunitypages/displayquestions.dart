// // ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/providers/askcommunity_provider.dart';
// import 'package:sssv1/utils/constants.dart';

// class displayQuestions extends StatefulWidget {
//   const displayQuestions({super.key});

//   @override
//   State<displayQuestions> createState() => _displayQuestionsState();
// }

// class _displayQuestionsState extends State<displayQuestions> {
//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<AskCommunityProvider>(context);
//     return data.isLoading
//         ? Center(
//             child: Image.asset("images/loading.gif"),
//           )
//         : ListView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: data.askCommunityData!.data.length,
//             itemBuilder: (BuildContext context, int int) {
//               var question = data.askCommunityData!.data[int];
//               var answers = question.answers;

//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(
//                       "Q: ${question.question} ",
//                       style:
//                           TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
//                     ),
//                   ),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: answers.length,
//                     itemBuilder: (BuildContext context, index) {
//                       return Container(
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 bottom: BorderSide(
//                                     color: secondaryColor10LightTheme))),
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             "As: ${answers[index].answer}",
//                             style: TextStyle(
//                                 fontSize: 13,
//                                 color: secondaryColor20LightTheme),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//   }
// }

// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:sssv1/Askcommunitypages/answers.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/utils/constants.dart';
import "package:provider/provider.dart";

class displayQuestions extends StatefulWidget {
  const displayQuestions({super.key});

  @override
  State<displayQuestions> createState() => _displayQuestionsState();
}

class _displayQuestionsState extends State<displayQuestions> {
  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AskCommunityProvider>(context);
    return data.isLoading
        ? Center(
            child: Image.asset("images/loading.gif"),
          )
        : RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.askCommunityData!.data.length,
              itemBuilder: (BuildContext context, int questionIndex) {
                var question = data.askCommunityData!.data[questionIndex];
                var answers = question.answers;

                // Create a list of widgets to hold the question and answers in a single box
                List<Widget> questionAndAnswers = [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        print(question.qdetails.questionid);
                        return Answerpage(
                            questionid: question.qdetails.questionid);
                      }));
                    },
                    child: Container(
                      color: Colors
                          .grey[200], // Light grey background for questions
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Q: ${question.question} ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ];
                for (int i = 0; i < 2 && i < answers.length; i++) {
                  questionAndAnswers.add(
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: secondaryColor10LightTheme),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "A: ${answers[i].answer}",
                          style: TextStyle(
                            fontSize: 13,
                            color: secondaryColor20LightTheme,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                // Add answers to the list
                if (answers.length > 2) {
                  // If there are more than 2 answers, show "Show More Answers" button
                  questionAndAnswers.add(
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Answerpage(
                              questionid: question.qdetails.questionid);
                        }));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: tgPrimaryColor,
                          border: Border.all(color: secondaryColor20LightTheme),
                        ),
                        child: Text("Show ${answers.length - 2} more answers"),
                      ),
                    ),
                  );
                }

                // Only show the first 2 answers initially

                // Add spacing between question and answers groups
                questionAndAnswers.add(SizedBox(height: 7));
                questionAndAnswers.add(
                  Divider(
                    color: tgPrimaryText,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.4,
                  ),
                );
                questionAndAnswers.add(SizedBox(height: 10));

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: questionAndAnswers,
                );
              },
            ),
          );
  }
}
