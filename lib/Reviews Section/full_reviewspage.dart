// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sssv1/Reviews%20Section/displayreviewbottomsheet.dart';
import 'package:sssv1/Reviews%20Section/postcomment.dart';
import 'package:sssv1/Reviews%20Section/updatereviewbottomsheet.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:provider/provider.dart';

import "package:intl/intl.dart";

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class showallreviewspage extends StatefulWidget {
  const showallreviewspage({super.key});

  @override
  State<showallreviewspage> createState() => _showallreviewspageState();
}

class _showallreviewspageState extends State<showallreviewspage> {
  //// stars ////
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
                    // color: Colors.amber[700],
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
    var data1 = Provider.of<BusinessProfileProvider>(context);
    final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
        GlobalKey<ScaffoldMessengerState>();

    return Scaffold(
      key: scaffoldMessengerKey,
      appBar: AppBar(
        backgroundColor: tgPrimaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              LineAwesomeIcons.angle_left,
              color: Colors.black,
            )),
        title: Text(
          "Reviews",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
      ),
      body: RefreshIndicator(
        color: tgDarkPrimaryColor,
        onRefresh: () async {
          await data
              .commentSectionProvider(data1.businessProfileData!.businessUid);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: GestureDetector(
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
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
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
                                              .businessProfileData!.businessUid,
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
                  child: Container(
                    height: 38,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(width: 0.7),
                        color: tgPrimaryColor),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Row(
                        children: [
                          Text("Write your Review"),
                          SizedBox(width: 100),
                          Icon(
                            LineAwesomeIcons.angle_right,
                            size: 17,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              data.isLoading
                  ? Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Center(
                          child:
                              CircularProgressIndicator(color: tgPrimaryColor)),
                    )
                  : data.getCommentsData!.reviews.isEmpty == true
                      ? Center(
                          child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              Text("be the first one to ask",
                                  style: TextStyle(color: Colors.grey)),
                              Image.asset(
                                height: 200,
                                "images/empty.gif",
                              ),
                            ],
                          ),
                        ))
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // itemCount: data.getCommentsData!.reviews.length,
                          itemCount:
                              data.getCommentsData!.reversedReviews.length,

                          // itemCount: _showAllReviews
                          //     ? data.getCommentsData!.reviews.length
                          //     : (data.getCommentsData!.reviews.length > 2j
                          //         ? 2
                          //         : data.getCommentsData!.reviews.length),
                          itemBuilder: (BuildContext context, int index) {
                            var review =
                                data.getCommentsData!.reversedReviews[index];

                            // String stars(rating) {
                            //   return List<String>.generate(
                            //       rating, (index) => '⭐').join();
                            // }

                            return InkWell(
                              onLongPress: () {
                                // Assuming 'currentUserId' is the ID of the current user
                                // and 'review.userId' contains the ID of the user who posted the comment
                                // You need to define or fetch 'currentUserId' from your user management system
                                final Currentuser =
                                    FirebaseAuth.instance.currentUser?.uid;
                                // String? userid;

                                ////// below edit & delete options only being dispalyed if authorized Userid matches ///////

                                if (Currentuser != null &&
                                    Currentuser == review.userId) {
                                  showModalBottomSheet(
                                    backgroundColor: tgLightPrimaryColor,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Wrap(
                                        children: <Widget>[
                                          ListTile(
                                            leading: Icon(
                                              Icons.edit,
                                              size: 20.5,
                                            ),
                                            title: Text(
                                              'Edit',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            onTap: () {
                                              Navigator.pop(context);
                                              showModalBottomSheet(
                                                context: context,
                                                elevation: 6,
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                builder:
                                                    (BuildContext context) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom,
                                                    ),
                                                    // child: UpdatecommentPage(
                                                    //   businessUid: data1
                                                    //       .businessProfileData!
                                                    //       .businessUid,
                                                    //   reviewId: review.reviewId
                                                    //       .toString(),
                                                    //   userId: review.userId,
                                                    //   currentReview:
                                                    //       review.comment,
                                                    //   currentRating:
                                                    //       review.rating,
                                                    // ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(
                                              Icons.delete,
                                              size: 20.3,
                                            ),
                                            title: Text(
                                              'Delete',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            onTap: () {
                                              // Close the bottom sheet first
                                              Navigator.pop(context); //
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                      'Confirm Deletion',
                                                      style: TextStyle(
                                                          color:
                                                              tgDarkPrimaryColor),
                                                    ),
                                                    content: Text(
                                                        'Are you sure you want to delete this comment?'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                              color:
                                                                  tgDarkPrimaryColor),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(); // Dismiss the dialog but do nothing
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Text(
                                                          'Delete',
                                                          style: TextStyle(
                                                              color:
                                                                  tgDarkPrimaryColor),
                                                        ),
                                                        onPressed: () {
                                                          data
                                                              .deleteCommentProvider(
                                                                  context:
                                                                      context,
                                                                  business_uid: data1
                                                                      .businessProfileData!
                                                                      .businessUid,
                                                                  review_id: review
                                                                      .reviewId
                                                                      .toString(),
                                                                  user_id: review
                                                                      .userId)
                                                              .then(
                                                                  (success) => {
                                                                        if (success)
                                                                          {
                                                                            scaffoldMessengerKey.currentState?.showSnackBar(
                                                                              SnackBar(
                                                                                content: Text('Review deleted successfully'),
                                                                                behavior: SnackBarBehavior.floating,
                                                                              ),
                                                                            ),
                                                                            // Navigator.pop(context) // Close the dialog
                                                                          }
                                                                        else
                                                                          {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text('Failed to delete comment'),
                                                                                behavior: SnackBarBehavior.floating,
                                                                              ),
                                                                            )
                                                                          }
                                                                      });
                                                          Navigator.of(context)
                                                              .pop(); // Dismiss the dialog after attempting to delete
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Oops! This review can only be edited or removed by its original poster.",
                                        style: TextStyle(fontSize: 12.5),
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                }
                              },
                              child: Container(
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
                                  leading: Text('${index + 1}. ',
                                      style: TextStyle(fontSize: 9)),
                                  title: Text(
                                    review.comment,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        wordSpacing: 0.5,
                                        letterSpacing: -0.1,
                                        color: secondaryColor60LightTheme),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          // Text(
                                          //   "Rated: ",
                                          //   style: TextStyle(fontSize: 12.0),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2),
                                            child: stars(review.rating),
                                          ),
                                        ],
                                      ),
                                      // Text(
                                      //   "Posted by: ${review.username}\nDate: ${formatDateTime(review.createdAt)}",
                                      //   style: TextStyle(fontSize: 12.0),
                                      // ),

                                      // review.updatedAt != null
                                      //     ? Text(
                                      //         "Updated on: ${formatDateTime(review.updatedAt!)}",
                                      //         style: TextStyle(fontSize: 12.0),
                                      //       )
                                      //     : Container(),
                                      Text(
                                        review.updatedAt != null
                                            ? "Posted by: ${review.username}\nLast Updated on: ${formatDateTime(review.updatedAt!)}"
                                            : "Posted by: ${review.username}\nDate: ${formatDateTime(review.createdAt)}",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
            ],
          ),
        ),
      ),
    );
  }
}
