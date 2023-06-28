// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sssv1/models/commentsection_models.dart';
import 'package:sssv1/network_calling/http.dart';
import "package:http/http.dart" as http;
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/success_lottiejson.dart';

class CommentSectionProvider extends ChangeNotifier {
  CommentSectionModels? _comments;
  bool _isLoading = false;

  CommentSectionModels? get getCommentsData => _comments;
  bool get isLoading => _isLoading;

  Future<void> commentSectionProvider(uid) async {
    _isLoading = true;
    CommentSectionModels commentsection = await Http().fetchComments("$baseUrl/commentsuid/$uid");
    _comments = commentsection;
    _isLoading = false;
    notifyListeners();
  }


Future<bool> postCommentProvider({
  required BuildContext context,
  required int rating,
  required String business_uid,
  required String user_id,
  required String review,
}) async {
  try {
    // print("post comment");
    _isLoading = true;

    final body = {
      'rating': rating.toString(),
      'business_uid': business_uid,
      'review': review,
      'user_id': user_id,
    };
    print(body);

    final url = Uri.parse("$baseUrl/postcomment");
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    // final headers = {'Content-Type': 'application/json'};
    // final encodedBody = jsonEncode(body);

    final response = await http.post(url, headers: headers, body: body);
    


    if (response.statusCode == 200) {
      print('Data posted successfully');
      await commentSectionProvider(business_uid);

      // Navigate to the success screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => lottie()),
      );

      // Pop back to the previous screen after a delay (optional)
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
      }
      );

      // notifyListeners();

      return true;
    } else {
      print('Failed to post data. Status code: ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Error posting data: $e');
    return false;
  } finally {
    _isLoading = false;
    
  }
}

}