// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/User_Activity%20Section/user_activity_model.dart';
import 'package:lottie/lottie.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:sssv1/User_Activity%20Section/user_activity_provider.dart';
// ignore: unused_import
import 'package:sssv1/models/askthecom_models.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:intl/intl.dart';

import 'package:sssv1/User_Activity Section/user_activity_model.dart'
    as user_activity;

class UserActivityScreen extends StatefulWidget {
  const UserActivityScreen({super.key});

  @override
  State<UserActivityScreen> createState() => _UserActivityScreenState();
}

class _UserActivityScreenState extends State<UserActivityScreen> {
  final user = FirebaseAuth.instance.currentUser;
  String? userid;

  @override
  void initState() {
    super.initState();
    userid = user?.uid;

    Provider.of<UserActivityProvider>(context, listen: false)
        .userActivityProvider(userid);
  }

  Widget stars(int rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        rating,
        (index) => Icon(Icons.star_rounded,
            color: Colors.amber[700],

            // color: tgDarkPrimaryColor,
            size: 18.5), // You can adjust the size as needed
      ),
    );
  }

  Future<void> _handleRefresh() async {
    await Provider.of<UserActivityProvider>(context, listen: false)
        .userActivityProvider(userid);
    setState(() {});
  }

  String formatDateTime(DateTime dateTime) {
    final DateTime localDateTime = dateTime.toLocal(); ///// for Local timezone
    final DateFormat dateFormatter = DateFormat('dd-MM-yyyy (EEE)', 'en_US');
    final DateFormat timeFormatter = DateFormat('h:mm a', 'en_US');
    return '${dateFormatter.format(localDateTime)} at ${timeFormatter.format(localDateTime)}';
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<UserActivityProvider>(context);
    int totalActivities = (data.getUserActivityData?.answers.length ?? 0) +
        (data.getUserActivityData?.comments.length ?? 0) +
        (data.getUserActivityData?.questions.length ?? 0);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.0,
        automaticallyImplyLeading: false,
        title: Text(
          "Your Activity",
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: tgDarkPrimaryColor,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(LineAwesomeIcons.user_plus))
        ],
      ),
      body: data.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: tgDarkPrimaryColor,
              ),
            )
          : totalActivities == 0
              ? Center(
                  child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 234),
                      child: Lottie.asset("images/Activity.json", height: 195),
                    ),
                    Text(
                      "There are currently no activities to display",
                      style: TextStyle(
                          fontSize: 13, color: secondaryColor40LightTheme),
                    )
                  ],
                ))
              : RefreshIndicator(
                  color: tgPrimaryColor,
                  onRefresh: _handleRefresh,
                  child: ListView(
                    children: [
                      ////////////////// review history //////////

                      SizedBox(height: 10),

                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true, // Add this line
                            builder: (BuildContext context) {
                              return DraggableScrollableSheet(
                                // Use this instead of SingleChildScrollView
                                expand: false,
                                builder: (BuildContext context,
                                    ScrollController scrollController) {
                                  return ListView.builder(
                                    // Use ListView.builder for better performance with large lists
                                    controller: scrollController,
                                    itemCount: data.getUserActivityData!
                                            .comments.isEmpty
                                        ? 2
                                        : data.getUserActivityData!.comments
                                                .length +
                                            1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index == 0) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // SizedBox(height: 7.0),
                                            // SizedBox(height: 20),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 38),
                                              child: Center(
                                                child: Container(
                                                    height: 5,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      color: tgPrimaryColor,
                                                      border: Border(
                                                          top: BorderSide(
                                                              color:
                                                                  tgPrimaryColor)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    )),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color:
                                                              tgPrimaryColor))),
                                              child: Text(
                                                "Your Review History",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color:
                                                      secondaryColor40LightTheme,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        );
                                      } else if (data.getUserActivityData!
                                          .comments.isEmpty) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            top: 150,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "No Activity Yet",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    secondaryColor20LightTheme),
                                          )),
                                        );
                                      } else {
                                        var comment = data.getUserActivityData!
                                            .comments[index - 1];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return DefaultProfilePage(
                                                  uid: comment.businessUid);
                                            }));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(8.0),
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: Text('$index. ',
                                                  style:
                                                      TextStyle(fontSize: 9)),
                                              title: Text(
                                                comment.comment,
                                                style: TextStyle(
                                                    fontSize: 14.5,
                                                    fontWeight: FontWeight.w500,
                                                    wordSpacing: 0.5,
                                                    letterSpacing: -0.1,
                                                    color:
                                                        secondaryColor60LightTheme),
                                              ),
                                              // subtitle: Text(
                                              //   "Rating: ${stars(comment.rating)}\nProvided for: ${comment.businessName}\nDate: ${comment.createdAt}",
                                              //   style:
                                              //       TextStyle(fontSize: 12.0),
                                              // )

                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Rating: ",
                                                        style: TextStyle(
                                                            fontSize: 12.0),
                                                      ),
                                                      stars(comment.rating),
                                                    ],
                                                  ), // This will display the row of stars

                                                  Text(
                                                    "Provided for: ${comment.businessName}\nDate: ${formatDateTime(comment.createdAt)}",
                                                    style: TextStyle(
                                                        fontSize: 12.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // color: Colors.teal[50],
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: tgDarkPrimaryColor.withOpacity(.4),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  " Your Review history",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: secondaryColor40LightTheme,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 168),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      LineAwesomeIcons.plus,
                                      size: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      Center(child: Text("**********")),

                      SizedBox(height: 40),

                      //////////// questions Activity display ///////////////

                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return DraggableScrollableSheet(
                                expand: false,
                                builder: (BuildContext context,
                                    ScrollController scrollController) {
                                  return ListView.builder(
                                    controller: scrollController,
                                    itemCount: data.getUserActivityData!
                                            .questions.isEmpty
                                        ? 2
                                        : data.getUserActivityData!.questions
                                                .length +
                                            1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index == 0) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 38),
                                              child: Center(
                                                child: Container(
                                                    height: 5,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      color: tgPrimaryColor,
                                                      border: Border(
                                                          top: BorderSide(
                                                              color:
                                                                  tgPrimaryColor)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    )),
                                              ),
                                            ),
                                            SizedBox(height: 6),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color:
                                                              tgPrimaryColor))),
                                              child: Text(
                                                "The following are the questions you've asked.",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color:
                                                      secondaryColor40LightTheme,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        );
                                      } else if (data.getUserActivityData!
                                          .questions.isEmpty) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            top: 150,
                                          ),
                                          child: Center(
                                              child: Text(
                                            "No Activity Yet",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    secondaryColor20LightTheme),
                                          )),
                                        );
                                      } else {
                                        var question = data.getUserActivityData!
                                            .questions[index - 1];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return DefaultProfilePage(
                                                  uid: question.businessUid);
                                            }));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(8.0),
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                                title: Text(
                                                  "Q:  ${question.question}",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      wordSpacing: 0.5,
                                                      letterSpacing: -0.1,
                                                      color:
                                                          secondaryColor60LightTheme),
                                                ),
                                                subtitle: Text(
                                                  "Question posed to '${question.businessName}' \non ${question.qdetails.createdAt}",
                                                  style: TextStyle(
                                                      color:
                                                          secondaryColor40LightTheme,
                                                      fontSize: 12),
                                                )),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: tgDarkPrimaryColor.withOpacity(.4),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Your 'Questions' from AskCommunity",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: secondaryColor40LightTheme,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 84),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      LineAwesomeIcons.plus,
                                      size: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      Center(child: Text("**********")),

                      /////////////////////////////////////////////////////////////////////////

                      ////////////// answers Activity display ///////////////

                      SizedBox(height: 40),

                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return DraggableScrollableSheet(
                                expand: false,
                                builder: (BuildContext context,
                                    ScrollController scrollController) {
                                  return ListView.builder(
                                    controller: scrollController,
                                    itemCount: data.getUserActivityData!.answers
                                            .isEmpty
                                        ? 2
                                        : data.getUserActivityData!.answers
                                                .length +
                                            1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index == 0) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // SizedBox(height: 20),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 38),
                                              child: Center(
                                                child: Container(
                                                    height: 5,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      color: tgPrimaryColor,
                                                      border: Border(
                                                          top: BorderSide(
                                                              color:
                                                                  tgPrimaryColor)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    )),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color:
                                                              tgPrimaryColor))),
                                              child: Text(
                                                "Your Responses",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color:
                                                      secondaryColor40LightTheme,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        );
                                      } else if (data.getUserActivityData!
                                          .answers.isEmpty) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            top: 150,
                                          ),
                                          child: Center(
                                              child: Text(
                                            " No Activity Yet",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    secondaryColor20LightTheme),
                                          )),
                                        );
                                      } else {
                                        var answer = data.getUserActivityData!
                                            .answers[index - 1];
                                        // final Question relatedQuestion = data
                                        //     .getUserActivityData!.questions
                                        //     .firstWhere(
                                        //   (question) =>
                                        //       // question.qdetails.userid ==
                                        //       // answer.adetails.userid,
                                        //       question.qdetails.questionid ==
                                        //       answer.adetails.answerid,
                                        //   orElse: () => Question(
                                        //     answers: [],
                                        //     businessName: '',
                                        //     businessUid: '',
                                        //     qdetails: user_activity.Qdetails(
                                        //       createdAt: DateTime.now(),
                                        //       questionid: '',
                                        //       userid: userid != null
                                        //           ? userValues.map[userid]
                                        //           : null,
                                        //     ),
                                        //     question: 'no questions found',
                                        //   ),
                                        // );
                                        final Question relatedQuestion = data
                                            .getUserActivityData!.questions
                                            .firstWhere(
                                          (question) =>
                                              // question.qdetails.questionid ==
                                              // answer.adetails.answerid,
                                              question.qdetails.userid ==
                                              answer.adetails.userid,
                                          orElse: () => Question(
                                            answers: [],
                                            businessName: '',
                                            businessUid: '',
                                            qdetails: user_activity.Qdetails(
                                              createdAt: DateTime.now(),
                                              questionid: '',
                                              userid: userid != null
                                                  ? userValues.map[userid]
                                                  : null,
                                            ),
                                            question: 'no questions found',
                                          ),
                                        );
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              String uid =
                                                  businessUidValues.reverse[
                                                          answer.businessUid] ??
                                                      'default_uid';
                                              print(
                                                  'Mapped uid from businessUid: $uid'); // Add this line to debug
                                              return DefaultProfilePage(
                                                  uid: uid);
                                            }));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(8.0),
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "You provided an answer to the following question:\n\n Q: ${relatedQuestion.question}",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        wordSpacing: 0.5,
                                                        letterSpacing: -0.1,
                                                        color:
                                                            secondaryColor60LightTheme),
                                                  ),
                                                ],
                                              ),
                                              subtitle: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 1.5, left: 5),
                                                child: Text(
                                                  "Your response was: '${answer.answer}'\n\nProvided for: '${answer.businessName}'\nSubmitted on: '${answer.adetails.createdAt}'",
                                                  style: TextStyle(
                                                      color:
                                                          secondaryColor40LightTheme,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: tgDarkPrimaryColor.withOpacity(.4),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  " Your 'Answers' from AskCommunity",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: secondaryColor40LightTheme,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 90),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      LineAwesomeIcons.plus,
                                      size: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      Center(child: Text("**********")),
                    ],
                  ),
                ),
    );
  }
}
