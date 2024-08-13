import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Reviews%20Section/showall_reviews_test.dart';

import '../providers/business_profile_provider.dart';
import '../providers/comments_provider_new.dart';
import '../utils/constants.dart';
import 'displayreviewbottomsheet.dart';

class FewReviews extends StatelessWidget {
  final bool _showAllReviews = false;

  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<NearbyCommentProvider>(context);
    final data = Provider.of<CommentSectionProviderNew>(context);
    var data1 = Provider.of<BusinessProfileProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Few Reviews',
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
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
                    // RatingBar.builder(
                    //   initialRating: data.averageRating ?? 0,
                    //   minRating: 1,
                    //   direction: Axis.horizontal,
                    //   allowHalfRating: true,
                    //   itemCount: 5,
                    //   itemPadding: EdgeInsets.symmetric(horizontal: 0.1),
                    //   itemSize: 11,
                    //   itemBuilder: (context, _) => Icon(
                    //     Icons.star,
                    //     color: Colors.amber[700],
                    //   ),
                    //   onRatingUpdate: (rating) {
                    //     print(rating);
                    //   },
                    // ),
                    SizedBox(width: 5),
                    Text(
                      "(",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "4.5",
                      // data.averageRating?.toStringAsFixed(1) ?? "0.0",
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
                                    businessUid: data1.businessProfileData?.businessUid ??
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
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            // itemCount: data.comments.length,
            itemCount: data.comments.length > 2 ? 2 : data.comments.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                margin: EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: data.comments[index].profileImageUrl == null?
                            NetworkImage('https://via.placeholder.com/30'):
                            NetworkImage(data.comments[index].profileImageUrl),
                          ),
                          SizedBox(width: 8),
                          // Text('User ${index + 1}'),
                          Text(data.comments[index].userName),
                          Spacer(),
                          Text('2d ago'),
                        ],
                      ),
                      SizedBox(height: 8),

                      Text(
                        data.comments[index].comment,
                        //     'Great place! The food was amazing and the service was excellent.'
                      ),
                      SizedBox(height: 8),
                      // Row(
                      //   children: [
                      //     Icon(Icons.star, size: 16, color: Colors.amber),
                      //     Icon(Icons.star, size: 16, color: Colors.amber),
                      //     Icon(Icons.star, size: 16, color: Colors.amber),
                      //     Icon(Icons.star, size: 16, color: Colors.amber),
                      //     Icon(Icons.star_half, size: 16, color: Colors.amber),
                      //     SizedBox(width: 8),
                      //     Text('Restaurant Name'),
                      //   ],
                      // ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: double.parse(data.comments[index].rating.toString()),
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 11,
                            direction: Axis.horizontal,
                          ),
                          SizedBox(width: 8),
                          Text('Restaurant Name'),
                        ],
                      ),

                      // RatingBarIndicator(
                      //   rating: double.parse(data.comments[index].rating.toString()),
                      //   itemBuilder: (context, index) => Icon(
                      //     Icons.star,
                      //     color: Colors.amber,
                      //   ),
                      //   itemCount: 5,
                      //   itemSize: 11,
                      //   direction: Axis.horizontal,
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 8,),
          if (data.comments != null &&
              data.comments.length > 2 &&
              !_showAllReviews)
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ShowallComments();
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
                          : "Show ${data.comments.length - 2} more reviews",
                      style: TextStyle(color: secondaryColor80LightTheme),
                    ),
                  ),
                ),
              ),
            ),
        ],
        // child:
      ),
    );
  }
}
