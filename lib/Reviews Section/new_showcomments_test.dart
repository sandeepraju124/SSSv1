import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Reviews%20Section/displayreviewbottomsheet.dart';
import 'package:sssv1/Reviews%20Section/full_reviewspage.dart';
import 'package:sssv1/Reviews%20Section/postcomment.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class NewShowRewviewPageTest extends StatefulWidget {
  const NewShowRewviewPageTest({super.key});

  @override
  State<NewShowRewviewPageTest> createState() => _NewShowRewviewPageTestState();
}

class _NewShowRewviewPageTestState extends State<NewShowRewviewPageTest> {
  final bool _showAllReviews = false;

  Widget stars(int rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        rating,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 4, bottom: 7, top: 10),
          child: Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
              color: tgDarkPrimaryColor,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.black, width: 0.3),
            ),
            child: const Icon(
              Icons.star,
              color: Colors.white,
              size: 12,
            ),
          ),
        ),
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    final DateTime localDateTime = dateTime.toLocal();
    final DateFormat dateFormatter = DateFormat('dd-MM-yyyy (EEE)', 'en_US');
    final DateFormat timeFormatter = DateFormat('h:mm a', 'en_US');
    return '${dateFormatter.format(localDateTime)} at ${timeFormatter.format(localDateTime)}';
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CommentSectionProvider>(context);
    var data1 = Provider.of<BusinessProfileProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, data),
            const SizedBox(height: 8),
            _buildShareExperienceButton(context, data1),
            const SizedBox(height: 16),
            data.isLoading ? _buildLoadingIndicator() : _buildReviewList(data),
            if (data.getCommentsData?.reviews != null &&
                data.getCommentsData!.reviews.length > 2 &&
                !_showAllReviews)
              _buildShowMoreButton(context, data),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, CommentSectionProvider data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Reviews",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                children: [
                  RatingBar.builder(
                    initialRating: data.averageRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.1),
                    itemSize: 20,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      // color: Colors.amber,
                      color: Colors.teal,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "(${data.averageRating.toStringAsFixed(1)})",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          height: 2,
          width: 70,
          color: tgPrimaryColor,
        ),
      ],
    );
  }

  Widget _buildShareExperienceButton(
      BuildContext context, BusinessProfileProvider data1) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          elevation: 6,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: secondaryColor20LightTheme,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Share Your Experience",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: DisplayReviewBottomSheet(
                          businessUid: data1.businessProfileData!.businessUid,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: tgPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Share your insights and help others!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: tgPrimaryColor,
      ),
    );
  }

  Widget _buildReviewList(CommentSectionProvider data) {
    if (data.getCommentsData?.reviews.isEmpty == true) {
      return Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Lottie.asset("images/reviews.json", height: 210),
            const Text(
              "Your opinion matters.\nPlease consider being the first to share your review",
              style: TextStyle(
                color: secondaryColor20LightTheme,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _showAllReviews
          ? data.getCommentsData!.reviews.length
          : (data.getCommentsData!.reviews.length > 2
              ? 2
              : data.getCommentsData!.reviews.length),
      itemBuilder: (BuildContext context, int index) {
        var review = data.getCommentsData!.reviews[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                review.comment,
                style: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: secondaryColor60LightTheme,
                ),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                stars(review.rating),
                const SizedBox(height: 4),
                Text(
                  "Posted by: ${review.username}\nDate: ${formatDateTime(review.createdAt)}",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildShowMoreButton(BuildContext context, CommentSectionProvider data) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return FullReviewsPage();
        // }));
      },
      child: Container(
        height: 36,
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: tgPrimaryColor, width: 0.6),
          color: tgPrimaryColor,
        ),
        child: Center(
          child: Text(
            _showAllReviews
                ? "All reviews are shown"
                : "Show ${data.getCommentsData!.reviews.length - 2} more reviews",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
