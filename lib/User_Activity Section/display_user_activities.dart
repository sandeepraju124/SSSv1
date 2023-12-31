// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/Reviews%20Section/full_reviewspage.dart';
import 'package:sssv1/User_Activity%20Section/user_activity_model.dart';

import 'package:sssv1/User_Activity%20Section/user_activity_provider.dart';
// ignore: unused_import
import 'package:sssv1/models/askthecom_models.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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

  String stars(int rating) {
    return List<String>.generate(rating, (index) => '⭐').join();
  }

  Future<void> _handleRefresh() async {
    await Provider.of<UserActivityProvider>(context, listen: false)
        .userActivityProvider(userid);
    setState(() {});
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
              ? Center(child: Text("No Contributions Made Yet"))
              : RefreshIndicator(
                  color: tgPrimaryColor,
                  onRefresh: _handleRefresh,
                  child: ListView(
                    children: [
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             border: Border(
                      //                 bottom: BorderSide(
                      //                     color: tgDarkPrimaryColor))),
                      //         child: Text(
                      //           "Your Review History",
                      //           style: TextStyle(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.w600,
                      //               color: secondaryColor40LightTheme),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      ////////////////////////comments activity display //////////////
                      ///
                      ///
                      ///
                      ///
                      ExpansionTile(
                        title: Text(
                          "Your Review History",
                          style: TextStyle(
                            fontSize: 15,
                            color: secondaryColor40LightTheme,
                          ),
                        ),
                        backgroundColor: Colors.teal[50],
                        children: [
                          ...(data.getUserActivityData!.comments.isEmpty
                              ? [
                                  Padding(
                                    padding: const EdgeInsets.all(40.0),
                                    child: Center(
                                        child: Text(
                                      "No Activity Yet",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: secondaryColor20LightTheme),
                                    )),
                                  )
                                ]
                              : data.getUserActivityData!.comments
                                  .asMap()
                                  .map((index, comment) {
                                    return MapEntry(
                                        index,
                                        GestureDetector(
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
                                                leading: Text('${index + 1}. ',
                                                    style:
                                                        TextStyle(fontSize: 9)),
                                                title: Text(
                                                  comment.comment,
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
                                                  "Rating: ${stars(comment.rating)}\nProvided for: ${comment.businessName}\nDate: ${comment.createdAt}",
                                                  style:
                                                      TextStyle(fontSize: 12.0),
                                                )),
                                          ),
                                        ));
                                  })
                                  .values
                                  .toList()),
                        ],
                      ),

                      //////////////////////////////////////// divider & space between sections /////////////////////////

                      SizedBox(height: 82),

                      Row(children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 20,
                            thickness: 1.5,
                            indent: 40,
                            endIndent: 40,
                          ),
                        ),
                        Text("******"),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 20,
                            thickness: 1.5,
                            indent: 40,
                            endIndent: 40,
                          ),
                        ),
                      ]),

                      /////////////////////////////////////////////////////////////////////////

                      //////////// questions Activity display ///////////////

                      SizedBox(height: 16),

                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             // color: tgLightPrimaryColor,
                      //             border: Border(
                      //                 bottom: BorderSide(
                      //           color: tgDarkPrimaryColor,
                      //         ))),
                      //         child: Text(
                      //           "Your History of Inquiries (Questions)",
                      //           style: TextStyle(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.w600,
                      //               color: secondaryColor40LightTheme),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      SizedBox(height: 90),

                      ExpansionTile(
                        title: Text(
                          "Your History of Inquiries (Questions)",
                          style: TextStyle(
                            fontSize: 15,
                            color: secondaryColor40LightTheme,
                          ),
                        ),
                        backgroundColor: Colors.teal[50],
                        children: [
                          ...(data.getUserActivityData!.questions.isEmpty
                              ? [
                                  Padding(
                                    padding: const EdgeInsets.all(40.0),
                                    child: Center(
                                        child: Text(
                                      "No Activity Yet",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: secondaryColor20LightTheme),
                                    )),
                                  )
                                ]
                              : data.getUserActivityData!.questions
                                  .map((question) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return DefaultProfilePage(
                                            uid: question.businessUid);
                                      }));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(8.0),
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        // color: tgLightPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
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
                                              fontWeight: FontWeight.w500,
                                              wordSpacing: 0.5,
                                              letterSpacing: -0.1,
                                              color:
                                                  secondaryColor60LightTheme),
                                        ),
                                        subtitle: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            "Question posed to '${question.businessName}' \non ${question.qdetails.createdAt}",
                                            style: TextStyle(
                                                color:
                                                    secondaryColor40LightTheme,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList()),
                        ],
                      ),

                      /////////////////////////////// divider & space between sections /////////////////////////

                      SizedBox(height: 82),

                      Row(children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 20,
                            thickness: 1.5,
                            indent: 40,
                            endIndent: 40,
                          ),
                        ),
                        Text("******"),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 20,
                            thickness: 1.5,
                            indent: 40,
                            endIndent: 40,
                          ),
                        ),
                      ]),

                      SizedBox(height: 12),

                      /////////////////////////////////////////////////////////////////////////

                      ////////////// answers Activity display ///////////////

                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             // color: tgLightPrimaryColor,
                      //             border: Border(
                      //                 bottom: BorderSide(
                      //                     color: tgDarkPrimaryColor))),
                      //         child: Text(
                      //           "Your Community Responses (Answers)",
                      //           style: TextStyle(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.w600,
                      //               color: secondaryColor40LightTheme),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      SizedBox(height: 90),

                      ExpansionTile(
                        title: Text(
                          "Your History of Inquiries (Questions)",
                          style: TextStyle(
                            fontSize: 15,
                            color: secondaryColor40LightTheme,
                          ),
                        ),
                        backgroundColor: Colors.teal[50],
                        children: [
                          ...(data.getUserActivityData!.answers.isEmpty
                              ? [
                                  Padding(
                                    padding: const EdgeInsets.all(40.0),
                                    child: Center(
                                        child: Text(
                                      "No Activity Yet",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: secondaryColor20LightTheme),
                                    )),
                                  )
                                ]
                              : data.getUserActivityData!.answers.map((answer) {
                                  // Find the related question
                                  final Question relatedQuestion = data
                                      .getUserActivityData!.questions
                                      .firstWhere(
                                    (question) =>
                                        question.qdetails.userid ==
                                        answer.adetails.userid,

                                    ///// if no questions found, it display's below default values

                                    orElse: () => Question(
                                      answers: [], // Provide a default value
                                      businessName:
                                          '', // Provide a default value
                                      businessUid:
                                          '', // Provide a default value
                                      qdetails: user_activity.Qdetails(
                                        createdAt: DateTime
                                            .now(), // Provide a default value
                                        questionid:
                                            '', // Provide a default value
                                        userid: userValues.map[
                                            userid]!, // Provide a default value // Provide a default value
                                      ),
                                      question:
                                          'no questions found', // Provide a default value
                                    ),
                                  );
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        /// fyi : here in the answer object business uid is the enum to fix that we nee to convert it to string as shown below
                                        String uid = businessUidValues
                                                .reverse[answer.businessUid] ??
                                            'default_uid';
                                        return DefaultProfilePage(uid: uid);
                                      }));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(8.0),
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        // color: tgLightPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
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
                                                  fontWeight: FontWeight.w500,
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
                                }).toList()),
                        ],
                      ),

                      /////////////////////////////// divider & space between sections /////////////////////////

                      SizedBox(height: 82),

                      Row(children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 20,
                            thickness: 1.5,
                            indent: 40,
                            endIndent: 40,
                          ),
                        ),
                        Text("******"),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 20,
                            thickness: 1.5,
                            indent: 40,
                            endIndent: 40,
                          ),
                        ),
                      ]),

                      SizedBox(height: 12),

                      /////////////////////////////////////////////////////////////////////////
                    ],
                  ),
                ),
      //   ],
      // ),
    );
  }
}
