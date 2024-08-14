
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sssv1/models/commentsection_models.dart';
import 'package:sssv1/network_calling/http.dart';
import "package:http/http.dart" as http;
import 'package:sssv1/utils/constants.dart';
import 'package:geolocator/geolocator.dart';

import '../models/new_commets_models.dart';

class CommentSectionProviderNew extends ChangeNotifier {
  final TextEditingController _reviewController = TextEditingController();
  // CommentSectionModels? _comments;
  // bool _isLoading = false;
  //
  // CommentSectionModels? get getCommentsData => _comments;
  // bool get isLoading => _isLoading;
  //
  // Fetch comments based on business_uid
  // Future<void> commentSectionProvider(String businessUid) async {
  //   _isLoading = true;
  //   try {
  //     CommentSectionModels commentsection = await Http().fetchComments("$baseUrl/comments/where?business_id=$businessUid");
  //     print(("_comments..................."));
  //     print(_comments);
  //     _comments = commentsection;
  //
  //   } catch (e) {
  //     print('Error fetching comments: $e');
  //     _comments = null;
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  // Calculate average rating
  // double get averageRating {
  //   if (_comments?.reviews.isNotEmpty == true) {
  //     return calculateAverageRating(_comments!);
  //   } else {
  //     return 0.0;
  //   }
  // }

  // double calculateAverageRating(CommentSectionModels comments) {
  //   if (comments.reviews.isEmpty) {
  //     return 0.0;
  //   }
  //
  //   int total = comments.reviews.fold(0, (sum, review) => sum + review.rating);
  //   return total / comments.reviews.length;
  // }

  List<NearbyComments> _comments = [];
  bool _isLoading = false;

  List<NearbyComments> get comments => _comments;
  bool get isLoading => _isLoading;

  // Get comments
  Future<void> getComments(String business_id) async {
    // final url = 'https://supernova1137.azurewebsites.net/pg/comments/latlong?latitude=$latitude&longitude=$longitude&distance=$distance';
    // String url = "https://supernova1137.azurewebsites.net/pg/comments/latlong?latitude=34.05224&longitude=-118.24322&distance=5000";
    String url = "$baseUrl/comments/where?business_id=$business_id";

    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        print(response.body);
        _comments = responseData.map((data) => NearbyComments.fromJson(data)).toList();
        print(_comments);
      }else if (response.statusCode == 404) {
        // If the status code is 400, return an empty list
        _comments = [];
        print('No comments found: status code 400');
      }
      else {
        throw Exception('Failed to load comments');
      }
    } catch (error) {
      print(error);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Post a new comment
  Future<bool> postCommentProvider({
    required BuildContext context,
    required int rating,
    required String businessUid,
    required String userId,
    // required List<String> selectedSuggestions,
    // required List<String> comment,
    required String comment,
  }) async {
    try {
      print("Posting comment...");
      _isLoading = true;

      // Get the user's current position
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      String latitude = position.latitude.toString();
      String longitude = position.longitude.toString();

      // Create the body of the request with latitude and longitude
      final body = {
        'rating': rating.toString(),
        'business_id': businessUid,
        'user_id': userId,
        // 'selected_suggestions': selectedSuggestions.join(' + '),
        // 'comment': comment.join(' + '),
        'comment': comment,
        'lat': latitude,
        'long': longitude,
        // 'created_at': DateTime.now().toIso8601String(), // Include created_at
      };
      print(body);

      final url = Uri.parse("$baseUrl/comments/where");
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print("Comment posted successfully");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Your review was posted successfully"),
            behavior: SnackBarBehavior.floating,
          ),
        );

        await getComments(businessUid);
        return true;
      } else {
        print("Failed to post comment. Status code: ${response.statusCode}");
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error posting comment: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Edit an existing comment
  Future<bool> editCommentProvider({
    required BuildContext context,
    required String commentId,
    required String userId,
    required int rating,
    required String newReview,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      final body = {
        'comment_id': commentId,
        'user_id': userId,
        'rating': rating.toString(),
        'comment': newReview,
        'updated_at': DateTime.now().toIso8601String(), // Include updated_at
      };

      final url = Uri.parse("$baseUrl/comments");
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

      final response = await http.patch(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print("Comment edited successfully");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Review updated successfully"),
            behavior: SnackBarBehavior.floating,
          ),
        );

        // await commentSectionProvider(userId);
        return true;
      } else if (response.statusCode == 403) {
        print("Unauthorized to edit comment.");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("You are not authorized to edit this comment")),
        );
        return false;
      } else {
        print("Failed to edit comment. Status code: ${response.statusCode}");
        print('Response body: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to edit comment: ${response.body}")),
        );
        return false;
      }
    } catch (e) {
      print('Error editing comment: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred while editing the comment")),
      );
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Delete a comment
  Future<bool> deleteCommentProvider({
    required BuildContext context,
    required String commentId,
    required String business_uid,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      // final url = Uri.parse("$baseUrl/comments?comment_id=$commentId&user_id=$userId");
      // final url = Uri.parse("$baseUrl/comments/where/$commentId");
      final url = Uri.parse("https://supernova1137.azurewebsites.net/comments/where?comment_id=$commentId");
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

      final response = await http.delete(url, headers: headers);
      if (response.statusCode == 200) {
        print("Comment deleted successfully");
        // await commentSectionProvider(userId);
        await getComments(business_uid);
        return true;
      } else if (response.statusCode == 403) {
        print("Unauthorized to delete comment.");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("You are not authorized to delete this comment")),
        );
        return false;
      } else {
        print("Failed to delete comment. Status code: ${response.statusCode}");
        print('Response body: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to delete comment: ${response.body}")),
        );
        return false;
      }
    } catch (e) {
      print('Error deleting comment: $e');
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

