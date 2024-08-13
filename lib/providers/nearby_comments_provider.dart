import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/new_commets_models.dart';


class NearbyCommentProvider with ChangeNotifier {
  List<NearbyComments> _comments = [];
  bool _isLoading = false;

  List<NearbyComments> get comments => _comments;
  bool get isLoading => _isLoading;

  Future<void> fetchComments(double latitude, double longitude, int distance) async {
    // final url = 'https://supernova1137.azurewebsites.net/pg/comments/latlong?latitude=$latitude&longitude=$longitude&distance=$distance';
    String url = "https://supernova1137.azurewebsites.net/pg/comments/latlong?latitude=34.05224&longitude=-118.24322&distance=5000";

    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        // print(response.body);
        _comments = responseData.map((data) => NearbyComments.fromJson(data)).toList();
        // print(_comments);
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
}
