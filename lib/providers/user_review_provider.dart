
import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:sssv1/utils/constants.dart';
import '../models/new_commets_models.dart';

class UserCommentsProvider extends ChangeNotifier {
  // final TextEditingController _reviewController = TextEditingController();


  List<NearbyComments> _userComments = [];
  bool _isLoading = false;

  List<NearbyComments> get comments => _userComments;
  bool get isLoading => _isLoading;

  // Get comments
  Future<void> getUserComments(String UserId) async {
    String url = "$baseUrl/comments/where?user_id=$UserId";

    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        // print(response.body);
        _userComments = responseData.map((data) => NearbyComments.fromJson(data)).toList();
        // print(_userComments);
      }else if (response.statusCode == 404) {
        // If the status code is 400, return an empty list
        _userComments = [];
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
}

