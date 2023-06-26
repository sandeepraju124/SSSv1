// import 'package:backendapp/screens/add_service_screens/addService.dart';
// import 'package:backendapp/screens/location_search_screen.dart';
// import 'package:backendapp/screens/map.dart';
// import 'package:backendapp/utils/constants.dart';
// import 'package:backendapp/utils/navigators.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/providers/user_provider.dart';
import '../../utils/constants.dart';
import 'package:provider/provider.dart';

class NewSignuppage extends StatefulWidget {
  const NewSignuppage({super.key});

  @override
  State<NewSignuppage> createState() => _NewSignuppageState();
}

class _NewSignuppageState extends State<NewSignuppage> {
  bool passwordObscured = true;

  // String selectedGender = "";
  Gender? _selectedGender;
  File? _dp;

  Future imagePicker(ImageSource source) async {
    ImagePicker pick = ImagePicker();
    final pickedFile = await pick.pickImage(source: source);
    setState(() {
      _dp = File(pickedFile!.path);
    });
  }

  Widget _buildGenderOption(Gender gender, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(16),
            color: _selectedGender == gender
                ? tgLightPrimaryColor
                : Colors.grey[200]),
        child: Text(label),
      ),
    );
  }

  final _firstnamecontroller = TextEditingController();
  final _lastnamecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _mobilenumbercontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _firstnamecontroller.dispose();
    _lastnamecontroller.dispose();
    _mobilenumbercontroller.dispose();
    _passwordcontroller.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    var userpro = Provider.of<UserProvider>(context, listen: false);


    // function things to do 
    //register with firebase
    //post data to mongodb 
    //fetch data and store on provider after posting 

    Future signup() async {
    print('Sign up clicked');
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());

      final user = FirebaseAuth.instance.currentUser;
      final userid = user?.uid;

      Map<String, String> body = {
        'name': _firstnamecontroller.text.trim(),
        'email': _emailcontroller.text.trim(),
        "username": _lastnamecontroller.text.trim(),
        "street": "hyderabad",
        "state": "telangana",
        "zipcode": "500072",
        "lat": "546",
        "lng": "648",
        "userid": userid.toString()
      };
      final request = http.MultipartRequest("POST", Uri.parse("https://axispowers.azurewebsites.net/user"));
      if (_dp != null){
        request.files.add(await http.MultipartFile.fromPath('dp', _dp!.path));
      }
      // ..files.add(await http.MultipartFile.fromPath('dp', _dp!.path))
      request.fields.addAll(body);

      final response = await request.send();
      print(response.statusCode);
      print(response);
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        print(responseBody);

        //fetch data and store on provider
        userpro.userProvider();
        
        print('user created successfully');
        return 'user created successfully';
      } else {
        throw Exception('Failed to create user');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('EXception Failed to create user : $e');
    }
     on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Color.fromARGB(255, 15, 100, 91),
          title: const Text(
            "REGISTER",
            style: TextStyle(color: Colors.white),
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 65,
                    child: SizedBox(
                      // color: Colors.red,
                      height: 188,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextFormField(
                                controller: _firstnamecontroller,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                    labelText: 'First name',
                                    labelStyle:
                                        TextStyle(color: tgSecondaryText),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: tgSecondaryText)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: tgAccentColor))),
                                // autofocus: false,
                                maxLines: null,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(value)) {
                                    return "Enter First name";
                                  }
                                  return null;
                                },
                              ),
                              // SizedBox(height: 10),

                              ////last name ///////
                              TextFormField(
                                controller: _lastnamecontroller,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                    labelText: 'Last name',
                                    labelStyle:
                                        TextStyle(color: tgSecondaryText),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: tgSecondaryText)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: tgAccentColor))),
                                autofocus: false,
                                maxLines: null,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(value)) {
                                    return "Enter Last name";
                                  }
                                  return null;
                                },
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 35,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      // color: Colors.red,
                      color: Colors.grey[200],
                      height: 150,
                      child: GestureDetector(
                        onTap: () {
                          imagePicker(ImageSource.gallery);
                        },
                        child: _dp == null
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage("images/defaulltdp.png"))
                            : CircleAvatar(
                                radius: 50, backgroundImage: FileImage(_dp!)),
                      ),
                    ),
                  )
                ],
              ),
              // SizedBox(
              //   height: 5,
              // ),
              ///// Gender option ///////////

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildGenderOption(Gender.male, "Male"),
                  _buildGenderOption(Gender.female, "Female"),
                  _buildGenderOption(Gender.preferNotToSay, "prefer not to say")
                ],
              ),
              SizedBox(
                height: 6,
              ),
              const Divider(
                height: 6,
                thickness: 1,
                color: secondaryColor10LightTheme,
              ),
              const SizedBox(
                height: 10,
              ),

              ///////// email field////
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                      labelText: ' Email',
                      labelStyle: TextStyle(color: tgSecondaryText),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tgSecondaryText)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tgAccentColor))),
                  autofocus: false,
                  maxLines: null,
                  keyboardType: TextInputType.emailAddress,
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
              ),
              const SizedBox(
                height: 10,
              ),

              //// passsword field /////////

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _passwordcontroller,
                  keyboardType: TextInputType.text,
                  obscureText: passwordObscured,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: tgSecondaryText),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tgSecondaryText)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tgAccentColor)),
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
                            color: Colors.grey.shade400,
                            size: 20.0,
                          ))),
                  autofocus: false,
                  // maxLines: null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    } else if (_passwordcontroller.text.length < 6) {
                      return "Password should be more than 6 characters";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 11),

              ///////mobilenumber field /////////

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _mobilenumbercontroller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                      labelText: ' Mobile Number',
                      labelStyle: TextStyle(color: tgSecondaryText),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tgSecondaryText)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: tgAccentColor))),
                  autofocus: false,
                  maxLines: null,
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: InkWell(
        onTap: () async {
          if (formkey.currentState!.validate()) {
            await signup();
          }
        },
        child: Container(
          height: 55,
          width: double.infinity,
          color: tgAccentColor,
          child: Center(
              child: Text(
            "Register",
            style: TextStyle(color: Colors.white, fontSize: 17),
          )),
        ),
      ),
    );
  }
}

enum Gender { male, female, preferNotToSay }
