// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_declarations, avoid_print

import 'package:flutter/Material.dart';
import 'package:sssv1/Askcommunitypages/displayquestions.dart';
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

              Divider(
                color: tgPrimaryText,
                indent: 10,
                endIndent: 10,
                thickness: 0.1,
              ),

              ////////////////////// question UI starts from here ///////////
              // Padding(
              //   padding: EdgeInsets.only(top: 40),
              //   child: Container(
              //     color: tgLightPrimaryColor,
              //     width: double.infinity,
              //     height: 222,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: EdgeInsets.only(left: 12, top: 12),
              //           child: Text(
              //             'is this a family friendly resturant?',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, letterSpacing: 0.3),
              //           ),
              //         ),
              //         Divider(
              //           color: tgPrimaryText,
              //           thickness: 0.1,
              //           endIndent: 10,
              //           indent: 10,
              //         ),
              //         // SizedBox(height: 40),

              //         //////////profile image ///////////////////////

              //         Row(
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(left: 10),
              //               child: CircleAvatar(
              //                 backgroundImage: NetworkImage(
              //                     "https://th.bing.com/th/id/R.c9c9904d93d37519ff2dc20a5d49822d?rik=%2b8eGxeUiX6ieLw&riu=http%3a%2f%2fstatic6.businessinsider.com%2fimage%2f56055b87dd0895cb7b8b4645-2400%2felon-musk-387.jpg&ehk=yx7rWOWwuAqxzomXOnkBGh%2bBSK18QWQB8ZwlnXvYDrw%3d&risl=&pid=ImgRaw&r=0"),
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(left: 10),
              //               child: Text(
              //                 'Musk',
              //                 style: TextStyle(color: tgSecondaryText),
              //               ),
              //             )
              //           ],
              //         ),

              //         Padding(
              //           padding: EdgeInsets.all(8.0),
              //           child: Text(
              //               'Based off my experience here, yes i believe their food is organic. The servers are incredible and they should be able to confirm these if you ask.'),
              //         ),
              //         Divider(
              //           color: tgPrimaryText,
              //           thickness: 0.1,
              //           endIndent: 10,
              //           indent: 10,
              //         ),

              //         /////////// more ///////////

              //         GestureDetector(
              //           onTap: () => Navigator.of(context)
              //               .push(MaterialPageRoute(builder: (context) {
              //             return Answerpage();
              //           })),
              //           child: Padding(
              //             padding: const EdgeInsets.only(left: 10),
              //             child: Row(
              //               children: [
              //                 Text(
              //                   'More answer',
              //                   style: TextStyle(color: tgSecondaryText),
              //                 ),
              //                 SizedBox(width: 250),
              //                 IconButton(
              //                     onPressed: () {
              //                       Navigator.of(context).push(
              //                           MaterialPageRoute(builder: (context) {
              //                         return Answerpage();
              //                       }));
              //                     },
              //                     icon: Icon(Icons.arrow_forward_ios_rounded))
              //               ],
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              // displayQuestions(),
              displayQuestions(),
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
