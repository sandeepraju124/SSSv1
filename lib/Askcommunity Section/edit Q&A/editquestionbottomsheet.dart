// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_super_parameters

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/utils/constants.dart';

class EditQuestionbottomsheet extends StatefulWidget {
  final String businessUid;
  final String questionId;
  final String currentQuestionText;

  EditQuestionbottomsheet({
    Key? key,
    required this.businessUid,
    required this.questionId,
    required this.currentQuestionText,
  }) : super(key: key);

  @override
  State<EditQuestionbottomsheet> createState() =>
      _EditQuestionbottomsheetState();
}

class _EditQuestionbottomsheetState extends State<EditQuestionbottomsheet> {
  late TextEditingController _questionController;
  @override
  void initState() {
    super.initState();
    _questionController =
        TextEditingController(text: widget.currentQuestionText);

    // Set cursor position to the end of the text
    // _questionController.selection = TextSelection.fromPosition(
    //   TextPosition(offset: _questionController.text.length),
    // );
  }

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AskCommunityProvider data =
        Provider.of<AskCommunityProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.only(bottom: 18, right: 244, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: tgDarkPrimaryColor))),
                  child: Text(
                    "Edit your Question",
                  ),
                ),
              ],
            ),
          ),
          TextField(
            style: TextStyle(color: secondaryColor40LightTheme, fontSize: 13.2),
            controller: _questionController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[300],
              hintText: "Kindly type your question here",
              hintStyle: TextStyle(
                color: secondaryColor20LightTheme,
                fontSize: 13,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
                borderSide: BorderSide.none,
              ),
            ),
            autofocus: false,
            maxLines: null,
          ),
          SizedBox(height: 12),
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
                // if (_questionController.text.isEmpty) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text("Please enter your question.")),
                //   );
                //   return;
                // }

                data
                    .editQuestion(
                  context,
                  data.askCommunityData!
                      .businessUid, // Replace with actual business_uid
                  widget.questionId, // Replace with actual questionId
                  _questionController.text,
                )
                    .then((success) {
                  if (success) {
                    _questionController.clear();
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Failed to edit your question.")),
                    );
                  }
                });
              },
              child: Text(
                "Save Changes",
                style: TextStyle(color: tgPrimaryText),
              ),
            ),
          ),
          SizedBox(height: 33),
        ],
      ),
    );
  }
}
