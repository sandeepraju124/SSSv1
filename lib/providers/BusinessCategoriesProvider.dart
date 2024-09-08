import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sssv1/models/newbusinees_categories.dart';
import 'dart:convert';

import 'package:sssv1/utils/constants.dart';


// currently we are not using this provider it has been modified to BusinessCategoriesProviderNew()

class BusinessCategoriesProvider with ChangeNotifier {
  List<BusinessCategories> _categories = [];
  bool _isLoading = false;

  List<BusinessCategories> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> fetchAllCategories() async {
    _isLoading = true;
    var response = await http.get(Uri.parse('$baseUrl/business_categories'));
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      print("decodedResponse");
      List<BusinessCategories> categoriesList = [];
      for (var category in decodedResponse) {
        categoriesList.add(BusinessCategories.fromJson(category));
      }
      _categories = categoriesList;
      print(_categories.first);
      print("categoriesList");
    } else {
      throw Exception('Failed to load categories');
    }
    _isLoading = false;
    notifyListeners();
  }
}
