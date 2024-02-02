// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/utils/constants.dart';

class UpdatecommentPage extends StatefulWidget {
  final String businessUid;
  final String reviewId;
  final String userId;
  final String currentReview;
  final int currentRating;

  const UpdatecommentPage({
    required this.businessUid,
    required this.reviewId,
    required this.userId,
    required this.currentReview,
    required this.currentRating,
    Key? key,
  }) : super(key: key);

  @override
  State<UpdatecommentPage> createState() => _UpdatecommentPageState();
}

class _UpdatecommentPageState extends State<UpdatecommentPage> {
  final TextEditingController _reviewController = TextEditingController();
  int _currentRating = 0;

  @override
  void initState() {
    super.initState();
    _reviewController.text = widget.currentReview;
    _currentRating = widget.currentRating;
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CommentSectionProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Edit Your Review",
                style: TextStyle(
                  fontSize: 13.4,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentRating = index + 1;
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: index < _currentRating
                        ? Colors.amber.shade700
                        : Colors.grey,
                    size: 33,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
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
                    fontSize: 13.6,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Kindly enter your revised feedback here',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await data
                    .editCommentProvider(
                        context: context,
                        business_uid: widget.businessUid,
                        review_id: widget.reviewId,
                        user_id: widget.userId,
                        rating: _currentRating,
                        review: _reviewController.text)
                    .then((success) => {
                          if (success)
                            {
                              Navigator.pop(context),
                            }
                        });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: tgDarkPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
