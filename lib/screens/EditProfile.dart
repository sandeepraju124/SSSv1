// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import "dart:io";
import 'package:image_picker/image_picker.dart';
import "package:flutter/material.dart";
import "package:sssv1/providers/user_provider.dart";
import "package:sssv1/utils/constants.dart";
import "package:provider/provider.dart";
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import "package:sssv1/utils/success_lottiejson.dart";

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

bool editing = false;
File? _changedDp;

Map<String, String> updatedData = {};

class _EditProfileState extends State<EditProfile> {
  Future imagePicker(ImageSource source) async {
    ImagePicker pick = ImagePicker();
    final pickedFile = await pick.pickImage(source: source);
    setState(() {
      _changedDp = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("edit profile widget called");
    var data = Provider.of<UserProvider>(context);
    Future<void> updateData() async {
      final user = FirebaseAuth.instance.currentUser;
      final userid = user?.uid;
      final Uri url = Uri.parse("$baseUrl/user/$userid");

      try {
        final request = http.MultipartRequest('PUT', url);
        // request.headers['Content-Type'] = 'application/json';
        if (_changedDp != null) {
          request.files
              .add(await http.MultipartFile.fromPath('dp', _changedDp!.path));
        }
        request.fields.addAll(updatedData);
        // send the request
        var response = await request.send();

        if (response.statusCode == 200) {
          print('User updated successfully');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => lottie()),
          );

          // Pop back to the previous screen after a delay (optional)
          Future.delayed(Duration(seconds: 2), () {
            Navigator.pop(context);
            setState(() {
              editing = false;
            });
          });
          await data.userProvider();
        } else if (response.statusCode == 404) {
          print('User not found');
        } else {
          print('Failed to update user. Status code: ${response.statusCode}');
        }
      } catch (e) {
        print("Exception Occurred $e");
      }
    }

    TextEditingController _textEditingControllerName =
        TextEditingController(text: data.getUserData!.name.toString());
    TextEditingController _textEditingControllerUserName =
        TextEditingController(text: data.getUserData!.username.toString());
    TextEditingController _textEditingControllerPhone =
        TextEditingController(text: data.getUserData!.name.toString());
    TextEditingController _textEditingControllerEmail =
        TextEditingController(text: data.getUserData!.email.toString());

    // Listen for changes in the text fields and if there any change add to empty map

    _textEditingControllerName.addListener(() {
      updatedData['name'] = _textEditingControllerName.text;
    });

    _textEditingControllerUserName.addListener(() {
      updatedData['username'] = _textEditingControllerUserName.text;
    });

    _textEditingControllerPhone.addListener(() {
      updatedData['phone'] = _textEditingControllerPhone.text;
    });

// _textEditingControllerEmail.addListener(() {
//   updatedData['email'] = _textEditingControllerEmail.text;
// });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "EDIT PROFILE",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                color: secondaryColor10LightTheme,
                // color: Colors.deepOrangeAccent,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        imagePicker(ImageSource.gallery);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: _changedDp != null
                                  ? FileImage(_changedDp!)
                                  : NetworkImage(data.getUserData!.dp)
                                      as ImageProvider,
                              fit: BoxFit.contain,
                            ),
                            color: Colors.grey,
                            shape: BoxShape.circle),
                      ),
                    ),
                    Positioned(
                      // left: 0,
                      // bottom: 0,
                      top: 59,
                      right: 150,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          padding: EdgeInsets.all(3),
                          child: Icon(Icons.camera_enhance_outlined,
                              size: 15, color: Colors.black)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    editing = !editing;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey)),
                  child: Text("Edit Profile"),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 55,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        style: TextStyle(
                            color: editing ? Colors.black : Colors.grey),
                        controller: _textEditingControllerName,
                        enabled: editing,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10.0),
                          labelText: "Name",
                          hintText: "Enter your name",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 55,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        style: TextStyle(
                            color: editing ? Colors.black : Colors.grey),
                        controller: _textEditingControllerUserName,
                        enabled: editing,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10.0),
                          labelText: "Username",
                          hintText: "Enter your name",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 55,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: editing ? Colors.black : Colors.grey),
                  controller: _textEditingControllerPhone,
                  enabled: editing,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: "Phone",
                    hintText: "phone",
                  ),
                ),
              ),
              Container(
                height: 55,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: editing ? Colors.black : Colors.grey),
                  controller: _textEditingControllerEmail,
                  enabled: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: "Email",
                    hintText: "Enter your name",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () async {
          // print(_textEditingControllerName.text);
          updateData();
          print(updatedData);
        },
        child: Container(
          height: 55,
          width: double.infinity,
          color: tgAccentColor,
          child: Center(
              child: Text(
            "UPDATE",
            style: TextStyle(
                color: editing ? Colors.white : Colors.grey, fontSize: 17),
          )),
        ),
      ),
    );
  }
}
