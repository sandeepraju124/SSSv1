import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:http/http.dart' as http;

class SubcategoryListProvider with ChangeNotifier {
  // List<BusinessModel> _subCategoryList = [];
  List<BusinessModel> _subCategoryListNearby = [];
  bool _isLoading = false;

  // Map<String, Map<String, dynamic>> _businessRating = {};
  Map<String, Map<String, dynamic>> _businessRatingNearby = {};

  bool _hasNearbyBusinesses = false; // Add this line to declare the flag

  bool get hasNearbyBusinesses => _hasNearbyBusinesses;

  // List<BusinessModel>? get subcategoryListData => _subCategoryList;
  List<BusinessModel>? get subcategoryListDataNearby => _subCategoryListNearby;

  bool get isLoading => _isLoading;
  // Map<String, Map<String, dynamic>> get businessRating => _businessRating;
  Map<String, Map<String, dynamic>> get businessRatingNearby =>
      _businessRatingNearby;

  Future<void> subCategoryListProvider(key, value) async {
    _subCategoryListNearby.clear();
    _businessRatingNearby.clear();
    _isLoading = true;
    List<BusinessModel> datalist =
        await Http().getBusinessData(key: key, value: value);
    for (var business in datalist) {
      Map<String, dynamic> rating =
          await Http().overall_rating(business.businessUid);
      _businessRatingNearby[business.businessUid] = rating;
    }
    _subCategoryListNearby = datalist;
    _isLoading = false;
    notifyListeners();
  }

  // New method to update the business list
  // void updateBusinessList(List<BusinessModel> newBusinessList) {
  //   _subCategoryList = newBusinessList;
  //   _hasNearbyBusinesses =
  //       newBusinessList.isNotEmpty; // Set the flag based on the list length

  //   _isLoading = false;
  //   notifyListeners();
  // }

  Future<void> fetchNearbyBusinesses(
      double userLat, double userLong, String key, String value) async {
    _subCategoryListNearby.clear();
    _businessRatingNearby.clear();

    // ignore: prefer_const_declarations
    final String apiUrl = 'https://supernova1137.azurewebsites.net/pg/business/latlong';
    // print("fetchNearbyBusinesses");

    final double distance = 20000; // Define your desired distance
    // print("$apiUrl?latitude=$userLat&longitude=$userLong&distance=$distance&key=$key&value=$value");

    final Uri uri = Uri.parse(
        '$apiUrl?latitude=$userLat&longitude=$userLong&distance=$distance&key=$key&value=$value');

    try {
      // print("inside try");
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        // print(data);

        final List<BusinessModel> businessList =
            data.map((item) => BusinessModel.fromJson(item)).toList();
        _subCategoryListNearby = businessList;
        // print(businessList);

        for (var business in businessList) {
          Map<String, dynamic> rating =
              await Http().overall_rating(business.businessUid);
          _businessRatingNearby[business.businessUid] = rating;
        }

        _isLoading = false;
        notifyListeners();

        // Provider.of<SubcategoryListProvider>(context, listen: false)
        //     .updateBusinessList(businessList);

        // setState(() {
        //   _showNearbyBusinesses = true;
        // });
      } else if (response.statusCode == 404) {
        // Handle error
        // print('No businesses found within the specified distance');
      } else {
        // print('Failed to fetch nearby businesses: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching nearby businesses: $e');
    }
  }
}
