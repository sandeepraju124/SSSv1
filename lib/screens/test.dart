// this is onyl for testing 


import 'dart:convert';

import "package:flutter/material.dart";
import 'package:sssv1/models/comments_model.dart';
import 'package:http/http.dart' as http;
import 'package:sssv1/models/user_models.dart';
class RestaurantScreen extends StatelessWidget {
  // final String restaurantId;

  // RestaurantScreen({this.restaurantId});

  Future<CommentModel> fetchRestaurant() async {
    final response = await http.get(Uri.parse('https://bitebest.azurewebsites.net/rescommentid/63dfbdcf48dd5914791c2de4'));
    if (response.statusCode == 200) {
      return CommentModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch restaurant');
    }
  }


  Future<UserModel> fetchUser(String userId) async {
    final response = await http.get(Uri.parse('https://bitebest.azurewebsites.net/user/$userId'));
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real Estate'),
      ),
      body: FutureBuilder<CommentModel>(
        future: fetchRestaurant(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            CommentModel comment = snapshot.data!;
            return ListView.builder(
              itemCount: comment.comments.length,
              itemBuilder: (context, index) {
                return FutureBuilder<UserModel>(
                  future: fetchUser(comment.comments[index].userId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      UserModel data2 = snapshot.data!;
                      return ListTile(
                        title: Text(data2.name),
                        subtitle: Text(data2.username),
                        trailing: Text(comment.comments[index].comment),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}