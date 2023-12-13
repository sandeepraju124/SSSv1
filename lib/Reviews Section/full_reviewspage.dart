// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sssv1/Reviews%20Section/postcomment.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:provider/provider.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class showallreviewspage extends StatefulWidget {
  const showallreviewspage({super.key});

  @override
  State<showallreviewspage> createState() => _showallreviewspageState();
}

class _showallreviewspageState extends State<showallreviewspage> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CommentSectionProvider>(context);
    var data1 = Provider.of<BusinessProfileProvider>(context);

    return Scaffold(
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PostComment(
                          businessUid: data1.businessProfileData!.businessUid);
                    }));
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

                            String stars(rating) {
                              return List<String>.generate(
                                  rating, (index) => '⭐').join();
                            }

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
                                subtitle: Text(
                                  'Rating: ${stars(review.rating)}\nPosted by: ${review.userId} on ${review.createdAt}',
                                  style: TextStyle(fontSize: 12.0),
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
