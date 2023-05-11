// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:provider/provider.dart';


class AskForCommunityWidget extends StatefulWidget {
  final String uid;

  AskForCommunityWidget({Key? key, required this.uid}) : super(key: key);

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
        : ListView.builder(
          physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.askCommunityData?.data.length,
            itemBuilder: (BuildContext, int) {
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
                    itemBuilder: (BuildContext, index) {
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
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showRemainingAnswers[int] = true;
                        });
                      },
                      child: Text("Show ${answers.length - 2} more answers"),
                    ),
                  const Divider(),
                ],
              );
            },
          );
  }
}
