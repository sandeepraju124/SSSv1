// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, empty_catches, avoid_print, unused_element, dead_code

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sssv1/network_calling/http.dart';
import '../google_login_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _firstnamecontroller = TextEditingController();
  final _lastnamecontroller = TextEditingController();
  final _mobilenumbercontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  // Future Signup() async {
  //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _emailcontroller.text.trim(),
  //       password: _passwordcontroller.text.trim());

  //   // add user details//

  //   adduserdetails(
  //       _firstnamecontroller.text.trim(),
  //       _lastnamecontroller.text.trim(),
  //       int.parse(_mobilenumbercontroller.text.trim()),
  //       _emailcontroller.text.trim());
  // }
  // bool SignUp1 = true;
  // bool googles = true;

  Future SignUp() async {
    // if (SignUp1) {

    try {
      print('sign up clicked');
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());


      // adding users data in firebase

      // adduserdetails(
      //     _firstnamecontroller.text.trim(),
      //     _lastnamecontroller.text.trim(),
      //     int.parse(_mobilenumbercontroller.text.trim()),
      //     _emailcontroller.text.trim());


          final user = FirebaseAuth.instance.currentUser;
          final userid = user?.uid;
          Map<String, String> body = {
            'name': _firstnamecontroller.text.trim(),
            'email': _emailcontroller.text.trim(),
            "username":_lastnamecontroller.text.trim(),
            "dp":"https://tinypng.com/images/social/website.jpg",
            "street":"hyderabad",
            "state":"telangana",
            "zipcode":"500072",
            "lat":"546",
            "lng":"648",
            "userid":userid.toString()
  };
          GetData().postData('https://bitebest.azurewebsites.net/user', body).then((value) => print('Data posted successfully'));
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });

      //     return SignedinPageR();
      //   }
      // } else {
      //   return SignUpPage();
    }
  }

  // adding user data to firebase
  
  // Future adduserdetails(
  //     String firstname, String lastname, int mobilenumber, String email) async {
  //   await FirebaseFirestore.instance.collection('Userdetails').add({
  //     'First name': firstname,
  //     'last name': lastname,
  //     'Mobile Number': mobilenumber,
  //     'Email': email,
  //   });
  // }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _firstnamecontroller.dispose();
    _lastnamecontroller.dispose();
    _mobilenumbercontroller.dispose();

    super.dispose();
  }

  bool passwordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Register your Account',
          style: TextStyle(color: Colors.black),
        ),
        // elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              //First name//
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: _firstnamecontroller,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'First name',
                    labelStyle: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              //last name field//

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: _lastnamecontroller,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Last name',
                    labelStyle: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // phone number//

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: _mobilenumbercontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number (Optional)',
                    labelStyle: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: Icon(
                      Icons.call,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // email field //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: Icon(
                      Icons.mail_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              //password field//

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: _passwordcontroller,
                  obscureText: passwordObscured,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                      borderRadius: BorderRadius.circular(12),
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
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15),

              //sign in field//

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GestureDetector(
                  onTap: SignUp,
                  child: Container(
                    padding: EdgeInsets.all(22.0),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade600,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 160),

              // google signup//

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ElevatedButton.icon(
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
                  },
                  label: Text(
                    "Continue with Google",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
