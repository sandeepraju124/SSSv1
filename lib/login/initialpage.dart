// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:login_ui/loginpage.dart';

// class InitialPage extends StatefulWidget {
//   const InitialPage({super.key});

//   @override
//   State<InitialPage> createState() => _InitialPageState();
// }

// class _InitialPageState extends State<InitialPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 27.0, vertical: 120.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Welcome to our Application',
//                   style: TextStyle(
//                       color: Colors.deepPurple.shade900,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Create your Account',
//                   style: TextStyle(
//                       color: Colors.black54,
//                       fontSize: 17,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 60),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 60.0),
//                   child: Image.asset(
//                     'assets/pic.png',
//                     // height: 200,
//                     width: 900,
//                   ),
//                 ),

//                 // sign in field//
//                 SizedBox(height: 100),

//                 // Flex(
//                 //  Row(
//                 //   children: [
//                 //     Container(
//                 //       padding: EdgeInsets.all(20.0),
//                 //       decoration: BoxDecoration(
//                 //           border: Border.all(color: Colors.black45),
//                 //           borderRadius: BorderRadius.circular(10.0)),
//                 //       child: Text(
//                 //         'Sign in with Email',
//                 //         style: TextStyle(
//                 //             color: Colors.black87,
//                 //             fontSize: 18,
//                 //             fontWeight: FontWeight.bold),
//                 //       ),
//                 //     ),
//                 //     Padding(
//                 //       padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                 //       child: Container(
//                 //         padding: EdgeInsets.all(20.0),
//                 //         decoration: BoxDecoration(
//                 //           border: Border.all(
//                 //             color: Colors.black45,
//                 //           ),
//                 //           borderRadius: BorderRadius.circular(10.0),
//                 //         ),
//                 //         child: Text(
//                 //           "I'AM New",
//                 //           style: TextStyle(
//                 //               color: Colors.black87,
//                 //               fontSize: 18,
//                 //               fontWeight: FontWeight.bold),
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),

//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return LoginPage();
//                         }));
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(17.0),
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.black45),
//                             borderRadius: BorderRadius.circular(10.0)),
//                         child: Text(
//                           'Log in with Email',
//                           style: TextStyle(
//                               color: Colors.black87,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),

//                     SizedBox(width: 10),

//                     // Flex(
//                     //   direction: Axis.horizontal,

//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.all(18.0),
//                         decoration: BoxDecoration(
//                             // border: Border.all(color: Colors.black45),
//                             color: Colors.deepPurple.shade800,
//                             borderRadius: BorderRadius.circular(10.0)),
//                         child: Text(
//                           "I 'AM NEW",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 252, 250, 250),
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),

//                     // ),
//                   ],
//                 ),

//                 SizedBox(height: 15),

//                 ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     minimumSize: Size(double.infinity, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(11),
//                     ),
//                     side: BorderSide(
//                       color: Colors.black45,
//                       width: 0.7,
//                     ),
//                   ),
//                   onPressed: () {},
//                   label: Text(
//                     "Sign up with Google",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   icon: FaIcon(
//                     FontAwesomeIcons.google,
//                     color: Colors.red,
//                   ),
//                 ),
//               ],
//             )),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Signupfolder/signupauth.dart';
import 'package:provider/provider.dart';
import 'authstate.dart';
import 'google_login_controller.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 26.0, vertical: 110.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to our Application',
                  style: TextStyle(
                      color: Colors.deepPurple.shade900,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Create your Account',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 95),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60.0),
                  child: Image.asset(
                    "assets/pic.png",
                    // height: 200,
                    width: 900,
                  ),
                ),

                SizedBox(height: 30),

                // sign in field//

                // Row(
                //   children: [
                //     GestureDetector(
                //       onTap: (() {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) {
                //           return AuthState();
                //         }));
                //       }),
                //       child: Container(
                //         padding: EdgeInsets.all(17.0),
                //         decoration: BoxDecoration(
                //             border: Border.all(color: Colors.black45),
                //             borderRadius: BorderRadius.circular(10.0)),
                //         child: Text(
                //           'Log in with Email',
                //           style: TextStyle(
                //               color: Colors.black87,
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //     ),
                //   ],

                //   SizedBox(width: 8),

                //   // Flex(
                //   //   direction: Axis.horizontal,

                //   Container(
                //     padding: EdgeInsets.all(18.0),
                //     decoration: BoxDecoration(
                //         // border: Border.all(color: Colors.black45),
                //         color: Colors.deepPurple.shade800,
                //         borderRadius: BorderRadius.circular(10.0)),
                //     child: GestureDetector(
                //       onTap: () {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) {
                //           return Signupauth();
                //         }));
                //       },
                //       child: Text(
                //         "I 'AM NEW",
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //             color: Color.fromARGB(255, 252, 250, 250),
                //             fontSize: 17,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ),
                // ),

                // sign field??

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        side: BorderSide(color: Colors.black45, width: 0.7)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AuthState();
                      }));
                    },
                    child: Text(
                      'Log in with Email',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),

                SizedBox(height: 15),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade800,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        side: BorderSide(color: Colors.black, width: 0.7)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Signupauth();
                      }));
                    },
                    child: Text(
                      "I' AM NEW",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),

                SizedBox(height: 15),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    side: BorderSide(
                      color: Colors.black45,
                      width: 0.7,
                    ),
                  ),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInController>(
                        context,
                        listen: false);
                    provider.login();
                    // Provider.of<GoogleSignInController>(context, listen: false)
                    //     .login();
                    // // // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    // // //   return GoogleAuthI();
                    // // // }));
                    // // Authgooglesignin().signInWithGoogle();
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return GloginIntialPage();
                    // }));
                  },
                  label: Text(
                    "Sign up with Google",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
