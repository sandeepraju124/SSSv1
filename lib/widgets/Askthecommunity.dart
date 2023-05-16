// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/utils/constants.dart';


class AskForCommunityWidget extends StatefulWidget {
  final String uid;

  const AskForCommunityWidget({Key? key, required this.uid}) : super(key: key);

  @override
  _AskForCommunityWidgetState createState() => _AskForCommunityWidgetState();
}

class _AskForCommunityWidgetState extends State<AskForCommunityWidget> {
  Map<int, bool> showRemainingAnswers = {};

  @override
  void initState() {
    super.initState();
      // var data = Provider.of<AskCommunityProvider>(context, listen: false);
      // data.askCommunityProvider(widget.uid);

  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AskCommunityProvider>(context);
    return data.isLoading
        ? Center(child: CircularProgressIndicator())
        : data.askCommunityData?.data.length == 0
        ?  Center(
          child: Column(
            children: [
              Text("be the first one to ask", style: TextStyle(color: Colors.grey)),
              Image.asset(
                height: 200,
                "images/empty.gif",),
            ],
          ))
        : ListView.builder(
          physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.askCommunityData?.data.length,
            itemBuilder: (BuildContext context,int int) {
              var question = data.askCommunityData!.data[int];
              var answers = question.answers;
              var hasRemainingAnswers =
                  answers.length > 2 && !showRemainingAnswers.containsKey(int);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      question.question,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: hasRemainingAnswers ? 2 : answers.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          answers[index].answer,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      );
                    },
                  ),
                  if (hasRemainingAnswers)
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        showRemainingAnswers[int] = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      height: 30,
                      width: double.infinity,
                      
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: secondaryColor20LightTheme)
                      ),
                      child: Text("Show ${answers.length - 2} more answers"),
                    ),
                  ),
                    // ElevatedButton(
                    //   style: ButtonStyle(iconColor:MaterialStateProperty.all(Colors.cyanAccent) ),
                    //   onPressed: () {
                    //     setState(() {
                    //       print("pressed");
                    //       showRemainingAnswers[int] = true;
                    //     });
                    //   },
                    //   child: Text("Show ${answers.length - 2} more answers"),
                    // ),
                  const Divider(),
                ],
              );
            },
          );
  }
}
