// import 'package:flutter/cupertino.dart';
// import 'package:sssv1/models/business_models.dart';
// import 'package:sssv1/network_calling/http.dart';
//
// class HomeRestaurantListProvider with ChangeNotifier {
//   List<BusinessModel?> _homebBusinessData = [];
//   // late List<String> _uniqueSubCategories;
//   bool _isLoading = false;
//   Map<String, Map<String, dynamic>> _businessRating = {};
//
//   List<BusinessModel?> get getHomeBusinessData => _homebBusinessData;
//   // List get getUniqueSubcategoryData => _uniqueSubCategories;
//   bool get isLoading => _isLoading;
//   Map<String, Map<String, dynamic>> get businessRating => _businessRating;
//
//   // List<Subcategory> _data = [];
//   // List<Subcategory> get data => _data;
//
//   Future<void> getHomeBusinessProvider({key, value}) async {
//     _isLoading = true;
//     // Subcategory datalist = await Http().fetchSubcategoryData("$baseUrl/category/$subcategory");
//     List<BusinessModel> datalist =
//         await Http().getBusinessData(key: key, value: value);
//     // print("datalist");
//     // print(datalist);
//     for (var business in datalist) {
//       Map<String, dynamic> rating =
//           await Http().overall_rating(business.businessUid);
//       _businessRating[business.businessUid] = rating;
//     }
//
//     _homebBusinessData = datalist;
//     // _uniqueSubCategories = datalist.map((data) => data.subCategory).toSet().toList();
//     // print(_uniqueSubCategories);
//     // print("_uniqueSubCategories");
//
//     _isLoading = false;
//     notifyListeners();
//     // print("datalist $datalist");
//     // print("printing");
//     // print(_subcategory?.subcategories[3]);
//     // print(subcategoryData?.subcategories.length.toString());
//     // print(getBusinessData.length);
//     // print("changenotifier called");
//   }
// }
//


import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/business_models.dart';
import '../models/new_commets_models.dart';


class HomeRestaurantListProvider with ChangeNotifier {
  List<BusinessModel> _featuredList = [];
  bool _isLoading = false;

  List<BusinessModel> get FeaturedList => _featuredList;
  bool get isLoading => _isLoading;

  Future<void> fetchFeatured(double latitude, double longitude, int distance) async {
    // final url = 'https://supernova1137.azurewebsites.net/pg/comments/latlong?latitude=$latitude&longitude=$longitude&distance=$distance';
    // String url = "https://supernova1137.azurewebsites.net/pg/comments/latlong?latitude=17.4875&longitude=78.399734&distance=5000";
    // String url = "https://supernova1137.azurewebsites.net/pg/business/latlong?latitude=17.4875&longitude=78.399734&distance=20000.0&key=is_premium&value=True";
    // String url = "https://supernova1137.azurewebsites.net/pg/business/latlong?latitude=17.4875&longitude=78.399734&distance=20000.0&key=is_premium&value=True&length=5&sortby=avg_rating";
    String url = "https://supernova1137.azurewebsites.net/pg/business/latlong?latitude=$latitude&longitude=$longitude&distance=20000.0&key=is_premium&value=True&length=5&sortby=avg_rating";

    try {
      _isLoading = true;
      notifyListeners();
      // print("ccc");

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        print(response.body);
        _featuredList = responseData.map((data) => BusinessModel.fromJson(data)).toList();
        print(_featuredList);
      }else if (response.statusCode == 404) {
        // If the status code is 400, return an empty list
        _featuredList = [];
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
