

// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/models/commentsection_models.dart';
import 'package:sssv1/models/new_commets_models.dart';
import 'package:sssv1/network_calling/http.dart';
import "package:http/http.dart" as http;
import 'package:sssv1/providers/user_review_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:geolocator/geolocator.dart';

import 'business_profile_provider.dart';

class CommentSectionProviderNew extends ChangeNotifier {
  final TextEditingController _reviewController = TextEditingController();
  List<NearbyComments> _comments = [];
  bool _isLoading = false;

  List<NearbyComments> get comments => _comments;
  bool get isLoading => _isLoading;

  // Get comments
  Future<void> getComments(String business_id) async {
    String url = "$baseUrl/comments/where?business_id=$business_id";

    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        _comments = responseData.map((data) => NearbyComments.fromJson(data)).toList();
        print(_comments);
      }else if (response.statusCode == 404) {
        // If the status code is 400, return an empty list
        _comments = [];
        print('No comments found: status code 404');
      } else {
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
    required String comment,
  }) async {
    try {
      _isLoading = true;

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final body = {
        'rating': rating.toString(),
        'business_id': businessUid,
        'user_id': userId,
        'comment': comment,
        'lat': position.latitude.toString(),
        'long': position.longitude.toString(),
      };

      print(body);
      final url = Uri.parse("$baseUrl/comments/where");
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

      final response = await http.post(url, headers: headers, body: body);
      print(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Your review was posted successfully"),
            behavior: SnackBarBehavior.floating,
          ),
        );

        // Fetch updated comments and display new one on top
        await getComments(businessUid);
        Provider.of<UserCommentsProvider>(context, listen: false).getUserComments(userId);
        Provider.of<BusinessProfileProvider>(context, listen: false).businessProfileProvider(businessUid);
        return true;
      } else {
        return false;
      }
    } catch (e) {
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
    required String businessUid,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      final body = {
        'comment_id': commentId,
        'user_id': userId,
        'rating': rating.toString(),
        'comment': newReview,
        'business_id': businessUid,
      };

      final url = Uri.parse("$baseUrl/comments/where");
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

      final response = await http.patch(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        await getComments(businessUid);

        // // Mark the edited comment and add an "Edited" flag
        // final editedComment = _comments.firstWhere((comment) => comment.commentId == commentId);
        // editedComment.isEdited = true; // Assuming you have an 'isEdited' field in your model

        ScaffoldMessenger.of(context).showSnackBar(
          // ignore: prefer_const_constructors
          SnackBar(
            content: Text("Review updated successfully"),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return true;
      } else if (response.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Comment not found.")),
        );
        return false;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to edit comment: ${response.body}")),
        );
        return false;
      }
    } catch (e) {
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

      final url = Uri.parse("$baseUrl/comments/where?comment_id=$commentId");
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

      final response = await http.delete(url, headers: headers);
      if (response.statusCode == 200) {
         if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Comment deleted successfully")),
        );
      }
        await getComments(business_uid);

        return true;
      } else if (response.statusCode == 403) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("You are not authorized to delete this comment")),
        );
        return false;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to delete comment: ${response.body}")),
        );
        return false;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred while deleting the comment")),
      );
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  
  // this is user comments provider 

  // List<NearbyComments> _userComments = [];
  // // bool _isLoading = false;
  //
  // List<NearbyComments> get userComments => _userComments;
  // // bool get isLoading => _isLoading;
  //
  // // Get comments
  // Future<void> getUserComments(String UserId) async {
  //   String url = "$baseUrl/comments/where?user_id=$UserId";
  //
  //   try {
  //     _isLoading = true;
  //     notifyListeners();
  //
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       final List<dynamic> responseData = json.decode(response.body);
  //       print(response.body);
  //       _userComments = responseData.map((data) => NearbyComments.fromJson(data)).toList();
  //       print(_userComments);
  //     }else if (response.statusCode == 404) {
  //       // If the status code is 400, return an empty list
  //       _userComments = [];
  //       print('No comments found: status code 400');
  //     }
  //     else {
  //       throw Exception('Failed to load comments');
  //     }
  //   } catch (error) {
  //     print(error);
  //     rethrow;
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }
}
