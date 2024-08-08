// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/User_Activity%20Section/display_user_activities.dart';
// import 'package:sssv1/login/google_signinPages/google_login_controller.dart';
// import 'package:sssv1/providers/user_provider.dart';
// import 'package:sssv1/screens/EditProfile.dart';
// import 'package:sssv1/screens/terms_and_conditions.dart';
// import 'package:sssv1/utils/constants.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class NewUserProfilePage extends StatefulWidget {
//   const NewUserProfilePage({Key? key});

//   @override
//   State<NewUserProfilePage> createState() => _NewUserProfilePageState();
// }

// class _NewUserProfilePageState extends State<NewUserProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<UserProvider>(context, listen: false);
//     final provider =
//         Provider.of<GoogleSignInController>(context, listen: false);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: secondaryColor10LightTheme,
//         elevation: 0,
//         leading: IconButton(
//             onPressed: () {
//               // Navigator.push(context, MaterialPageRoute(builder: (context) {
//               //   return BottomAppBar();
//               // }
//               // )
//               // );
//             },
//             icon: Icon(
//               LineAwesomeIcons.angle_left,
//               color: Colors.black,
//             )),
//         title: Padding(
//           padding: const EdgeInsets.only(left: 20),
//           child: Text(
//             "Profile",
//             style: TextStyle(color: tgPrimaryText, fontSize: 17),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 32, left: 34),
//           child: Column(
//             children: [
//               Container(
//                 width: 110,
//                 height: 110,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: Colors.black,
//                     width: 0.2,
//                   ),
//                 ),
//                 // child: ClipOval(
//                 //   child: Image.network(
//                 //     // ignore: unrelated_type_equality_checks
//                 //     data.getUserData?.dp == 0 || data.getUserData?.dp == "0"
//                 //         ? "https://upload.wikimedia.org/wikipedia/commons/7/72/Default-welcomer.png"
//                 //         : (data.getUserData?.dp).toString(),
//                 //     width: 130,
//                 //     height: 130,
//                 //     fit: BoxFit.cover,
//                 //   ),
//                 // ),
//               ),

//               SizedBox(height: 4),
//               Text(
//                 data.getUserData?.name ?? 'Default Name',
//                 style:
//                     TextStyle(fontSize: 13, color: secondaryColor60LightTheme),
//               ),
//               // SizedBox(height: 2),

//               ///// column for both email and button ///////
//               Text(
//                 data.getUserData?.email ?? 'No Email',
//                 style:
//                     TextStyle(fontSize: 11, color: secondaryColor20LightTheme),
//               ),
//               SizedBox(height: 12),

//               ///////// edit profile code ///////////////////

//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return EditProfile();
//                   }));
//                 },
//                 child: Container(
//                   height: 42,
//                   width: 180,
//                   decoration: BoxDecoration(
//                     color: tgPrimaryColor,
//                     border: Border.all(width: 0.4),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey, // Shadow color
//                         offset: Offset(0, 2), // Offset of the shadow
//                         blurRadius: 4, // Spread of the shadow
//                         spreadRadius:
//                             0, // Optional: How much the shadow should expand
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(LineAwesomeIcons.user_edit),
//                         SizedBox(width: 17),
//                         Text(
//                           "Edit Your Profile",
//                           style: TextStyle(
//                             fontSize: 13,
//                             letterSpacing: 0.1,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(height: 47),

//               //////////////////// options  /////////////////

//               /// ////////////////// overview ////////////////////

//               Column(
//                 children: [
//                   Padding(padding: EdgeInsets.symmetric(horizontal: 78)),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                         return UserActivityScreen();
//                       }));
//                     },
//                     child: Container(
//                         width: 330,
//                         height: 46,
//                         decoration: BoxDecoration(
//                           color: secondaryColor10LightTheme,
//                           border: Border.all(color: Colors.black, width: 0.2),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey, // Shadow color
//                               offset: Offset(0, 2), // Offset of the shadow
//                               blurRadius: 4, // Spread of the shadow
//                               spreadRadius:
//                                   0, // Optional: How much the shadow should expand
//                             ),
//                           ],
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 16),
//                             Icon(
//                               LineAwesomeIcons.signature,
//                               color: secondaryColor40LightTheme,
//                             ),
//                             SizedBox(width: 85),
//                             Text(
//                               "Overview",
//                               style: TextStyle(
//                                 color: secondaryColor20LightTheme,
//                               ),
//                             ),
//                             SizedBox(width: 115),
//                             Icon(
//                               LineAwesomeIcons.angle_right,
//                               color: secondaryColor20LightTheme,
//                             ),
//                           ],
//                         )),
//                   ),
//                   SizedBox(height: 30),

//                   ///////////////////
//                   Container(
//                       width: 330,
//                       height: 46,
//                       decoration: BoxDecoration(
//                         color: secondaryColor10LightTheme,
//                         border: Border.all(color: Colors.black, width: 0.2),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey, // Shadow color
//                             offset: Offset(0, 2), // Offset of the shadow
//                             blurRadius: 4, // Spread of the shadow
//                             spreadRadius:
//                                 0, // Optional: How much the shadow should expand
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: 16),
//                           Icon(
//                             LineAwesomeIcons.question_circle,
//                             color: secondaryColor20LightTheme,
//                           ),
//                           SizedBox(width: 85),
//                           Text(
//                             "Help",
//                             style: TextStyle(
//                               color: secondaryColor20LightTheme,
//                             ),
//                           ),
//                           SizedBox(width: 142),
//                           Icon(
//                             LineAwesomeIcons.angle_right,
//                             color: secondaryColor40LightTheme,
//                           ),
//                         ],
//                       )),
//                   SizedBox(height: 30),

//                   /////////// ///////////////

//                   Container(
//                       width: 330,
//                       height: 46,
//                       decoration: BoxDecoration(
//                         color: secondaryColor10LightTheme,
//                         border: Border.all(color: Colors.black, width: 0.2),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey, // Shadow color
//                             offset: Offset(0, 2), // Offset of the shadow
//                             blurRadius: 4, // Spread of the shadow
//                             spreadRadius:
//                                 0, // Optional: How much the shadow should expand
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: 16),
//                           Icon(
//                             LineAwesomeIcons.users,
//                             color: secondaryColor20LightTheme,
//                           ),
//                           SizedBox(width: 85),
//                           Text(
//                             "Refer a Friend",
//                             style: TextStyle(
//                               color: secondaryColor20LightTheme,
//                             ),
//                           ),
//                           SizedBox(width: 90),
//                           Icon(
//                             LineAwesomeIcons.angle_right,
//                             color: secondaryColor40LightTheme,
//                           ),
//                         ],
//                       )),
//                   SizedBox(height: 30),

//                   //////////////////////////  logout /////////////

//                   GestureDetector(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             backgroundColor: tgTextIcon,
//                             contentPadding: EdgeInsets.zero,
//                             title: Text(
//                               "Are you sure you wanna logout",
//                               style:
//                                   TextStyle(fontSize: 16, letterSpacing: 0.2),
//                             ),
//                             actions: [
//                               MaterialButton(
//                                 // color: tgLightPrimaryColor,
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: Text(
//                                   'No!',
//                                   style: TextStyle(color: tgPrimaryColor),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: MaterialButton(
//                                   // color: tgLightPrimaryColor,
//                                   onPressed: () async {
//                                     await provider.logOut();
//                                     Navigator.of(context).pop();
//                                   },
//                                   child: Text(
//                                     'Yes, logout',
//                                     style: TextStyle(color: tgPrimaryColor),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     child: Container(
//                         width: 330,
//                         height: 46,
//                         decoration: BoxDecoration(
//                           color: secondaryColor10LightTheme,
//                           border: Border.all(color: Colors.black, width: 0.2),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey, // Shadow color
//                               offset: Offset(0, 2), // Offset of the shadow
//                               blurRadius: 4, // Spread of the shadow
//                               spreadRadius:
//                                   0, // Optional: How much the shadow should expand
//                             ),
//                           ],
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 16),
//                             Icon(
//                               LineAwesomeIcons.alternate_sign_out,
//                               color: secondaryColor20LightTheme,
//                             ),
//                             SizedBox(width: 85),
//                             Text(
//                               "Log Out",
//                               style: TextStyle(
//                                 color: secondaryColor20LightTheme,
//                               ),
//                             ),
//                             SizedBox(width: 123),

//                             Icon(
//                               LineAwesomeIcons.angle_right,
//                               color: secondaryColor40LightTheme,
//                             ),
//                             // Icon(LineAwesomeIcons.)
//                           ],
//                         )),
//                   ),

//                   ////////////// terms & conditions ////////////////

//                   SizedBox(height: 30),

//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                         return TermsAndConditions();
//                       }));
//                     },
//                     child: Container(
//                         width: 330,
//                         height: 46,
//                         decoration: BoxDecoration(
//                           color: secondaryColor10LightTheme,
//                           border: Border.all(color: Colors.black, width: 0.2),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey, // Shadow color
//                               offset: Offset(0, 2), // Offset of the shadow
//                               blurRadius: 4, // Spread of the shadow
//                               spreadRadius:
//                                   0, // Optional: How much the shadow should expand
//                             ),
//                           ],
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 16),
//                             Icon(
//                               LineAwesomeIcons.comments,
//                               color: secondaryColor20LightTheme,
//                             ),
//                             SizedBox(width: 70),
//                             Text(
//                               "Terms '&' Conditions",
//                               style: TextStyle(
//                                 color: secondaryColor20LightTheme,
//                               ),
//                             ),
//                             SizedBox(width: 65),

//                             Icon(
//                               LineAwesomeIcons.angle_right,
//                               color: secondaryColor40LightTheme,
//                             ),
//                             // Icon(LineAwesomeIcons.)
//                           ],
//                         )),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
