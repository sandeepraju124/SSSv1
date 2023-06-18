// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/providers/user_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CommentPostPage extends StatefulWidget {
  String uid;
  CommentPostPage({super.key, required this.uid});

  @override
  State<CommentPostPage> createState() => _CommentPostPageState();
}

final _commentcontroller = TextEditingController();

class _CommentPostPageState extends State<CommentPostPage> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CommentSectionProvider>(context);
    // var userdata = Provider.of<UserProvider>(context, listen: false);
    // var userpro = Provider.of<UserProvider>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser;
    final useruid = user?.uid;

    //// here we've used the stack class to provide the TOP line of the Bottom sheet /////////////////

    return Stack(

        //////// this is for the line on top of Bottom sheet ////////////
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: -15,
              child: Container(
                width: 60,
                height: 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: tgLightPrimaryColor,
                ),
              )),

          ///// Text on top of COMMENT TEXTfield///////////////
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Text(
                  'Add Your Valuable Review Here',
                  style: TextStyle(fontSize: 23, color: tgPrimaryText),
                ),
                SizedBox(height: 30),

                //////////////// comment section starts here ////////////////
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  width: double.infinity,
                  // height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // color: Colors.white,
                    border: Border.all(color: tgPrimaryColor, width: 3),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 70,
                        child: TextField(
                          maxLines: null,
                          controller: _commentcontroller,
                          decoration: InputDecoration(
                            hintText: 'Enter your review',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 30,
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                            onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: tgPrimaryColor,
                                backgroundColor: secondaryColor10LightTheme,
                              ),
                              // onPressed: () async {
                              //   final success = await data.postCommentProvider(
                              //         business_uid: data.getCommentsData!.businessUid.toString(),
                              //         user_id: useruid!,
                              //         review: _commentcontroller.text,
                              //         // rating: rating,
                              //         );
                              //   if (success) {
                              //     _commentcontroller.clear();
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(
                              //           content: Text(
                              //               'Comment posted successfully')),
                              //     );
                              //   }else{
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(content: Text("Error posting comment"))
                              //     );
                              //   }
                              // },
                              child: Text(
                                'Comment',
                                style: TextStyle(color: tgPrimaryText),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 700,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.getCommentsData?.reviews.length,
                        itemBuilder: (BuildContext contex, int int) {
                          return Container(
                            // height: 100,
                            width: double.infinity,
                            margin: EdgeInsets.all(9),
                            // color: secondaryColor10LightTheme,
                            decoration: BoxDecoration(
                                color: secondaryColor10LightTheme,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                height: 65,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(color: tgPrimaryColor)),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1985&q=80',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 9, bottom: 9),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(12),

                                    alignment: Alignment.centerLeft,

                                    // height: double.infinity,
                                    // width: double.infinity,

                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: data.getCommentsData?.reviews[int].username,
                                          // data.getCommentsData
                                          //     ?.comments[int].username,
                                              
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                        text: ": ",
                                      ),
                                      TextSpan(
                                          text: data.getCommentsData
                                              ?.reviews[int].comment,
                                          style: TextStyle(color: Colors.grey))
                                    ])),
                                  ),
                                ),
                              ),
                            ]),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ]);
  }
}
