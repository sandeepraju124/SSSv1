// // ignore: duplicate_ignore
// // ignore: duplicate_ignore
// // ignore: duplicate_ignore
// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'dart:core';

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

import "package:intl/intl.dart";

import "package:lottie/lottie.dart";

import '../providers/comments_provider_new.dart';

class NewShowRewviewPage extends StatefulWidget {
  const NewShowRewviewPage({super.key});

  @override
  State<NewShowRewviewPage> createState() => _NewShowRewviewPageState();
}

class _NewShowRewviewPageState extends State<NewShowRewviewPage> {
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
                      border: Border.all(color: Colors.black, width: 0.3)),
                  child: Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              )),
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
    var datanew = Provider.of<CommentSectionProviderNew>(context);
    var data1 = Provider.of<BusinessProfileProvider>(context);

    return Material(
        color: Colors.white70,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Reviews",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                        width:
                            10), // Add some space between the text and the rating bar
                    Expanded(
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating: data.averageRating ?? 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.1),
                            itemSize: 11,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber[700],
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(width: 5),
                          Text(
                            "(",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            data.averageRating?.toStringAsFixed(1) ?? "0.0",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            ")",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 320),
                  height: 3,
                  width: 70,
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: tgPrimaryColor))),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                elevation: 6,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return Builder(
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: secondaryColor20LightTheme,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    businessUid: data1
                                            .businessProfileData?.businessUid ??
                                        "",
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
              );
            },
            child: Column(
              children: [
                RetangularBorderBox("Share your insights and help others!")
              ],
            ),
          ),
          datanew.isLoading
          // data.isLoading
              ? Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Center(
                      child: CircularProgressIndicator(color: tgPrimaryColor)),
                )
              // : data.getCommentsData?.reviews.isEmpty == true
              : datanew.comments.isEmpty
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Lottie.asset("images/reviews.json", height: 210),
                          Text(
                            "Your opinion matters.\nPlease consider being the first to share your review",
                            style: TextStyle(
                                color: secondaryColor20LightTheme,
                                fontSize: 10.8),
                          ),
                        ],
                      ),
                    ))
                  :
          ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // itemCount: data.getCommentsData?.reviews.length ?? 0,
                      itemCount:  datanew.comments.length > 2 ? 2 : datanew.comments.length,
                      itemBuilder: (BuildContext context, int index) {
                        // if (data.getCommentsData == null ||
                        //     data.getCommentsData!.reviews.isEmpty) {
                        //   return SizedBox
                        //       .shrink(); // Return an empty widget if there's no data
                        // }

                        // if (!_showAllReviews && index >= 2) {
                        //   return SizedBox
                        //       .shrink(); // Hide reviews beyond the first two if not showing all
                        // }

                        // var review = data.getCommentsData!.reviews[index];
                        var review = datanew.comments[index];

                        return Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(top: 2, bottom: 8),
                              child: Text(
                                review.comment,
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    wordSpacing: 0.5,
                                    letterSpacing: -0.1,
                                    color: secondaryColor60LightTheme),
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    stars(review.rating),
                                  ],
                                ),
                                Text(
                                  // "Posted by: ${review.userName}\nDate: ${formatDateTime(review.createdAt)}",
                                  "Posted by: ${review.userName}",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),


          SizedBox(height: 50),
          if (data.getCommentsData?.reviews != null &&
              data.getCommentsData!.reviews.length > 2 &&
              !_showAllReviews)
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return showallreviewspage();
                }));
              },
              child: Container(
                height: 36,
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(width: 0.6),
                    color: tgPrimaryColor),
                child: SizedBox(
                  width: 340,
                  height: 36,
                  child: Center(
                    child: Text(
                      _showAllReviews
                          ? "All reviews are shown"
                          : "Show ${data.getCommentsData!.reviews.length - 2} more reviews",
                      style: TextStyle(color: secondaryColor80LightTheme),
                    ),
                  ),
                ),
              ),
            ),
        ]));
  }
}
