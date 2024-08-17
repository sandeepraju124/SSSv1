
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/models/commentsection_models.dart';
import 'package:sssv1/network_calling/http.dart';
import "package:http/http.dart" as http;
import 'package:sssv1/providers/user_review_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:geolocator/geolocator.dart';

import '../models/favourite_models.dart';


class FavouriteProvider extends ChangeNotifier {
  // final TextEditingController _reviewController = TextEditingController();

  List<FavouriteModels> _favourite = [];
  bool _isLoading = false;

  List<FavouriteModels> get favourite => _favourite;
  bool get isLoading => _isLoading;

  // Get comments
  Future<void> getFavourites(String user_id) async {
    String url = "$baseUrl/favourite/where?user_id=EgwA2GOIGGXAwZqv1YLFbHFdWer1";
    // String url = "$baseUrl/favourite/where?user_id=$user_id";

    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        print(response.body);
        _favourite = responseData.map((data) => FavouriteModels.fromJson(data)).toList();
        // print(_comments);
      }else if (response.statusCode == 404) {
        // If the status code is 400, return an empty list
        _favourite = [];
        print('No favourite found: status code 400');
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

  Future<void> addFavourite(String userId, String businessId) async {
    final String url = '$baseUrl/favourite/where?user_id=EgwA2GOIGGXAwZqv1YLFbHFdWer1'; // Replace with your API URL

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_id': userId,
          'business_id': businessId,
        }),
      );

      if (response.statusCode == 201) {
        print('Business added to favorites successfully');
      } else {
        print('Failed to add favorite: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }


  Future<void> deleteFavourite(String favouriteId) async {
    final String url = 'http://yourapiurl.com/favourite'; // Replace with your API URL

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'favourite_id': favouriteId,
        }),
      );

      if (response.statusCode == 200) {
        print('Favourite removed successfully');
      } else {
        print('Failed to remove favourite: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}

