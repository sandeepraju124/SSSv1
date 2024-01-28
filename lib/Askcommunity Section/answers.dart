// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Answerpage extends StatefulWidget {
  const Answerpage({super.key, required this.questionid});

  final String questionid;

  @override
  State<Answerpage> createState() => _AnswerpageState();
}

class _AnswerpageState extends State<Answerpage> {
  final TextEditingController _answercontroller = TextEditingController();

  @override
  void dispose() {
    _answercontroller.dispose();
    _answercontroller.clear();
    super.dispose();
  }

  // Future<void> PostAnswer(
  //   String Answer,
  //   String questionId,
  // ) async {
  //   final String url = "$baseUrl/post_answer";
  //   final user = FirebaseAuth.instance.currentUser;

  //   final userid = user?.uid;
  //   final Map<String, dynamic> data = {
  //     "answer": Answer,
  //     "questionid": questionId,
  //     "userid": userid,
  //   };

  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: data,
  //     );

  //     if (response.statusCode == 200) {
  //       print("Answer posted successfully");
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text("Answer posted successfully"),
  //         ),
  //       );
  //       _answercontroller.clear();

  //       // Provider.of<AskCommunityProvider>(context, listen: false)
  //       //     .fetchAskCommunityData(userid!);

  //       // You can add further logic here if needed, such as showing a success message.
  //     } else {
  //       print("Failed to post question. Status code: ${response.statusCode}");
  //       print('Response body: ${response.body}');
  //       // You can handle errors here, e.g., showing an error message to the user.
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     // Handle any other exceptions that may occur during the request.
  //   }
  // }

  // Future<void> _refreshData() async {
  //   // ... (unchanged)
  // }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AskCommunityProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: tgPrimaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(LineAwesomeIcons.arrow_left),
          color: tgPrimaryText,
        ),
        title: Text(
          'Answers',
          style: TextStyle(color: tgPrimaryText, fontSize: 18),
        ),
      ),
      body: data.isLoading
          ? Center(
              child: CircularProgressIndicator(color: tgPrimaryColor),
            )
          : ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.askCommunityData!.data.length,
              itemBuilder: (BuildContext context, int questionIndex) {
                var question = data.askCommunityData!.data[questionIndex];

                if (question.qdetails.questionid != widget.questionid) {
                  return SizedBox.shrink();
                }

                var answers = question.answers;

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   children: [
                      //     CircleAvatar(
                      //       backgroundImage: NetworkImage(
                      //         "https://th.bing.com/th/id/R.c9c9904d93d37519ff2dc20a5d49822d?rik=%2b8eGxeUiX6ieLw&riu=http%3a%2f%2fstatic6.businessinsider.com%2fimage%2f56055b87dd0895cb7b8b4645-2400%2felon-musk-387.jpg&ehk=yx7rWOWwuAqxzomXOnkBGh%2bBSK18QWQB8ZwlnXvYDrw%3d&risl=&pid=ImgRaw&r=0",
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding:
                      //           const EdgeInsets.only(left: 10, right: 10),
                      //       child: Text(
                      //         'Musk',
                      //         style: TextStyle(color: tgSecondaryText),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13, bottom: 5),
                        child: Text(
                          "Q: ${question.question}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 360,
                        child: TextField(
                          style: TextStyle(color: secondaryColor40LightTheme),
                          controller: _answercontroller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: "Type your answer here",
                            hintStyle: TextStyle(
                              color: secondaryColor20LightTheme,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          autofocus: false,
                          maxLines: null,
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 40,
                        width: 360,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tgPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            data
                                .postAnswer(context, widget.questionid,
                                    _answercontroller.text)
                                .then((success) => {
                                      if (success)
                                        {
                                          _answercontroller.clear(),
                                        }
                                    });
                          },
                          child: Text(
                            "Answer",
                            style: TextStyle(color: tgPrimaryText),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      if (data.askCommunityData!.data.isNotEmpty) ...[
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: tgPrimaryColor))),
                          child: Text("Previous Answers !"),
                        ),
                      ],

                      SizedBox(height: 12),

                      ////////////////////// answers display //////////////

                      for (var answer in answers)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              margin: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              color: tgLightPrimaryColor,
                              elevation: 0.9,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("A: ${answer.answer}"),
                              ),
                            ),
                            Divider(
                              thickness: 0.4,
                              indent: 0.6,
                              endIndent: 0.6,
                            )
                          ],
                        ),
                      SizedBox(height: 10),

                      Center(
                        child: Card(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Ans: ${answers.length}"),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
