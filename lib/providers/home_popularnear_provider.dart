import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/business_models.dart';
import '../models/new_commets_models.dart';


class HomePopularListProvider with ChangeNotifier {
  List<BusinessModel> _popularList = [];
  bool _isLoading = false;

  List<BusinessModel> get PopularList => _popularList;
  bool get isLoading => _isLoading;

  Future<void> fetchPopular(double latitude, double longitude, int distance) async {
    // final url = 'https://supernova1137.azurewebsites.net/pg/comments/latlong?latitude=$latitude&longitude=$longitude&distance=$distance';
    // String url = "https://supernova1137.azurewebsites.net/pg/comments/latlong?latitude=17.4875&longitude=78.399734&distance=5000";
    // String url = "https://supernova1137.azurewebsites.net/pg/business/latlong?latitude=17.4875&longitude=78.399734&distance=20000.0&key=is_premium&value=True";
    // String url = "http://127.0.0.1:5000/pg/business/latlong?latitude=17.4875&longitude=78.399734&distance=20000.0&key=is_premium&value=True&length=5&sortby=avg_rating";
    // String url = "https://supernova1137.azurewebsites.net/pg/business/latlong?latitude=17.4875&longitude=78.399734&distance=20000.0&key=category&value=Food&length=4&sortby=avg_rating";
    String url = "https://supernova1137.azurewebsites.net/pg/business/latlong?latitude=$latitude&longitude=$longitude&distance=20000.0&key=category&value=Food&length=4&sortby=avg_rating";

    try {
      _isLoading = true;
      notifyListeners();
      // print("ccc");

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        // print(response.body);
        _popularList = responseData.map((data) => BusinessModel.fromJson(data)).toList();
        // print("popularList $_popularList");
      }else if (response.statusCode == 404) {
        // If the status code is 400, return an empty list
        _popularList = [];
        // print('No comments found: status code 400');
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