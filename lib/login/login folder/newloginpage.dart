// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import "package:sssv1/login/Signupfolder/signupauth.dart";
import 'package:sssv1/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/constants.dart';
import '../forgotpwpage.dart';

class NewLoginPage extends StatefulWidget {
  const NewLoginPage({super.key});

  @override
  State<NewLoginPage> createState() => _NewLoginPageState();
}

class _NewLoginPageState extends State<NewLoginPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  bool _isLoading = false;

  // Future signIn() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: _emailcontroller.text.trim(),
  //         password: _passwordcontroller.text.trim());

  //         // fetch users data
  //         var userpro = Provider.of<UserProvider>(context, listen: false);
  //         await userpro.userProvider();
  //         setState(() {
  //         _isLoading = false;
  //       });

  //   } on FirebaseAuthException catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             content: Text(e.message.toString()),
  //           );
  //         });
  //   }
  // }

  Future<void> signIn() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );

      // Fetch user's data
      var userpro = Provider.of<UserProvider>(context, listen: false);
      await userpro.userProvider();

      // Show Snackbar on successful login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User logged in'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

    super.dispose();
  }

  final formkey = GlobalKey<FormState>();

  final bool _isfocused = false;
  bool passwordObscured = true;

  // String correctPassword = "your_correct_password";

  @override
  Widget build(BuildContext context) {
    // var userpro = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   icon: Icon(Icons.arrow_back),
        //   color: tgDarkPrimaryColor,
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.only(left: 30, right: 31),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                        fontSize: 29,
                        // color:
                        //  Color(0xFF363f93)
                        color: tgDarkPrimaryColor),
                  ),
                  Text(
                    "Let's Get Started!",
                    style: TextStyle(fontSize: 30, color: tgDarkPrimaryColor

                        // color: Color(0xFF363f93)
                        ),
                  ),
                  SizedBox(height: 40),

                  TextFormField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: _isfocused
                            ? tgPrimaryColor
                            : secondaryColor40LightTheme,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: tgAccentColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                      ),
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty ||
                    //       !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                    //           .hasMatch(value)) {
                    //     return " Enter correct mail";
                    //   } else {
                    //     return null;
                    //   }
                    // },

                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Enter your mail";
                    //   }
                    //   bool emailValid = RegExp(
                    //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                    //     if(!emailValid){
                    //       return"Enter valid email";
                    //     }
                    //   )
                    // },

                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter E-mail";
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return "Enter valid email";
                      }
                      return null;
                    },
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  ////////// passsword field /////////

                  TextFormField(
                    controller: _passwordcontroller,
                    keyboardType: TextInputType.number,
                    obscureText: passwordObscured,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        // color: _isfocused
                        //     ? tgPrimaryColor
                        //     : tgAccentColor,
                        color: secondaryColor40LightTheme,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: tgAccentColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            passwordObscured = !passwordObscured;
                          });
                        },
                        child: Icon(
                          passwordObscured
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                          color: Colors.grey.shade600,
                          size: 20.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter password";
                      } else if (_passwordcontroller.text.length < 6) {
                        return "Password should be more than 6 characters";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  ////////// forgot pasww/////////////

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ForgotPasswordPage();
                            }));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: tgPrimaryText,
                              fontSize: 15.5,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 70),

                  Row(
                    children: [
                      Container(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              color: tgDarkPrimaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: tgPrimaryText,
                              width: 0.6,
                            ),
                          ),
                        ),
                      ),
                      // ElevatedButton.icon(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.arrow_forward_rounded),
                      //   label: Text('Sign in'),
                      // ),
                      SizedBox(width: 190),

                      Container(
                        decoration: ShapeDecoration(
                            shape: CircleBorder(
                                side: BorderSide(
                                    color: Colors.transparent, width: 6))),
                        child: FloatingActionButton(
                          backgroundColor: tgDarkPrimaryColor,
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              await signIn();
                            }
                          },
                          child: _isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                ))
                              : Icon(Icons.arrow_forward_rounded,
                                  color: Colors.black),
                          elevation: 11,
                          // foregroundColor: Colors.redAccent,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 170),

                  /////////////signup  field //////////

                  // Row(
                  //   children: [
                  //     Text(
                  //       'Here for the First time?  --->>> ',
                  //       style: TextStyle(color: tgPrimaryText, fontSize: 16),
                  //     ),

                  //     SizedBox(width: 40),

                  //     GestureDetector(
                  //       onTap: () {
                  //         Navigator.of(context)
                  //             .push(MaterialPageRoute(builder: (context) {
                  //           return Signupauth();
                  //         }));
                  //       },
                  //       child: Container(
                  //         child: Text(
                  //           "Sign up ",
                  //           style: TextStyle(
                  //               color: tgDarkPrimaryColor, fontSize: 21),
                  //         ),
                  //         decoration: BoxDecoration(
                  //           border: Border(
                  //             bottom: BorderSide(
                  //               color: tgPrimaryText,
                  //               width: 0.6,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),

                  //     /////////// forgot pw field //////

                  //     // GestureDetector(
                  //     //   onTap: () {
                  //     //     Navigator.of(context)
                  //     //         .push(MaterialPageRoute(builder: (context) {
                  //     //       return ForgotPasswordPage();
                  //     //     }));
                  //     //   },
                  //     //   child: Padding(
                  //     //     padding: const EdgeInsets.symmetric(horizontal: 10),
                  //     //     child: Row(
                  //     //       mainAxisAlignment: MainAxisAlignment.end,
                  //     //       children: [
                  //     //         Text(
                  //     //           "Forgot Your Password?",
                  //     //           style: TextStyle(
                  //     //             color: tgPrimaryText,
                  //     //             fontSize: 15,

                  //     //             // fontWeight: FontWeight.bold
                  //     //           ),
                  //     //         ),
                  //     //       ],
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //   ],
                  // )
                ],
              ),
            )),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Signupauth();
          }));
        },
        child: Container(
          height: 55,
          width: double.infinity,
          color: tgAccentColor,
          child: Center(
              child: Text(
            "Sign up",
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
        ),
      ),
    );
  }
}
