import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BusinessCategoriesProviderNew with ChangeNotifier {
  Map<String, List<Map<String, dynamic>>> _priority1Categories = {};
  bool _isLoading = false;
  Map<String, List<Subcategory>> _categories = {};
  Map<String, List<Subcategory>> get allCategories => _categories;

  Map<String, List<Map<String, dynamic>>> get priority1Categories => _priority1Categories;
  bool get isLoading => _isLoading;

  Future<void> fetchCategoriesData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://supernova1137.azurewebsites.net/business_categories'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)[0] as Map<String, dynamic>;
        // print(data);
        // print("...............................__");
        _priority1Categories = _filterPriority1Categories(data);

        var decodedResponse = json.decode(response.body);
        Map<String, List<Subcategory>> categories = {};

        for (var category in decodedResponse) {
          category.forEach((key, value) {
            if (key != "_id") {
              categories[key] = List<Subcategory>.from(
                  value.map((item) => Subcategory.fromJson(item)));
            }
          });
        }
        _categories = categories;

      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw error;
    } finally {
      _isLoading = false;
      notifyListeners();
      // print(_priority1Categories);
      // print(_allCategories);
    }
  }

  Map<String, List<Map<String, dynamic>>> _filterPriority1Categories(Map<String, dynamic> data) {
    final Map<String, List<Map<String, dynamic>>> filteredCategories = {};

    data.forEach((category, subcategories) {
      if (subcategories is List) {
        final List<Map<String, dynamic>> priority1Subcategories = subcategories
            .where((subcategory) => subcategory['priority'] == 1)
            .cast<Map<String, dynamic>>()
            .toList();

        if (priority1Subcategories.isNotEmpty) {
          filteredCategories[category] = priority1Subcategories;
        }
      }
    });

    return filteredCategories;
  }
}

class Subcategory {
  final int priority;
  final String subcategory;

  Subcategory({required this.priority, required this.subcategory});

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      priority: json['priority'],
      subcategory: json['subcategory'],
    );
  }
}


