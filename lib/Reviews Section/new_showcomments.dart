// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Askcommunity%20Section/questions.dart';
import 'package:sssv1/Reviews%20Section/full_reviewspage.dart';
import 'package:sssv1/Reviews%20Section/postcomment.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class NewShowRewviewPage extends StatefulWidget {
  const NewShowRewviewPage({super.key});

  @override
  State<NewShowRewviewPage> createState() => _NewShowRewviewPageState();
}

class _NewShowRewviewPageState extends State<NewShowRewviewPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<CommentSectionProvider>(context, listen: false)
  //       .commentSectionProvider("PIZFOO4357128905678");
  // }

  bool _showAllReviews = false;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CommentSectionProvider>(context);
    var data1 = Provider.of<BusinessProfileProvider>(context);

    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(right: 277, top: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reviews",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            Container(
              // margin: EdgeInsets.only(left: 10, top: 1),
              height: 3,
              width: 70,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: tgPrimaryColor))),
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PostComment(
              businessUid: data1.businessProfileData!.businessUid,
            );
          }));
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 30,
                width: 360,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: secondaryColor40LightTheme,
                  ),
                  // color: tgPrimaryColor
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      Text(
                        "You wanna write your review?",
                        style: TextStyle(color: tgPrimaryText),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Icon(
                          LineAwesomeIcons.angle_right,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      data.isLoading
          ? Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Center(
                  child: CircularProgressIndicator(color: tgPrimaryColor)),
            )
          : data.getCommentsData?.reviews.isEmpty == true
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
                  itemCount: _showAllReviews
                      ? data.getCommentsData!.reviews.length
                      : (data.getCommentsData!.reviews.length > 2
                          ? 2
                          : data.getCommentsData!.reviews.length),
                  itemBuilder: (BuildContext context, int int) {
                    var review = data.getCommentsData!.reviews[int];
                    // return Column(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(
                    //           top: 15, bottom: 15, left: 12),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Container(
                    //             height: 22,
                    //             decoration: BoxDecoration(
                    //                 color: secondaryColor10LightTheme),
                    //             child: Text("R :${review.comment}"),
                    //           ),
                    //           SizedBox(
                    //             height: 30,
                    //           ),
                    //           Container(
                    //             decoration: BoxDecoration(
                    //                 border: Border(
                    //                     bottom: BorderSide(
                    //                         color:
                    //                             secondaryColor10LightTheme))),
                    //           ),
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // );

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
                        title: Text(
                          review.comment,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              wordSpacing: 0.7,
                              color: secondaryColor60LightTheme),
                        ),
                        subtitle: Text(
                          'Rating: ${review.rating}\nPosted by: ${review.userId} on ${review.createdAt}',
                          style: TextStyle(fontSize: 12.0),
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
                  style: TextStyle(color: secondaryColor60LightTheme),
                ),
              ),
            ),
          ),
        ),
    ]);
  }
}
