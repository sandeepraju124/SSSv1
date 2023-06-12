// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/Material.dart';
import 'package:sssv1/Askcommunitypages/answers.dart';

import '../utils/constants.dart';

import 'package:http/http.dart' as http;

class Questionpage extends StatefulWidget {
  const Questionpage({super.key, required this.id});

  final String id;

  @override
  State<Questionpage> createState() => _QuestionpageState();
}

class _QuestionpageState extends State<Questionpage> {
  // Future<Map<String, dynamic>> _getdata(id) async {
  //   String url = "http://azurewebsites.net/askcommunitybyid/";
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception("failed to get data");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   // padding: const EdgeInsets.all(15.0),
    //   padding: const EdgeInsetsDirectional.only(
    //       top: 17, bottom: 17, start: 5, end: 5),

    return Scaffold(
        // backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
            color: tgPrimaryText,
          ),
          backgroundColor: tgPrimaryColor,
          title: Text(
            'Questions',
            style: TextStyle(color: tgPrimaryText),
          ),
        ),
        body:
            // FutureBuilder<Map<String, dynamic>>(
            //     future: _getdata(widget.id),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done) {
            //         if (snapshot.hasError) {
            //           return Text("Error: ${snapshot.error}");
            //         } else {
            //           final data = snapshot.data;
            // return
            ListView(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Ask a Question",
                    hintStyle: TextStyle(
                      fontSize: 17.2,
                    ),
                    alignLabelWithHint: true,

                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: tgPrimaryText)),
                    // border: OutlineInputBorder()
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: tgPrimaryColor),
                  onPressed: () {},
                  child: Text(
                    'Post your question',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  )),

              SizedBox(height: 17),

              Divider(
                color: tgPrimaryText,
                indent: 10,
                endIndent: 10,
                thickness: 0.1,
              ),

              ////////////////////// question UI starts from here ///////////
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Container(
                  color: tgLightPrimaryColor,
                  width: double.infinity,
                  height: 222,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12, top: 12),
                        child: Text(
                          'is this a family friendly resturant?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 0.3),
                        ),
                      ),
                      Divider(
                        color: tgPrimaryText,
                        thickness: 0.1,
                        endIndent: 10,
                        indent: 10,
                      ),
                      // SizedBox(height: 40),

                      //////////profile image ///////////////////////

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://th.bing.com/th/id/R.c9c9904d93d37519ff2dc20a5d49822d?rik=%2b8eGxeUiX6ieLw&riu=http%3a%2f%2fstatic6.businessinsider.com%2fimage%2f56055b87dd0895cb7b8b4645-2400%2felon-musk-387.jpg&ehk=yx7rWOWwuAqxzomXOnkBGh%2bBSK18QWQB8ZwlnXvYDrw%3d&risl=&pid=ImgRaw&r=0"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Musk',
                              style: TextStyle(color: tgSecondaryText),
                            ),
                          )
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'Based off my experience here, yes i believe their food is organic. The servers are incredible and they should be able to confirm these if you ask.'),
                      ),
                      Divider(
                        color: tgPrimaryText,
                        thickness: 0.1,
                        endIndent: 10,
                        indent: 10,
                      ),

                      /////////// more ///////////

                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Answerpage();
                        })),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Text(
                                'More answer',
                                style: TextStyle(color: tgSecondaryText),
                              ),
                              SizedBox(width: 250),
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return Answerpage();
                                    }));
                                  },
                                  icon: Icon(Icons.arrow_forward_ios_rounded))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}

//                   );
//                 }
//               } else {
//                 return CircularProgressIndicator();
//               }
//             }));
//   }
// }
