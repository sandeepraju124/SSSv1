import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sssv1/models/newbusinees_categories.dart';
import 'dart:convert';

import 'package:sssv1/utils/constants.dart';

class BusinessCategoriesProvider with ChangeNotifier {
  List<Businesscategoriesmodel> _categories = [];
  bool _isLoading = false;

  List<Businesscategoriesmodel> get categories => _categories;
  bool get isLoading => _isLoading;

  // Future<void> fetchAllCategories() async {
  //   _isLoading = true;
  //   var response = await http.get(Uri.parse('$baseUrl/business_categories'));
  //   if (response.statusCode == 200) {
  //     var decodedResponse = json.decode(response.body);
  //     _categories = decodedResponse
  //         .map<Businesscategoriesmodel>(
  //             (item) => Businesscategoriesmodel.fromJson(item))
  //         .toList();
  //   } else {
  //     throw Exception('Failed to load categories');
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  // }
  Future<void> fetchAllCategories() async {
    _isLoading = true;
    var response = await http.get(Uri.parse('$baseUrl/business_categories'));
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      // print('Decoded response: $decodedResponse'); // Debug print
      _categories = [Businesscategoriesmodel.fromJson(decodedResponse)];
      // print('Categories after parsing: $_categories'); // Debug print
    } else {
      throw Exception('Failed to load categories');
    }
    _isLoading = false;
    notifyListeners();
  }
}
