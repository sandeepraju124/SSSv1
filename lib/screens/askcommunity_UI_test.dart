import 'package:flutter/material.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:provider/provider.dart';


class AskForCommunityUiTest extends StatefulWidget {
  String uid ;
  AskForCommunityUiTest({super.key,required this.uid});

  @override
  State<AskForCommunityUiTest> createState() => _AskForCommunityUiTestState();
}

class _AskForCommunityUiTestState extends State<AskForCommunityUiTest> {


  @override
  void initState() {
    var data = Provider.of<AskCommunityProvider>(context, listen: false);
    data.askCommunityProvider(widget.uid);
    super.initState();
  }


    Map<int, bool> showRemainingAnswers = {};

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AskCommunityProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Ask for community"),
      ),
      body: data.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.askCommunityData?.data.length,
              itemBuilder: (BuildContext, int) {
                var question = data.askCommunityData!.data[int];
                print(question);
                var answers = question.answers;
                print(answers);
                // determine if there are remaining answers to be shown
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
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: hasRemainingAnswers
                          ? 2 // show only the first 2 answers
                          : answers.length,
                      itemBuilder: (BuildContext, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            answers[index].answer,
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      },
                    ),
                    // show button to reveal remaining answers if any
                    if (hasRemainingAnswers)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // mark the question as having its remaining answers shown
                            showRemainingAnswers[int] = true;
                          });
                        },
                        child: Text("Show ${answers.length - 2} more answers"),
                      ),
                    Divider(),
                  ],
                );
              },
            ),
    );
  }
}