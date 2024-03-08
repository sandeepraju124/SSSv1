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
  bool _showOtherReviewField = false;
  List<String> _selectedSuggestions = []; // initially empty
  List<bool> _isSelected = [];
  final Set<String> _selectedReviews =
      {}; // Use Set to allow multiple selections
  final Set<String> _removedReviews = {}; // Keep track of removed reviews

  bool _showSuggestedReviews = true;

  @override
  void initState() {
    super.initState();
    _reviewController.text = widget.currentReview;
    _currentRating = widget.currentRating;
    _selectedSuggestions = _getSuggestionsForRating(_currentRating);

    // Initialize _selectedReviews with the current review if it's not empty
    // Initialize _selectedReviews with the current review if it's not empty
    if (widget.currentReview.isNotEmpty) {
      _selectedReviews.add(widget.currentReview);
    }
  }

  // Add the _getColorForRating method here
  Color? _getColorForRating(int rating) {
    switch (rating) {
      case 1:
        return Color.fromARGB(255, 189, 37, 37);
      case 2:
        return Colors.red[600]; // Light red color
      case 3:
        return Colors.yellow[900];
      case 4:
        return Colors
            .teal[600]; // Assuming tgLightPrimaryColor is defined elsewhere
      case 5:
        return tgDarkPrimaryColor; // Assuming tgDarkPrimaryColor is defined elsewhere
      default:
        return Colors.grey; // Default color if rating is not within 1-5
    }
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
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: tgDarkPrimaryColor))),
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
            ),
            SizedBox(height: 4),
            Row(
              children: List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentRating = index + 1;
                      _selectedSuggestions =
                          _getSuggestionsForRating(_currentRating);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8),
                    child: Container(
                      width: 32.4,
                      height: 23,
                      decoration: BoxDecoration(
                        color: index < _currentRating
                            ? _getColorForRating(_currentRating)
                            : Colors.white, // Update color based on rating
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: Colors.black45, width: 0.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(width: 3),
                          Icon(
                            Icons.star,
                            color: index < _currentRating
                                ? Colors.amberAccent[700]
                                // ? Colors.blueGrey[900]
                                : Colors
                                    .grey, // Update star color based on rating
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),

            DropdownButton<bool>(
              value: _showSuggestedReviews,
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (bool? newValue) {
                setState(() {
                  _showSuggestedReviews = newValue ?? false;
                });
              },
              items:
                  <bool>[true, false].map<DropdownMenuItem<bool>>((bool value) {
                return DropdownMenuItem<bool>(
                  value: value,
                  child: Text(
                    value ? 'Show Suggestions' : 'Hide Suggestions',
                    style: TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
            ),

            _showSuggestedReviews
                ? Wrap(
                    children: _selectedSuggestions.asMap().entries.map((entry) {
                      int index = entry.key;
                      String review = entry.value;
                      return _buildSuggestedReview(review, index);
                    }).toList(),
                  )
                : Container(), // Empty container when not showing

            // Wrap(
            //   children: _selectedSuggestions.asMap().entries.map((entry) {
            //     int index = entry.key;
            //     String review = entry.value;
            //     return _buildSuggestedReview(review, index);
            //   }).toList(),
            // ),
            SizedBox(height: 10),
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
                        newReview: _reviewController.text)
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

  // Widget _buildSuggestedReview(String review, int index) {
  //   // Determine if the review is the one being edited
  //   bool isCurrentReview = widget.currentReview.trim() == review.trim();

  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         if (_selectedReviews.contains(review)) {
  //           // If the review is already selected, remove it from the list
  //           _selectedReviews.remove(review);
  //         } else {
  //           // Otherwise, add it to the list
  //           _selectedReviews.add(review);
  //         }
  //         // Update the TextField with the selected reviews
  //         _reviewController.text = _selectedReviews.join('\n');
  //       });
  //     },
  //     child: Container(
  //       padding: EdgeInsets.all(8.0),
  //       margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
  //       decoration: BoxDecoration(
  //         // color: _isSelected[index] ? tgLightPrimaryColor : Colors.white,
  //         // border: Border.all(
  //         //   color: _isSelected[index] ? tgDarkPrimaryColor : Colors.grey,
  //         color: _selectedReviews.contains(review)
  //             ? tgLightPrimaryColor
  //             : Colors.white,
  //         border: Border.all(
  //           color: _selectedReviews.contains(review)
  //               ? tgDarkPrimaryColor
  //               : Colors.grey,
  //           width: 0.4,
  //         ),
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       child: Text(
  //         review,
  //         style: TextStyle(
  //           color: Colors.black87,
  //           fontSize: 13,
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Widget _buildSuggestedReview(String review, int index) {
    bool isSelected = _selectedReviews.contains(review);
    bool isRemoved = _removedReviews.contains(review);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedReviews.remove(review);
          } else {
            _selectedReviews.add(review);
          }
          _reviewController.text = _selectedReviews.join('\n');
        });
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        decoration: BoxDecoration(
          color: isSelected
              ? tgLightPrimaryColor
              : isRemoved
                  ? Colors.grey
                  : Colors.white,
          border: Border.all(
            color: isSelected
                ? tgDarkPrimaryColor
                : isRemoved
                    ? Colors.grey
                    : Colors.grey,
            width: 0.4,
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
