// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:provider/provider.dart';

class ReviewRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CommentSectionProvider>(context);
    
    // overall rating
    int? totalRatings = data.getCommentsData?.ratingCount.values.reduce((a, b) => a + b);

// Initialize starRatings to 0 if they are null
int? fiveStarRatings = data.getCommentsData?.ratingCount["5"] ?? 0;
int? fourStarRatings = data.getCommentsData?.ratingCount["4"] ?? 0;
int? threeStarRatings = data.getCommentsData?.ratingCount["3"] ?? 0;
int? twoStarRatings = data.getCommentsData?.ratingCount["2"] ?? 0;
int? oneStarRatings = data.getCommentsData?.ratingCount["1"] ?? 0;

// Calculate progressPercentage, assign 0 if totalRatings is 0 or all starRatings are 0
double progressPercentagefive = totalRatings != 0 ? fiveStarRatings/ totalRatings! : 0;
double progressPercentagefour = totalRatings != 0 ? fourStarRatings / totalRatings! : 0;
double progressPercentagethree = totalRatings != 0 ? threeStarRatings / totalRatings! : 0;
double progressPercentagetwo = totalRatings != 0 ? twoStarRatings / totalRatings! : 0;
double progressPercentageone = totalRatings != 0 ? oneStarRatings / totalRatings! : 0;


    // ratingCount["5"] ?? 0;

    // double progressPercentage = currentProgress / totalProgress;
    // print(progressPercentage);

    return Container(
        height: 135,
        // color: Color.fromRGBO(255, 215, 64, 1),
        child: Row(children: [
    Expanded(
        flex: 65,
        // Bars side
        child: Container(
          // color: Colors.blueGrey,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                // color: Colors.limeAccent,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("5"),
                      Container(
                        height: 10,
                        width: 200,
                        // color: Colors.red,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.teal),
                            minHeight: 10,
                            value: progressPercentagefive,
                          ),
                        ),
                      ),
                    ]),
              )),
              Expanded(
                  child: Container(
                // color: Colors.pink,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("4"),
                      Container(
                        height: 10,
                        width: 200,
                        // color: Colors.red,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.teal),
                            minHeight: 10,
                            value: progressPercentagefour,
                          ),
                        ),
                      ),
                    ]),
              )),
              Expanded(
                  child: Container(
                // color: Colors.deepPurple,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("3"),
                      Container(
                        height: 10,
                        width: 200,
                        // color: Colors.red,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.teal),
                            minHeight: 10,
                            value: progressPercentagethree,
                          ),
                        ),
                      ),
                    ]),
              )),
              Expanded(
                  child: Container(
                // color: Colors.lightGreen,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("2"),
                      Container(
                        height: 10,
                        width: 200,
                        // color: Colors.red,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.teal),
                            minHeight: 10,
                            value: progressPercentagetwo,
                          ),
                        ),
                      ),
                    ]),
              )),
              Expanded(
                  child: Container(
                // color: Colors.purple,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("1"),
                      Container(
                        height: 10,
                        width: 200,
                        // color: Colors.red,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.teal),
                            minHeight: 10,
                            value: progressPercentageone,
                          ),
                        ),
                      ),
                    ]),
              )),
            ],
          ),
        )),
    // Text("jyg"),
    Container(
      width: 1,
      height: double.infinity,
      color: tgDividerColor, // Replace with your desired color
    ),

    // Rating side
    Expanded(
        flex: 35,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          // color: Colors.blueAccent,
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 60,
                  child: Container(
                    // color: Colors.deepPurple,
                    alignment: Alignment.center,
                    child: Text(data.getCommentsData!.overallRating.toString(), style: TextStyle(fontSize: 60)),
                  ),
                ),
                Expanded(
                  flex: 22,
                  child: Container(

                    alignment: Alignment.center,
                    // color: Colors.limeAccent,
                    // child: Text("4 star"),
                    child: Stars(noOfStars: 4,
                    ),
                  ),
                ),
                Expanded(
                  flex: 18,
                  child: Container(
                    // color: Colors.purple,
                    child: Text(data.getCommentsData!.reviews.length.toString()),
                  ),
                ),
              ]),
        )),
        ]),
      );

  }
}

class Stars extends StatelessWidget {
  int noOfStars;
  Stars({
    super.key, required this.noOfStars
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(noOfStars, (index) {
        return Icon(Icons.star, size: 17, color: tgDarkPrimaryColor);
      }),
    ); 
  }
}


