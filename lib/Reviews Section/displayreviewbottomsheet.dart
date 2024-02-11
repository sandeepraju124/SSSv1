// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Reviews%20Section/full_reviewspage.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/utils/constants.dart';

class DisplayReviewBottomSheet extends StatefulWidget {
  final String businessUid;

  DisplayReviewBottomSheet({
    Key? key,
    required this.businessUid,
  }) : super(key: key);

  @override
  State<DisplayReviewBottomSheet> createState() =>
      _DisplayReviewBottomSheetState();
}

class _DisplayReviewBottomSheetState extends State<DisplayReviewBottomSheet> {
  int rating = 1;
  final TextEditingController _reviewController = TextEditingController();
  bool _showOtherReviewField = false;
  List<String> _selectedSuggestions = []; // initially empty
  List<bool> _isSelected = [];
  bool _isReviewValid = false; // Flag to track if the review is valid

  @override
  void initState() {
    super.initState();
    // Initialize suggestions for default rating
    _selectedSuggestions = _getSuggestionsForRating(rating);
    _isSelected = List<bool>.filled(_selectedSuggestions.length, false);
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CommentSectionProvider>(context);
    final user = FirebaseAuth.instance.currentUser;
    _isReviewValid =
        _selectedSuggestions.any((suggestion) => _isSelected.contains(true)) ||
            _reviewController.text.trim().isNotEmpty;

    final userid = user!.uid;
    return Material(
      child: SingleChildScrollView(
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
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: List.generate(
                  5,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        rating = index + 1;
                        // Update suggestions when rating changes
                        _selectedSuggestions = _getSuggestionsForRating(rating);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Icon(
                        Icons.star,
                        color: index < rating
                            ? Colors.amber.shade700
                            : Colors.grey,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              // Suggested reviews
              // Wrap(
              //   children: _selectedSuggestions
              //       .map((review) => _buildSuggestedReview(review))
              //       .toList(),
              // ),
              Wrap(
                children: _selectedSuggestions.asMap().entries.map((entry) {
                  int index = entry.key;
                  String review = entry.value;
                  return _buildSuggestedReview(review, index);
                }).toList(),
              ),
              // Other option
              CheckboxListTile(
                fillColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return tgDarkPrimaryColor;
                    }
                    return null; // Default color when not selected
                  },
                ),
                title: Text('Other'),
                value: _showOtherReviewField,
                onChanged: (bool? value) {
                  setState(() {
                    _showOtherReviewField = value ?? false;
                  });
                },
              ),
              if (_showOtherReviewField)
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
                            'Share your experience and help others make informed decisions',
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
                onPressed: _isReviewValid
                    ? () {
                        List<String> selectedReviews = _selectedSuggestions
                            .asMap()
                            .entries
                            .where((entry) => _isSelected[entry.key])
                            .map((entry) => entry.value)
                            .toList();
                        String otherReview = _reviewController.text.trim();
                        if (otherReview.isNotEmpty &&
                            !selectedReviews.contains(otherReview) &&
                            !_selectedSuggestions.contains(otherReview)) {
                          selectedReviews.add(otherReview);
                        } else if (otherReview.isEmpty &&
                            selectedReviews.isEmpty) {
                          // If there is no other review and no selected suggestions,
                          // we should not proceed with the submission.
                          return;
                        }
                        // Now you can use selectedReviews list for submission
                        data.postCommentProvider(
                          context: context,
                          rating: rating,
                          business_uid: data.getCommentsData!.businessUid,
                          user_id: userid,
                          selectedSuggestions: selectedReviews,
                          userReviews: [otherReview],
                        ).then((success) => {
                              if (success)
                                {
                                  _reviewController.clear(),
                                  Navigator.pop(context),
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return showallreviewspage();
                                    }),
                                  )
                                }
                            });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _isReviewValid ? tgDarkPrimaryColor : tgLightPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Submit Review',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestedReview(String review, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected[index] = !_isSelected[index];
        });
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        decoration: BoxDecoration(
          color: _isSelected[index] ? tgLightPrimaryColor : Colors.white,
          border: Border.all(
            color: _isSelected[index] ? tgDarkPrimaryColor : Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          review,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  // Get suggestions based on the rating
  List<String> _getSuggestionsForRating(int rating) {
    switch (rating) {
      case 1:
        return [
          'The service was terrible.',
          'I had a really bad experience.',
          'I would not recommend it to anyone.',
          'Extremely dissatisfied with the service.',
          'Worst experience ever.'
        ];
      case 2:
        return [
          'Could have been better.',
          'Not a great experience overall.',
          'I expected more from them.',
          'The service needs improvement.',
          'Disappointing experience.'
        ];
      case 3:
        return [
          'It was an okay experience.',
          'Neither good nor bad.',
          'Could be better, could be worse.',
          'Not too impressed with the service.',
          'Fairly average experience.'
        ];
      case 4:
        return [
          'I had a good experience overall.',
          'Satisfactory service.',
          'I would recommend it to others.',
          'Pretty impressed with the service.',
          'A decent experience.'
        ];
      case 5:
        return [
          'Absolutely amazing experience!',
          'Highly recommended!',
          'The service exceeded my expectations.',
          'Exceptional service!',
          'Best experience ever!'
        ];
      default:
        return [];
    }
  }
}
