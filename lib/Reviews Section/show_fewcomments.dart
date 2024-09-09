// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Reviews%20Section/showall_reviews_test.dart';

import '../providers/business_profile_provider.dart';
import '../providers/comments_provider_new.dart';
import '../utils/constants.dart';
import 'displayreviewbottomsheet.dart';

class FewReviews extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<NearbyCommentProvider>(context);
    final data = Provider.of<CommentSectionProviderNew>(context);
    var businessdata = Provider.of<BusinessProfileProvider>(context);
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
    //                 Text(
    //                   "(",
    //                   style: TextStyle(
    //                       fontSize: 16, fontWeight: FontWeight.w400),
    // ),
    Text(
    // "4.5",
    // businessdata.businessProfileData!.avgRating ?? "0.0",
     "${double.parse(businessdata.businessProfileData!.avgRating).toStringAsFixed(1)} . (${businessdata.businessProfileData!.totalReviews})",
    // data.averageRating?.toStringAsFixed(1) ?? "0.0",
    style: TextStyle(
    color: Colors.black87,
    fontSize: 13,
    fontWeight: FontWeight.w400),
    ),
                    // Text(
                    //   ")",
                    //   style: TextStyle(
                    //       fontSize: 16, fontWeight: FontWeight.w400),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 13),
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
                                    businessUid: businessdata.businessProfileData?.businessUid ??
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
                RetangularBorderBox("Share your insights and help others!",)
              ],
            ),
          ),
          SizedBox(height: 8),

          data.isLoading ?
            Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Center(
                      child: CircularProgressIndicator(color: tgPrimaryColor)),
                )
              : data.comments.isEmpty 
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
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            // itemCount: data.comments.length,
            itemCount: data.comments.length > 2 ? 2 : data.comments.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 1.3,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
  backgroundImage: data.comments[index].profileImageUrl != null && data.comments[index].profileImageUrl.isNotEmpty
      ? NetworkImage(data.comments[index].profileImageUrl)
      : NetworkImage('https://via.placeholder.com/30'),
),
SizedBox(width: 8),

                          // Text('User ${index + 1}'),
                          Text(data.comments[index].userName),
                          Spacer(),
                          Text(formatCreatedAt(data.comments[index].createdAt), style: TextStyle(color: Colors.grey, fontSize: 12),),
                        ],
                      ),
                      SizedBox(height: 8),

                      Text(
                        data.comments[index].comment,
                        style: TextStyle(
                          fontSize: 12.9 ,
                          fontWeight: FontWeight.w400,
                          color:secondaryColor60LightTheme
                        ),
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
                          stars(data.comments[index].rating),
                          SizedBox(width: 205),
                          // Text('Restaurant Name'),
                          // Text(data.comments[index].businessName, style: TextStyle(fontSize: 10, color: Colors.grey),),
                          // Text(data.comments[index]., style: TextStyle(fontSize: 10, color: Colors.grey),),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 27.5,
                  width: 340,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 0.6),
                      color: tgPrimaryColor),
                  child: SizedBox(
                    width: 340,
                    height: 10,
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
            ),
        ],
        // child:
      ),
    );
  }
}
