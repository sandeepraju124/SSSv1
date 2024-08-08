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

  // Future<void> commentSectionProvider(uid) async {
  //   _isLoading = true;
  //   CommentSectionModels commentsection =
  //       await Http().fetchComments("$baseUrl/rescomments/$uid");
  //   _comments = commentsection;
  //   _isLoading = false;
  //   notifyListeners();
  // }

  Future<void> commentSectionProvider(uid) async {
    _isLoading = true;
    try {
      CommentSectionModels commentsection =
          await Http().fetchComments("$baseUrl/rescomments/$uid");
      _comments = commentsection;
    } catch (e) {
      print('Error fetching comments: $e');
      _comments = null; // Set to null if there's an error
    } finally {
      _isLoading = false; // Ensure isLoading is set to false when done
      notifyListeners();
    }
  }

  ///////////////////// Average calculating ///////////////////
  double get averageRating {
    if (_comments?.reviews.isNotEmpty == true) {
      return calculateAverageRating(_comments!);
    } else {
      return 0.0; // Return 0.0 if there are no comments or if _comments is null
    }
  }

  double calculateAverageRating(CommentSectionModels comments) {
    if (comments.reviews.isEmpty) {
      return 0.0;
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
    required List<String> selectedSuggestions, // List of selected suggestions
    required List<String> userReviews, // List of user-written reviews
  }) async {
    // print('postCommentProvider called'); // Debug print statement
    try {
      _isLoading = true;

      final body = {
        'rating': rating.toString(),
        'business_uid': business_uid,
        'user_id': user_id,
        'selected_suggestions':
            selectedSuggestions.join(' + '), // Join the suggestions with ' + '
        'user_reviews': userReviews.join(' + '), // Join the reviews with ' + '
      };

      final url = Uri.parse("$baseUrl/postcomment");
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

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
        return true;
      } else {
        print("Failed to post comment. Status code: ${response.statusCode}");
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error posting data: $e');
      return false;
    } finally {
      _isLoading = false;
    }
  }

  // editCommentProvider
  Future<bool> editCommentProvider({
    required BuildContext context,
    required String business_uid,
    required String review_id,
    required String user_id,
    required int rating,
    required String newReview,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      final body = {
        'business_uid': business_uid,
        'review_id': review_id,
        'user_id': user_id,
        'rating': rating.toString(),
        'review': newReview,
      };

      final url = Uri.parse("$baseUrl/editcomment");
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

      final response = await http.put(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print("Comment edited successfully");

        // Show a snackbar with a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Review updated successfully"),
            behavior: SnackBarBehavior.floating,
          ),
        );

        // Refresh the comments to reflect the changes
        await commentSectionProvider(business_uid);
        return true;
      } else {
        print("Failed to edit comment. Status code: ${response.statusCode}");
        print('Response body: ${response.body}');

        // Show an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to edit comment: ${response.body}")),
        );
        return false;
      }
    } catch (e) {
      print('Error editing comment: $e');

      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred while editing the comment")),
      );
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

// deleteCommentProvider
  Future<bool> deleteCommentProvider({
    required BuildContext context,
    required String business_uid,
    required String review_id,
    required String user_id,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      final body = {
        'business_uid': business_uid,
        'review_id': review_id,
        'user_id': user_id,
      };

      final url = Uri.parse("$baseUrl/deletecomment");
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

      final response = await http.delete(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print("Comment deleted successfully");

        // Refresh the comments to reflect the changes
        await commentSectionProvider(business_uid);
        return true;
      } else {
        print("Failed to delete comment. Status code: ${response.statusCode}");
        print('Response body: ${response.body}');

        // Show an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to delete comment: ${response.body}")),
        );
        return false;
      }
    } catch (e) {
      print('Error deleting comment: $e');

      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred while deleting the comment")),
      );
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
