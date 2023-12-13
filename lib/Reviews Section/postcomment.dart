// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:sssv1/Reviews%20Section/full_reviewspage.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PostComment extends StatefulWidget {
  String businessUid;
  PostComment({super.key, required this.businessUid});

  @override
  State<PostComment> createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {
  int rating = 1;
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userid = user!.uid;

    print(userid);
    var data = Provider.of<CommentSectionProvider>(context, listen: false);
    // var userdata = Provider.of<UserProvider>(context);
    // print(rating);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 2,
          // backgroundColor: tgAccentColor,
          backgroundColor: tgPrimaryColor,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              LineAwesomeIcons.angle_left,
              color: tgPrimaryText,
              size: 22,
            ),
          ),
          title: Text(
            "Express your opinion here",
            style: TextStyle(color: tgPrimaryText, fontSize: 18),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How would you rate it ?",
                style: TextStyle(
                    fontSize: 18,
                    wordSpacing: 0.5,
                    letterSpacing: -0.4,
                    fontWeight: FontWeight.w600,
                    color: secondaryColor60LightTheme),
              ),
              SizedBox(height: 14),
              Row(
                children: [
                  // star 1
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        rating = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: tgDividerColor),
                              color: rating >= 1
                                  ? tgDarkPrimaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(3)),
                          padding: EdgeInsets.all(5),
                          child: Icon(
                              rating >= 1 ? Icons.star : Icons.star_border,
                              color:
                                  rating >= 1 ? Colors.white : tgDividerColor,
                              size: 24),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  // star 2
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        rating = 2;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: tgDividerColor),
                          color:
                              rating >= 2 ? tgDarkPrimaryColor : Colors.white,
                          borderRadius: BorderRadius.circular(3)),
                      padding: EdgeInsets.all(5),
                      child: Icon(rating >= 2 ? Icons.star : Icons.star_border,
                          color: rating >= 2 ? Colors.white : tgDividerColor,
                          size: 24),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  // star 3
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        rating = 3;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: tgDividerColor),
                          color:
                              rating >= 3 ? tgDarkPrimaryColor : Colors.white,
                          borderRadius: BorderRadius.circular(3)),
                      padding: EdgeInsets.all(5),
                      child: Icon(rating >= 3 ? Icons.star : Icons.star_border,
                          color: rating >= 3 ? Colors.white : tgDividerColor,
                          size: 24),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  // star 4
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        rating = 4;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: tgDividerColor),
                          // color: tgDarkPrimaryColor,
                          color:
                              rating >= 4 ? tgDarkPrimaryColor : Colors.white,
                          borderRadius: BorderRadius.circular(3)),
                      padding: EdgeInsets.all(5),
                      child: Icon(rating >= 4 ? Icons.star : Icons.star_border,
                          color: rating >= 4 ? Colors.white : tgDividerColor,
                          size: 24),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  // sar 5
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        rating = 5;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: tgDividerColor),
                          color:
                              rating >= 5 ? tgDarkPrimaryColor : Colors.white,
                          borderRadius: BorderRadius.circular(3)),
                      padding: EdgeInsets.all(5),
                      child: Icon(rating >= 5 ? Icons.star : Icons.star_border,
                          color: rating >= 5 ? Colors.white : tgDividerColor,
                          size: 24),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Write Your Review",
                    style: TextStyle(
                        fontSize: 18,
                        wordSpacing: 0.5,
                        letterSpacing: -0.4,
                        fontWeight: FontWeight.w600,
                        color: secondaryColor60LightTheme),
                  ),
                  SizedBox(height: 8),
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _reviewController,
                      maxLines: 7,
                      style: TextStyle(
                          color: secondaryColor60LightTheme, fontSize: 16),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          border: InputBorder.none,
                          hintText:
                              'What did you like or dislike ? Can be very concisely ',
                          hintStyle: TextStyle(
                              color: secondaryColor20LightTheme, fontSize: 13)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ))),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (_reviewController.text.trim().isEmpty) {
            _showErrorDialog("Please enter your review before posting ");
          } else {
            data
                .postCommentProvider(
                  business_uid: widget.businessUid,
                  user_id: userid,
                  review: _reviewController.text,
                  rating: rating,
                  context: context,
                )
                .then((success) => {
                      if (success)
                        {
                          _reviewController.clear(),
                          Navigator.pop(context),
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return showallreviewspage();
                          })),
                        }
                    });
          }

          // navigatorPush(context,SearchLocationScreen() );
        },
        child: Container(
          height: 55,
          width: double.infinity,
          color: tgAccentColor,
          child: Center(
              child: Text(
            "Post ",
            style: TextStyle(
                // color: _isbuttonDisabled ? Colors.white54 : Colors.white,
                fontSize: 17),
          )),
        ),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(""),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
