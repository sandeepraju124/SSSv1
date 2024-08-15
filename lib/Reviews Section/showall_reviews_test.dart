//
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:provider/provider.dart';
// import 'package:timeago/timeago.dart' as timeago;
//
// import '../providers/comments_provider_new.dart';
//
// class ShowallComments extends StatefulWidget {
//   @override
//   State<ShowallComments> createState() => _ShowallCommentsState();
// }
//
// class _ShowallCommentsState extends State<ShowallComments> {
//   @override
//   void initState() {
//     Provider.of<CommentSectionProviderNew>(context, listen: false)
//         .getComments("FOORESmqqwlT1J3v");
//     super.initState();
//   }
//
//   void _showOptionsDialog(BuildContext context, String commentId) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Comment Options"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: Icon(Icons.delete, color: Colors.red),
//                 title: Text("Delete"),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   _deleteComment(context, commentId);
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.flag, color: Colors.orange),
//                 title: Text("Report"),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   _reportComment(context, commentId);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _deleteComment(BuildContext context, String commentId) {
//     // Implement delete functionality here
//     // For example: Provider.of<CommentSectionProviderNew>(context, listen: false).deleteComment(commentId);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Comment deleted")),
//     );
//   }
//
//   void _reportComment(BuildContext context, String commentId) {
//     // Implement report functionality here
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Comment reported")),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final data = Provider.of<CommentSectionProviderNew>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Reviews', style: TextStyle(fontWeight: FontWeight.bold)),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.all(16),
//         itemCount: data.comments.length,
//         itemBuilder: (context, index) {
//           final comment = data.comments[index];
//           return Card(
//             elevation: 0,
//             margin: EdgeInsets.only(bottom: 16),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//               side: BorderSide(color: Colors.grey.shade200),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 20,
//                         backgroundImage: comment.profileImageUrl == null
//                             ? NetworkImage('https://via.placeholder.com/40')
//                             : NetworkImage(comment.profileImageUrl),
//                       ),
//                       SizedBox(width: 12),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               comment.userName,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               timeago.format(DateTime.now().subtract(Duration(days: 2))),
//                               style: TextStyle(color: Colors.grey, fontSize: 12),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(Icons.star, size: 16, color: Colors.white),
//                             SizedBox(width: 4),
//                             Text(
//                               comment.rating.toString(),
//                               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.more_vert),
//                         onPressed: () => _showOptionsDialog(context, comment.commentId.toString()),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12),
//                   Text(
//                     comment.comment,
//                     style: TextStyle(fontSize: 14, height: 1.4),
//                   ),
//                   SizedBox(height: 12),
//                   Row(
//                     children: [
//                       Icon(Icons.restaurant, size: 16, color: Colors.grey),
//                       // SizedField(width: 4),
//                       Text(
//                         'Restaurant Name',
//                         style: TextStyle(color: Colors.grey, fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/Reviews%20Section/updatereviewbottomsheet.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../providers/business_profile_provider.dart';
import '../providers/comments_provider_new.dart';
import '../utils/constants.dart';
import 'displayreviewbottomsheet.dart';

class ShowallComments extends StatefulWidget {
  @override
  State<ShowallComments> createState() => _ShowallCommentsState();
}

class _ShowallCommentsState extends State<ShowallComments> {
  @override
  void initState() {
    // Provider.of<CommentSectionProviderNew>(context, listen: false)
    //     .getComments("FOORESmqqwlT1J3v");
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CommentSectionProviderNew>(context);
    var data1 = Provider.of<BusinessProfileProvider>(context);
    final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: tgPrimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_rounded),
          onPressed: () {
            Navigator.pop(context);
            
          },
        ),
        title: Text('Reviews', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19)),
        elevation: 0,
        // backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: RefreshIndicator(
        color: tgDarkPrimaryColor,
        onRefresh: () async {
         await data.getComments("FOORESmqqwlT1J3v");
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
                                          children: const [
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
                    height: 34,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(width: 0.7),
                        color: tgPrimaryColor),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Row(
                        children: const [
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
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(16),
                itemCount: data.comments.length,
                itemBuilder: (context, index) {
                  final comment = data.comments[index];
                  return GestureDetector(
                    onLongPress: () {
                      print(data.comments[index].commentId.toString());
                      final Currentuser = FirebaseAuth.instance.currentUser?.uid;
                      final Commentuser = data.comments[index].userId;
                      // print(Currentuser);
                      // print(Commentuser);
                      // String? userid;

                      ////// below edit & delete options only being dispalyed if authorized Userid matches ///////

                      if (Currentuser != null &&
                          Currentuser == Commentuser) {
                        // print(Currentuser);
                        // print(Commentuser);
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
                                          child: 
                                          // Text("$Currentuser and $Commentuser")
                                          // UpdatecommentPage(
                                          //   businessUid: data1
                                          //       .businessProfileData!
                                          //       .businessUid,
                                          //   reviewId: review.reviewId
                                          //       .toString(),
                                          //   userId: review.userId,
                                          //   currentReview:
                                          //   review.comment,
                                          //   currentRating:
                                          //   review.rating,
                                          // ),

                                          UpdatecommentPage( businessUid: data1.businessProfileData!.businessUid,
                      commentId: data.comments[index].commentId.toString(),
                      userId: data.comments[index].userId,
                      currentReview: data.comments[index].comment,
                      currentRating: data.comments[index].rating,
                      ),
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
                                                data.deleteCommentProvider(context: context, commentId: data.comments[index].commentId.toString(), business_uid: data1.businessProfileData!.businessUid)
                                              
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
                    child: Card(
                      elevation: 0,
                      margin: EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey.shade200),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: comment.profileImageUrl == null
                                      ? NetworkImage('https://via.placeholder.com/40')
                                      : NetworkImage(comment.profileImageUrl),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        comment.userName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        timeago.format(DateTime.now().subtract(Duration(days: 2))),
                                        style: TextStyle(color: Colors.grey, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: tgDarkPrimaryColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.star, size: 14.3, color: Colors.white),
                                      SizedBox(width: 4),
                                      Text(
                                        comment.rating.toString(),
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              comment.comment,
                              style: TextStyle(fontSize: 14, height: 1.4),
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: const [
                                Icon(Icons.restaurant, size: 16, color: Colors.grey),
                                SizedBox(width: 4),
                                Text(
                                  'Restaurant Name',
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}