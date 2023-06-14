// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    var data = Provider.of<CommentSectionProvider>(context, listen:false );
    // var userdata = Provider.of<UserProvider>(context);
    // print(rating);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          // backgroundColor: tgAccentColor,
          backgroundColor: Colors.white,
          leading: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text(" << back", style: TextStyle(color: tgAccentColor), ))),
            ],
          ),
          ),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                // star 1
                GestureDetector(
                  onTap: () {
                    setState(() {
                      rating = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: tgDividerColor),
                        color: rating >= 1 ? tgDarkPrimaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(3)),
                    padding: EdgeInsets.all(5),
                    child: Icon(rating >= 1 ? Icons.star : Icons.star_border,
                        color: rating >= 1 ? Colors.white : tgDividerColor,
                        size: 24),
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
                        color: rating >= 2 ? tgDarkPrimaryColor : Colors.white,
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
                        color: rating >= 3 ? tgDarkPrimaryColor : Colors.white,
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
                        color: rating >= 4 ? tgDarkPrimaryColor : Colors.white,
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
                        color: rating >= 5 ? tgDarkPrimaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(3)),
                    padding: EdgeInsets.all(5),
                    child: Icon(rating >= 5 ? Icons.star : Icons.star_border,
                        color: rating >= 5 ? Colors.white : tgDividerColor,
                        size: 24),
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                controller: _reviewController,
                maxLines: 5,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: InputBorder.none,
                  hintText: 'Write a review',
                ),
              ),
            ),
          ],
        ),
      ))),
      bottomNavigationBar: InkWell(
        onTap: () {
          data.postCommentProvider(business_uid: widget.businessUid, user_id: userid, review: _reviewController.text);
          // navigatorPush(context,SearchLocationScreen() );
        },
        child: Container(
          height: 55,
          width: double.infinity,
          color: tgAccentColor,
          child: Center(
              child: Text(
            "Post ",
            style: TextStyle(color: Colors.white, fontSize: 17),
          )),
        ),
      ),
    );
  }
}
