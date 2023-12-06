// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_declarations, avoid_print, use_build_context_synchronously

import 'package:flutter/Material.dart';
import 'package:sssv1/Askcommunity%20Section/displayquestions.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';

import '../utils/constants.dart';
import 'package:http/http.dart' as http;
import "package:firebase_auth/firebase_auth.dart";
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

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

  final TextEditingController _questioncontroller = TextEditingController();

//////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////// below post API  //////////////////////////
//////////////////////////////////////////////////////////////////////

  Future<void> PostAskcommunity(
    String question,
  ) async {
    final String url = "$baseUrl/post_question";
    final user = FirebaseAuth.instance.currentUser;

    final userid = user?.uid;
    // var data = Provider.of<AskCommunityProvider>(context);

    var data1 = Provider.of<AskCommunityProvider>(context, listen: false);

    final Map<String, dynamic> data = {
      "question": question,
      "business_uid": data1.askCommunityData!.businessUid,
      "userid": userid,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
      );

      if (response.statusCode == 200) {
        print("Question posted successfully");
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Question posted Successfully")));

        _questioncontroller
            .clear(); // You can add further logic here if needed, such as showing a success message.
      } else {
        print("Failed to post question. Status code: ${response.statusCode}");
        print('Response body: ${response.body}');
        // You can handle errors here, e.g., showing an error message to the user.
      }
    } catch (e) {
      print('Error: $e');
      // Handle any other exceptions that may occur during the request.
    }
  }

  // Future _handleRefresh() async {
  //    var data = Provider.of<AskCommunityProvider>(context);
  //   setState(() {

  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(LineAwesomeIcons.angle_left),
            color: tgPrimaryText,
          ),
          backgroundColor: tgPrimaryColor,
          title: Text(
            'Questions',
            style: TextStyle(color: tgPrimaryText, fontSize: 15),
          ),
        ),
        body: ListView(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextField(
                  controller: _questioncontroller,
                  decoration: InputDecoration(
                    hintText: "Ask your Question",
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
              // ElevatedButton(
              //     style:
              //         ElevatedButton.styleFrom(backgroundColor: tgPrimaryColor),
              //     onPressed: () {
              //       PostAskcommunity("");
              //     },
              //     child: Text(
              //       'Post your question',
              //       style: TextStyle(fontSize: 16, color: Colors.black87),
              //     )),
              GestureDetector(
                onTap: () {
                  PostAskcommunity(_questioncontroller.text);
                  // print("it should work as intended, can you check and see");
                },
                child: Container(
                  height: 50,
                  width: 270,
                  decoration: BoxDecoration(
                    color: tgPrimaryColor,
                    border: Border.all(color: tgPrimaryText, width: 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text(" Ask to 'Know'")),
                ),
              ),

              SizedBox(height: 17),

              Padding(
                padding: const EdgeInsets.only(right: 190),
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: tgPrimaryColor))),
                  child: Text(
                    "Below! All Previously asked Q&A.",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
              SizedBox(height: 7),

              Divider(
                color: tgPrimaryText,
                indent: 10,
                endIndent: 10,
                thickness: 0.1,
              ),

              ////////////////////// question UI starts from here ///////////

              displayQuestions(),
            ],
          ),
        ]));
  }
}
