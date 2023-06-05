// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:sssv1/utils/constants.dart";

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController _nameController =
      TextEditingController(text: "sandeep");
  bool _isEditing = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _nameController = TextEditingController(text: "sandeep");
  // }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Set border color
                    width: 2, // Set border width
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'images/restaurant/restaurant2.jpg'), // Replace with your image path
                ),
              ),
              GestureDetector(
                  onTap: _toggleEditing,
                  child: Icon(_isEditing ? Icons.check : Icons.edit)),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Username")),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey),
                        color: _isEditing
                            ? Colors.white
                            : secondaryColor10LightTheme,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        style: TextStyle(
                            color: _isEditing ? Colors.black : Colors.grey),
                        controller: _nameController,
                        enabled: _isEditing,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey),
                        color: _isEditing
                            ? Colors.white
                            : secondaryColor10LightTheme,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextField(
                        style: TextStyle(
                            color: _isEditing ? Colors.black : Colors.grey),
                        controller: _nameController,
                        enabled: _isEditing,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("email")),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey),
                  color: _isEditing ? Colors.white : secondaryColor10LightTheme,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  style:
                      TextStyle(color: _isEditing ? Colors.black : Colors.grey),
                  controller: _nameController,
                  enabled: _isEditing,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  _toggleEditing();
                },
                child: Text("SAVE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
