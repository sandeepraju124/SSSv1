// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/NewdefaultprofilePage/defaultpage&tabview.dart';
import 'package:sssv1/User_Activity%20Section/user_activity_model.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:sssv1/User_Activity%20Section/user_activity_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
// ignore: unused_import
import 'package:sssv1/models/askthecom_models.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

import 'package:sssv1/User_Activity Section/user_activity_model.dart'
    as user_activity;

// class UserActivityScreen extends StatefulWidget {
//   const UserActivityScreen({super.key});

//   @override
//   State<UserActivityScreen> createState() => _UserActivityScreenState();
// }

// class _UserActivityScreenState extends State<UserActivityScreen> {
//   final user = FirebaseAuth.instance.currentUser;
//   String? userid;

//   @override
//   void initState() {
//     super.initState();
//     userid = user?.uid;

//     Provider.of<UserActivityProvider>(context, listen: false)
//         .userActivityProvider(userid);
//   }

//   Widget stars(int rating) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(
//           rating,
//           (index) => Padding(
//                 padding: const EdgeInsets.only(right: 4, bottom: 7, top: 10),
//                 child: Container(
//                   width: 17,
//                   height: 17,
//                   decoration: BoxDecoration(
//                       color: tgDarkPrimaryColor,
//                       borderRadius: BorderRadius.circular(4),
//                       border: Border.all(color: Colors.black, width: 0.3)),
//                   child: Icon(
//                     Icons.star,
//                     color: Colors.white,
//                     // color: Colors.amber[700],
//                     size: 12,
//                   ),
//                 ),
//               )),
//     );
//   }

//   // Widget stars(int rating) {
//   //   // Define the colors for different rating ranges
//   //   // Color green = tgDarkPrimaryColor;
//   //   // Color yellow = Colors.amber.shade700;
//   //   // Color red = Colors.red.shade800;

//   //   // // Determine the color based on the rating
//   //   // Color color;
//   //   // if (rating >= 4) {
//   //   //   color = green;
//   //   // } else if (rating >= 2) {
//   //   //   color = yellow;
//   //   // } else {
//   //   //   color = red;
//   //   // }

//   //   // Generate the stars with the determined color
//   //   return Row(
//   //     mainAxisSize: MainAxisSize.min,
//   //     children: List.generate(
//   //       rating,
//   //       (index) => Icon(Icons.star,
//   //           color: color, size: 19), // Adjust the size as needed
//   //     ),
//   //   );
//   // }

//   Future<void> _handleRefresh() async {
//     await Provider.of<UserActivityProvider>(context, listen: false)
//         .userActivityProvider(userid);
//     setState(() {});
//   }

//   String formatDateTime(DateTime dateTime) {
//     final DateTime localDateTime = dateTime.toLocal(); ///// for Local timezone
//     final DateFormat dateFormatter = DateFormat('dd-MM-yyyy (EEE)', 'en_US');
//     final DateFormat timeFormatter = DateFormat('h:mm a', 'en_US');
//     return '${dateFormatter.format(localDateTime)} at ${timeFormatter.format(localDateTime)}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<UserActivityProvider>(context);
//     int totalActivities = (data.getUserActivityData?.answers.length ?? 0) +
//         (data.getUserActivityData?.comments.length ?? 0) +
//         (data.getUserActivityData?.questions.length ?? 0);

//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 75.0,
//         automaticallyImplyLeading: false,
//         title: Text(
//           "Your Activity",
//           style: TextStyle(fontSize: 16),
//         ),
//         backgroundColor: tgDarkPrimaryColor,
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(LineAwesomeIcons.user_plus))
//         ],
//       ),
//       body: data.isLoading
//           ? Center(
//               child: CircularProgressIndicator(
//                 color: tgDarkPrimaryColor,
//               ),
//             )
//           : totalActivities == 0
//               ? Center(
//                   child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 234),
//                       child: Lottie.asset("images/Activity.json", height: 195),
//                     ),
//                     Text(
//                       "There are currently no activities to display",
//                       style: TextStyle(
//                           fontSize: 13, color: secondaryColor40LightTheme),
//                     )
//                   ],
//                 ))
//               : RefreshIndicator(
//                   color: tgPrimaryColor,
//                   onRefresh: _handleRefresh,
//                   child: ListView(
//                     children: [
//                       ////////////////// review history //////////

//                       SizedBox(height: 10),

//                       GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet(
//                             context: context,
//                             isScrollControlled: true, // Add this line
//                             builder: (BuildContext context) {
//                               return DraggableScrollableSheet(
//                                 // Use this instead of SingleChildScrollView
//                                 expand: false,
//                                 builder: (BuildContext context,
//                                     ScrollController scrollController) {
//                                   return ListView.builder(
//                                     // Use ListView.builder for better performance with large lists
//                                     controller: scrollController,
//                                     itemCount: data.getUserActivityData!
//                                             .comments.isEmpty
//                                         ? 2
//                                         : data.getUserActivityData!.comments
//                                                 .length +
//                                             1,
//                                     itemBuilder:
//                                         (BuildContext context, int index) {
//                                       if (index == 0) {
//                                         return Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             // SizedBox(height: 7.0),
//                                             // SizedBox(height: 20),
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   bottom: 38),
//                                               child: Center(
//                                                 child: Container(
//                                                     height: 5,
//                                                     width: 70,
//                                                     decoration: BoxDecoration(
//                                                       color: tgPrimaryColor,
//                                                       border: Border(
//                                                           top: BorderSide(
//                                                               color:
//                                                                   tgPrimaryColor)),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5),
//                                                     )),
//                                               ),
//                                             ),
//                                             Container(
//                                               decoration: BoxDecoration(
//                                                   border: Border(
//                                                       bottom: BorderSide(
//                                                           color:
//                                                               tgPrimaryColor))),
//                                               child: Text(
//                                                 "Your Review History",
//                                                 style: TextStyle(
//                                                   fontSize: 15,
//                                                   color:
//                                                       secondaryColor40LightTheme,
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             )
//                                           ],
//                                         );
//                                       } else if (data.getUserActivityData!
//                                           .comments.isEmpty) {
//                                         return Padding(
//                                           padding: const EdgeInsets.only(
//                                             top: 150,
//                                           ),
//                                           child: Center(
//                                               child: Text(
//                                             "No Activity Yet",
//                                             style: TextStyle(
//                                                 fontSize: 13,
//                                                 color:
//                                                     secondaryColor20LightTheme),
//                                           )),
//                                         );
//                                       } else {
//                                         var comment = data.getUserActivityData!
//                                             .comments[index - 1];
//                                         return GestureDetector(
//                                           onTap: () {
//                                             Navigator.push(context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) {
//                                               print(comment.businessUid);
//                                               return DefaultProfilePage(
//                                                   uid: comment.businessUid);
//                                             }));
//                                           },
//                                           child: Container(
//                                             margin: EdgeInsets.all(8.0),
//                                             padding: EdgeInsets.all(8.0),
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius:
//                                                   BorderRadius.circular(10.0),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.grey
//                                                       .withOpacity(0.5),
//                                                   spreadRadius: 5,
//                                                   blurRadius: 7,
//                                                   offset: Offset(0, 3),
//                                                 ),
//                                               ],
//                                             ),
//                                             child: ListTile(
//                                               leading: Text('$index. ',
//                                                   style:
//                                                       TextStyle(fontSize: 9)),
//                                               title: Text(
//                                                 comment.comment,
//                                                 style: TextStyle(
//                                                     fontSize: 14.5,
//                                                     fontWeight: FontWeight.w500,
//                                                     wordSpacing: 0.5,
//                                                     letterSpacing: -0.1,
//                                                     color:
//                                                         secondaryColor60LightTheme),
//                                               ),
//                                               // subtitle: Text(
//                                               //   "Rating: ${stars(comment.rating)}\nProvided for: ${comment.businessName}\nDate: ${comment.createdAt}",
//                                               //   style:
//                                               //       TextStyle(fontSize: 12.0),
//                                               // )

//                                               subtitle: Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     top: 5),
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         // Text(
//                                                         //   "Rated at: ",
//                                                         //   style: TextStyle(
//                                                         //       fontSize: 12.0,
//                                                         //       color:
//                                                         //           secondaryColor20LightTheme),
//                                                         // ),
//                                                         stars(comment.rating),
//                                                       ],
//                                                     ), // This will display the row of stars

//                                                     Text(
//                                                       "Provided for: ${comment.businessName}\nDate: ${formatDateTime(comment.createdAt)}",
//                                                       style: TextStyle(
//                                                           fontSize: 12.0,
//                                                           color:
//                                                               secondaryColor20LightTheme),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       }
//                                     },
//                                   );
//                                 },
//                               );
//                             },
//                           );
//                         },
//                         child: Container(
//                           margin: EdgeInsets.all(8.0),
//                           padding: EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             // color: Colors.teal[50],
//                             borderRadius: BorderRadius.circular(10.0),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: tgDarkPrimaryColor.withOpacity(.4),
//                                 spreadRadius: 5,
//                                 blurRadius: 7,
//                                 offset: Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   " Your Review history",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: secondaryColor40LightTheme,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 168),
//                                   child: IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       LineAwesomeIcons.plus,
//                                       size: 17,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),

//                       SizedBox(height: 16),

//                       Center(child: Text("**********")),

//                       SizedBox(height: 40),

//                       //////////// questions Activity display ///////////////

//                       GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet(
//                             context: context,
//                             isScrollControlled: true,
//                             builder: (BuildContext context) {
//                               return DraggableScrollableSheet(
//                                 expand: false,
//                                 builder: (BuildContext context,
//                                     ScrollController scrollController) {
//                                   return ListView.builder(
//                                     controller: scrollController,
//                                     itemCount: data.getUserActivityData!
//                                             .questions.isEmpty
//                                         ? 2
//                                         : data.getUserActivityData!.questions
//                                                 .length +
//                                             1,
//                                     itemBuilder:
//                                         (BuildContext context, int index) {
//                                       if (index == 0) {
//                                         return Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   bottom: 38),
//                                               child: Center(
//                                                 child: Container(
//                                                     height: 5,
//                                                     width: 70,
//                                                     decoration: BoxDecoration(
//                                                       color: tgPrimaryColor,
//                                                       border: Border(
//                                                           top: BorderSide(
//                                                               color:
//                                                                   tgPrimaryColor)),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5),
//                                                     )),
//                                               ),
//                                             ),
//                                             SizedBox(height: 6),
//                                             Container(
//                                               decoration: BoxDecoration(
//                                                   border: Border(
//                                                       bottom: BorderSide(
//                                                           color:
//                                                               tgPrimaryColor))),
//                                               child: Text(
//                                                 "The following are the questions you've asked.",
//                                                 style: TextStyle(
//                                                   fontSize: 13,
//                                                   color:
//                                                       secondaryColor40LightTheme,
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(height: 10),
//                                           ],
//                                         );
//                                       } else if (data.getUserActivityData!
//                                           .questions.isEmpty) {
//                                         return Padding(
//                                           padding: const EdgeInsets.only(
//                                             top: 150,
//                                           ),
//                                           child: Center(
//                                               child: Text(
//                                             "No Activity Yet",
//                                             style: TextStyle(
//                                                 fontSize: 13,
//                                                 color:
//                                                     secondaryColor20LightTheme),
//                                           )),
//                                         );
//                                       } else {
//                                         var question = data.getUserActivityData!
//                                             .questions[index - 1];
//                                         return GestureDetector(
//                                           onTap: () {
//                                             Navigator.push(context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) {
//                                               return DefaultProfilePage(
//                                                   uid: question.businessUid);
//                                             }));
//                                           },
//                                           child: Container(
//                                             margin: EdgeInsets.all(8.0),
//                                             padding: EdgeInsets.all(8.0),
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius:
//                                                   BorderRadius.circular(10.0),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.grey
//                                                       .withOpacity(0.5),
//                                                   spreadRadius: 5,
//                                                   blurRadius: 7,
//                                                   offset: Offset(0, 3),
//                                                 ),
//                                               ],
//                                             ),
//                                             child: ListTile(
//                                                 title: Text(
//                                                   "Q:  ${question.question}",
//                                                   style: TextStyle(
//                                                       fontSize: 14.0,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                       wordSpacing: 0.5,
//                                                       letterSpacing: -0.1,
//                                                       color:
//                                                           secondaryColor60LightTheme),
//                                                 ),
//                                                 subtitle: Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           top: 7),
//                                                   child: Text(
//                                                     "Question posed to '${question.businessName}' \non ${formatDateTime(question.qdetails.createdAt)}",
//                                                     style: TextStyle(
//                                                         color:
//                                                             secondaryColor20LightTheme,
//                                                         fontSize: 12),
//                                                   ),
//                                                 )),
//                                           ),
//                                         );
//                                       }
//                                     },
//                                   );
//                                 },
//                               );
//                             },
//                           );
//                         },
//                         child: Container(
//                           margin: EdgeInsets.all(8.0),
//                           padding: EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10.0),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: tgDarkPrimaryColor.withOpacity(.4),
//                                 spreadRadius: 5,
//                                 blurRadius: 7,
//                                 offset: Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   "Your 'Questions' from AskCommunity",
//                                   style: TextStyle(
//                                     fontSize: 13,
//                                     color: secondaryColor40LightTheme,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 84),
//                                   child: IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       LineAwesomeIcons.plus,
//                                       size: 17,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),

//                       SizedBox(height: 16),

//                       Center(child: Text("**********")),

//                       /////////////////////////////////////////////////////////////////////////

//                       ////////////// answers Activity display ///////////////

//                       SizedBox(height: 40),

//                       GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet(
//                             context: context,
//                             isScrollControlled: true,
//                             builder: (BuildContext context) {
//                               return DraggableScrollableSheet(
//                                 expand: false,
//                                 builder: (BuildContext context,
//                                     ScrollController scrollController) {
//                                   return ListView.builder(
//                                     controller: scrollController,
//                                     itemCount: data.getUserActivityData!.answers
//                                             .isEmpty
//                                         ? 2
//                                         : data.getUserActivityData!.answers
//                                                 .length +
//                                             1,
//                                     itemBuilder:
//                                         (BuildContext context, int index) {
//                                       if (index == 0) {
//                                         return Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             // SizedBox(height: 20),
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   bottom: 38),
//                                               child: Center(
//                                                 child: Container(
//                                                     height: 5,
//                                                     width: 70,
//                                                     decoration: BoxDecoration(
//                                                       color: tgPrimaryColor,
//                                                       border: Border(
//                                                           top: BorderSide(
//                                                               color:
//                                                                   tgPrimaryColor)),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5),
//                                                     )),
//                                               ),
//                                             ),
//                                             Container(
//                                               decoration: BoxDecoration(
//                                                   border: Border(
//                                                       bottom: BorderSide(
//                                                           color:
//                                                               tgPrimaryColor))),
//                                               child: Text(
//                                                 "You provided an answer to the following questions !",
//                                                 style: TextStyle(
//                                                   fontSize: 15,
//                                                   color:
//                                                       secondaryColor40LightTheme,
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(height: 10),
//                                           ],
//                                         );
//                                       } else if (data.getUserActivityData!
//                                           .answers.isEmpty) {
//                                         return Padding(
//                                           padding: const EdgeInsets.only(
//                                             top: 150,
//                                           ),
//                                           child: Center(
//                                               child: Text(
//                                             " No Activity Yet",
//                                             style: TextStyle(
//                                                 fontSize: 13,
//                                                 color:
//                                                     secondaryColor20LightTheme),
//                                           )),
//                                         );
//                                       } else {
//                                         var answer = data.getUserActivityData!
//                                             .answers[index - 1];

//                                         final Question? relatedQuestion = data
//                                             .getUserActivityData?.questions
//                                             .firstWhereOrNull((question) =>
//                                                 question.answers.any((a) =>
//                                                     a.adetails.answerid ==
//                                                     answer.adetails.answerid));
//                                         return GestureDetector(
//                                           onTap: () {
//                                             Navigator.push(context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) {
//                                               return DefaultProfilePage(
//                                                   uid: relatedQuestion
//                                                           ?.businessUid ??
//                                                       "");
//                                             }));
//                                           },
//                                           child: Container(
//                                             margin: EdgeInsets.all(8.0),
//                                             padding: EdgeInsets.all(8.0),
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius:
//                                                   BorderRadius.circular(10.0),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.grey
//                                                       .withOpacity(0.5),
//                                                   spreadRadius: 5,
//                                                   blurRadius: 7,
//                                                   offset: Offset(0, 3),
//                                                 ),
//                                               ],
//                                             ),
//                                             child: ListTile(
//                                               title: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     "Q: ${relatedQuestion?.question}",
//                                                     style: TextStyle(
//                                                         fontSize: 14.0,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         wordSpacing: 0.5,
//                                                         letterSpacing: -0.1,
//                                                         color:
//                                                             secondaryColor60LightTheme),
//                                                   ),
//                                                 ],
//                                               ),
//                                               subtitle: Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     top: 1.5, left: 5),
//                                                 child: RichText(
//                                                   text: TextSpan(
//                                                     style: TextStyle(
//                                                       color:
//                                                           secondaryColor40LightTheme,
//                                                       fontSize: 12,
//                                                     ),
//                                                     children: [
//                                                       TextSpan(
//                                                           text:
//                                                               "Your response was:  '",
//                                                           style: TextStyle(
//                                                               fontSize: 11,
//                                                               fontFamily:
//                                                                   'RobotoMono')),
//                                                       TextSpan(
//                                                         text: answer.answer,
//                                                         style: TextStyle(
//                                                             color:
//                                                                 secondaryColor60LightTheme,
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                             fontSize: 12.4),
//                                                       ),
//                                                       TextSpan(
//                                                         text:
//                                                             "'\n\nProvided for: '${answer.businessName}'\nSubmitted on: '${formatDateTime(answer.adetails.createdAt)}'",
//                                                         style: TextStyle(
//                                                             fontSize: 10.2,
//                                                             fontFamily:
//                                                                 'RobotoMono',
//                                                             color:
//                                                                 secondaryColor40LightTheme),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       }
//                                     },
//                                   );
//                                 },
//                               );
//                             },
//                           );
//                         },
//                         child: Container(
//                           margin: EdgeInsets.all(8.0),
//                           padding: EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10.0),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: tgDarkPrimaryColor.withOpacity(.4),
//                                 spreadRadius: 5,
//                                 blurRadius: 7,
//                                 offset: Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   " Your 'Answers' from AskCommunity",
//                                   style: TextStyle(
//                                     fontSize: 13,
//                                     color: secondaryColor40LightTheme,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 90),
//                                   child: IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       LineAwesomeIcons.plus,
//                                       size: 17,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),

//                       SizedBox(height: 16),

//                       Center(child: Text("**********")),
//                     ],
//                   ),
//                 ),
//     );
//   }
// }

class UserActivityScreen extends StatefulWidget {
  const UserActivityScreen({Key? key}) : super(key: key);

  @override
  _UserActivityScreenState createState() => _UserActivityScreenState();
}

class _UserActivityScreenState extends State<UserActivityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    final String? userid = FirebaseAuth.instance.currentUser?.uid;
    Provider.of<UserActivityProvider>(context, listen: false)
        .userActivityProvider(userid);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    final String? userid = FirebaseAuth.instance.currentUser?.uid;
    await Provider.of<UserActivityProvider>(context, listen: false)
        .userActivityProvider(userid);
  }

  @override
  Widget build(BuildContext context) {
    ////// For customize stars////

    Widget stars(int rating) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
            rating,
            (index) => Padding(
                  padding: const EdgeInsets.only(right: 4, bottom: 7, top: 10),
                  child: Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                        color: tgDarkPrimaryColor,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.black, width: 0.3)),
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                      // color: Colors.amber[700],
                      size: 12,
                    ),
                  ),
                )),
      );
    }

    return Scaffold(
      body: Consumer<UserActivityProvider>(
        builder: (context, data, child) {
          if (data.isLoading) {
            return Center(
                child: CircularProgressIndicator(color: tgDarkPrimaryColor));
          }

          return NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  backgroundColor: tgDarkPrimaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Your Activity",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.asset(
                      "assets/6221846.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      controller: _tabController,
                      labelColor: tgDarkPrimaryColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: tgDarkPrimaryColor,
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.star_rounded,
                            size: 18.8,
                          ),
                          text: "Reviews",
                        ),
                        Tab(
                          icon: Icon(
                            Icons.help_outlined,
                            size: 20,
                          ),
                          text: "Questions",
                        ),
                        Tab(
                          icon: Icon(
                            Icons.forum_rounded,
                            size: 20,
                          ),
                          text: "Answers",
                        ),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              // color: tgDarkPrimaryColor,
              children: [
                _buildActivityList(
                    data.getUserActivityData?.comments ?? [], _buildReviewItem),
                _buildActivityList(data.getUserActivityData?.questions ?? [],
                    _buildQuestionItem),
                _buildActivityList(
                    data.getUserActivityData?.answers ?? [], _buildAnswerItem),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildActivityList(
      List items, Widget Function(BuildContext, dynamic) itemBuilder) {
    return RefreshIndicator(
      color: tgPrimaryColor,
      onRefresh: _handleRefresh,
      child: items.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  itemBuilder(context, items[index]),
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("images/Activity.json", height: 180),
          Text(
            "There are currently no activities to display",
            style: TextStyle(fontSize: 13, color: secondaryColor40LightTheme),
          )
        ],
      ),
    );
  }

  Widget _buildReviewItem(BuildContext context, dynamic comment) {
    String capitalizeEachWord(String text) {
      if (text.isEmpty) return text;
      return text.split(' ').map((word) {
        if (word.isEmpty) return word;
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }).join(' ');
    }

    return GestureDetector(
      onTap: () => _navigateToBusinessProfile(context, comment.businessUid),
      child: Container(
        margin: EdgeInsets.all(7.2),
        padding: EdgeInsets.all(7.2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(bottom: 10),
              leading: CircleAvatar(
                radius: 20,
                // backgroundColor: tgDarkPrimaryColor,
                backgroundColor: Colors.blueGrey.shade300,
                child: Text(
                  comment.businessName[0],
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                capitalizeEachWord(comment.businessName),
                style: TextStyle(
                  fontSize: 14.3,
                  fontWeight: FontWeight.w600,
                  color: secondaryColor60LightTheme,
                  fontFamily: "poppins",
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
              subtitle: Row(
                children: [
                  _buildStarRating(comment.rating),
                  SizedBox(width: 8),
                  Text(
                    "${comment.rating.toStringAsFixed(1)}",
                    style: TextStyle(
                        fontSize: 12.3,
                        fontWeight: FontWeight.w600,
                        color: secondaryColor20LightTheme),
                  ),
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: secondaryColor40LightTheme,
                size: 12,
              ),
            ),
            Text(
              comment.comment,
              style: TextStyle(
                color: secondaryColor40LightTheme,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Reviewed on ${_formatDateTime(comment.createdAt)}",
              style: TextStyle(
                color: secondaryColor20LightTheme,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionItem(BuildContext context, dynamic question) {
    return GestureDetector(
      onTap: () => _navigateToBusinessProfile(context, question.businessUid),
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
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
            "Q: ${question.question}",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              wordSpacing: 0.5,
              letterSpacing: -0.1,
              color: secondaryColor60LightTheme,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(
              "Question posed to '${question.businessName}' \non ${_formatDateTime(question.qdetails.createdAt)}",
              style: TextStyle(
                color: secondaryColor20LightTheme,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerItem(BuildContext context, dynamic answer) {
    var data = Provider.of<UserActivityProvider>(context);

    final Question? relatedQuestion = data.getUserActivityData?.questions
        .firstWhereOrNull((question) => question.answers
            .any((a) => a.adetails.answerid == answer.adetails.answerid));

    return GestureDetector(
      onTap: () => _navigateToBusinessProfile(
          context, relatedQuestion?.businessUid ?? ""),
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q: ${relatedQuestion?.question ?? 'Related question not found'}",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                wordSpacing: 0.5,
                letterSpacing: -0.1,
                color: secondaryColor60LightTheme,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: secondaryColor40LightTheme,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: "Your response was: '",
                      style: TextStyle(fontSize: 11, fontFamily: 'RobotoMono'),
                    ),
                    TextSpan(
                      text: answer.answer,
                      style: TextStyle(
                        color: secondaryColor60LightTheme,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.4,
                      ),
                    ),
                    TextSpan(
                      text:
                          "'\n\nProvided for: '${answer.businessName}'\n on: ${_formatDateTime(answer.adetails.createdAt)}",
                      style: TextStyle(
                        fontSize: 10.2,
                        // fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.w700,
                        color: secondaryColor40LightTheme,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating(int rating) {
    // return Row(
    //   children: List.generate(
    //     5,
    //     (index) => Icon(
    //       index < rating ? Icons.star_rounded : Icons.star_border_rounded,
    //       size: 19,
    //       color: Colors.amber[700],
    //     ),
    //   ),
    // );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          rating,
          (index) => Padding(
                padding: const EdgeInsets.only(right: 4, bottom: 7, top: 10),
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                      color: tgDarkPrimaryColor,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.black, width: 0.3)),
                  child: Icon(
                    Icons.star,
                    color: Colors.white,
                    // color: Colors.amber[700],
                    size: 12,
                  ),
                ),
              )),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMM d, yyyy');
    return formatter.format(dateTime.toLocal());
  }

  void _navigateToBusinessProfile(BuildContext context, String businessUid) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DefaultProfilePage(uid: businessUid),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
