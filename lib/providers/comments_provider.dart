import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sssv1/models/commentsection_models.dart';
import 'package:sssv1/network_calling/http.dart';
import "package:http/http.dart" as http;

class CommentSectionProvider extends ChangeNotifier {
  CommentSectionModels? _comments;
  bool _isLoading = false;

  CommentSectionModels? get getCommentsData => _comments;
  bool get isLoading => _isLoading;

  Future<void> commentSectionProvider(uid) async {
    _isLoading = true;
    CommentSectionModels commentsection = await Http().fetchComments("https://zukhov.azurewebsites.net/commentsuid/$uid");
    _comments = commentsection;
    _isLoading = false;
    notifyListeners();
  }


Future<bool> postCommentProvider({
  required String business_uid,
  required String user_id,
  required String review,
}) async {
  try {
    print("post comment");
    _isLoading = true;

    final body = {
      'business_uid': business_uid,
      'review': review,
      'user_id': user_id,
    };
    print(body);

    final url = Uri.parse("https://zukhov.azurewebsites.net/postcomment");
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Data posted successfully');
      notifyListeners();
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