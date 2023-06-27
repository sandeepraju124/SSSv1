// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import "package:sssv1/providers/user_provider.dart";
import "package:sssv1/utils/constants.dart";
import "package:provider/provider.dart";

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

bool editing = false;

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<UserProvider>(context);


    TextEditingController _textEditingControllerFirstName =
        TextEditingController(text: data.getUserData!.name.toString());
    TextEditingController _textEditingControllerSecondName =
        TextEditingController(text: data.getUserData!.username.toString());
    TextEditingController _textEditingControllerPhone =
        TextEditingController(text: data.getUserData!.name.toString());
    TextEditingController _textEditingControllerEmail =
        TextEditingController(text: data.getUserData!.email.toString());

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
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/7/72/Default-welcomer.png"),
                            fit: BoxFit.contain,
                          ),
                          color: Colors.grey,
                          shape: BoxShape.circle),
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
                        controller: _textEditingControllerFirstName,
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
                        controller: _textEditingControllerSecondName,
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
                  enabled: editing,
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
        onTap: () async {},
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
