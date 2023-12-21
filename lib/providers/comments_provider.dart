// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_const_constructors, use_build_context_synchronously, unused_field

import 'package:flutter/material.dart';
import 'package:sssv1/models/commentsection_models.dart';
import 'package:sssv1/network_calling/http.dart';
import "package:http/http.dart" as http;
import 'package:sssv1/utils/constants.dart';

class CommentSectionProvider extends ChangeNotifier {
  final TextEditingController _reviewController = TextEditingController();
  CommentSectionModels? _comments;
  bool _isLoading = false;

  CommentSectionModels? get getCommentsData => _comments;
  bool get isLoading => _isLoading;

  Future<void> commentSectionProvider(uid) async {
    _isLoading = true;
    CommentSectionModels commentsection =
        await Http().fetchComments("$baseUrl/rescomments/$uid");
    _comments = commentsection;
    _isLoading = false;
    notifyListeners();
  }

  ///////////////////// Average calculating ///////////////////

  double get averageRating {
    if (_comments != null) {
      return calculateAverageRating(_comments!);
    } else {
      return 0.0; // or handle this case differently if you prefer
    }
  }

  double calculateAverageRating(CommentSectionModels comments) {
    if (comments.reviews.isEmpty) {
      return 0.0; // or return null, or throw an exception, etc...
    }

    int total = comments.reviews.fold(0, (sum, review) => sum + review.rating);
    return total / comments.reviews.length;
  }

  ////////////////////////////////////////// post comment below //////////////////////////

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
        print("comment posted successfully");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Your review posted Successfully"),
            behavior: SnackBarBehavior.floating,
          ),
        );

        await commentSectionProvider(business_uid);

        _isLoading = false;
        return true; //
      } else {
        // Handle error case
        print("Failed to post comment. Status code: ${response.statusCode}");
        print('Response body: ${response.body}');
        // You can handle errors here, e.g., showing an error message to the user.
      }
    } catch (e) {
      print('Error posting data: $e');
      return false;
    } finally {
      _isLoading = false;
    }
    return false;
  }
}
