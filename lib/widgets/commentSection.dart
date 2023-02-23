import 'dart:convert';

import "package:flutter/material.dart";
import 'package:sssv1/models/comments_model.dart';
import 'package:http/http.dart' as http;
import 'package:sssv1/models/user_models.dart';

class CommentSection extends StatelessWidget {
  final String id; ////63f11685190416d07f3687e7 //Elite Estates

  CommentSection({required this.id});

  Future<CommentModel> fetchRestaurant(id) async {
    print("fetched id: $id");
    
    final response = await http
        .get(Uri.parse('https://bitebest.azurewebsites.net/rescommentid/$id'));
    // final response = await http
    //     .get(Uri.parse('https://bitebest.azurewebsites.net/rescommentid/63f77d78ae4cd20951914205'));
    if (response.statusCode == 200) {
      return CommentModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch restaurant a ');
    }
  }

  Future<UserModel> fetchUser(String userId) async {
    final response = await http
        .get(Uri.parse('https://bitebest.azurewebsites.net/user/$userId'));
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<CommentModel>(
        future: fetchRestaurant(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            CommentModel commentData = snapshot.data!;
            return Material(
              child: ListView.builder(
                itemCount: commentData.comments.length,
                itemBuilder: (context, index) {
                  return FutureBuilder<UserModel>(
                    future: fetchUser(commentData.comments[index].userId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        UserModel UserData = snapshot.data!;
                        return Container(
                          height: 200,
                          color: Colors.white,
                          child: Column(children: [
                            Container(
                                height: 60,
                                // color: Colors.white,
                                child: Row(
                                  children: [
                                    //Column1 Row1
                                    Expanded(
                                      flex: 30,
                                      child: Container(
                                        child: Column(children: [
                                          CircleAvatar(
                                              radius: 22,
                                              backgroundImage:
                                                  // AssetImage("images/modell.jpeg")
                                              NetworkImage(UserData.dp)
                                              ),
                                          // Gap(2),
                                          Text(UserData.name,
                                            // 'Sandeep Raju',
                                              // user.data[0].username.toString(),
                                              style: TextStyle(fontSize: 12)),
                                        ]),
                                        // color: Colors.green,
                                      ),
                                    ),
                                    //Column1 Row2
                                    Expanded(
                                        flex: 40,
                                        child: Container(
                                          // color: Colors.amber[400],
                                          child: Column(children: [
                                            Expanded(
                                                child: Container(
                                              // color: Colors.deepPurpleAccent,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(Icons.star_rate_rounded),
                                                  Icon(Icons.star_rate_rounded),
                                                  Icon(Icons.star_rate_rounded),
                                                  Icon(Icons.star_rate_rounded),
                                                  // Icon(Icons.star_rate_rounded),
                                                ],
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              color: Colors.purple,
                                            ))
                                          ]),
                                        )),
                                    // Column1 Row3
                                    Expanded(
                                        flex: 30,
                                        child: Container(
                                            // margin: EdgeInsets.all(5),
                                            // color: Colors.amber[700],
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.all(3),
                                                  child: const Icon(
                                                    Icons.swipe_up_rounded,
                                                  ),
                                                ),
                                                const Text(
                                                  "Uplift",
                                                  style: TextStyle(fontSize: 8),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    margin:
                                                        const EdgeInsets.all(3),
                                                    child: Icon(Icons
                                                        .swipe_down_rounded)),
                                                const Text("Downlift",
                                                    style:
                                                        TextStyle(fontSize: 8)),
                                              ],
                                            ),
                                          ],
                                        )))
                                  ],
                                )),
                            // column 2
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.all(10),
                                  child:
                                      Text(
                                        commentData.comments[index].comment,
                                    // "this is text",
                                    style: TextStyle(color: Colors.black54),
                                  )),
                            ),
                            // Column 3
                            Expanded(
                                child: Container(
                              // color: Colors.lightGreenAccent,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 1,
                                  itemBuilder: (BuildContext, int) => Text("skip")
                                  // images(),
                                  ),
                            )),
                          ]),
                        );
                        // future referance
                        // ListTile(
                        //   title: Text(data2.name),
                        //   subtitle: Text(data2.username),
                        //   trailing: Text(comment.comments[index].comment),
                        // );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      );

  }
}
