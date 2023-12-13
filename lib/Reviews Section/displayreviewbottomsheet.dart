// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Reviews%20Section/full_reviewspage.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/utils/constants.dart';

class DisplayReviewBottomSheet extends StatefulWidget {
  final String businessUid;

  // ignore: prefer_const_constructors_in_immutables
  DisplayReviewBottomSheet({
    super.key,
    required this.businessUid,
  });

  @override
  State<DisplayReviewBottomSheet> createState() =>
      _DisplayReviewBottomSheetState();
}

class _DisplayReviewBottomSheetState extends State<DisplayReviewBottomSheet> {
  int rating = 1;
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CommentSectionProvider>(context);

    final user = FirebaseAuth.instance.currentUser;

    final userid = user!.uid;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "How Would You Rate It ?",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  wordSpacing: 0.5,
                  letterSpacing: 0.3,
                  color: Colors.black87,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(height: 4),
            Row(
              children: List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      rating = index + 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    child: Icon(
                      Icons.star,
                      color:
                          index < rating ? Colors.amber.shade700 : Colors.grey,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Write Your Review",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontStyle: FontStyle.normal),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _reviewController,
                      maxLines: 5,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            'What did you like or dislike? Be concise and helpful.',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
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
                                // Fluttertoast.showToast(
                                //     msg: "Review Posted successfully!👍",
                                //     toastLength: Toast.LENGTH_SHORT,
                                //     gravity: ToastGravity.BOTTOM,
                                //     timeInSecForIosWeb: 2,
                                //     backgroundColor: Colors.grey,
                                //     textColor: Colors.white,
                                //     fontSize: 16.0),
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return showallreviewspage();
                                })),
                              }
                          });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: tgPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Submit Review',
                  style: TextStyle(fontSize: 13, color: Colors.black
                      // fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
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
