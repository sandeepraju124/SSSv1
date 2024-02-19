import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sssv1/models/business_profile.dart';
import 'package:sssv1/utils/constants.dart';

class BusinessServicesProvider with ChangeNotifier {
  List<Businessprofileadd> _services = [];
  List<String> _subcategories = [];
  bool _isLoading = false;

  List<Businessprofileadd> get services => _services;
  List<String> get subcategories => _subcategories;
  bool get isLoading => _isLoading;

  Map<String, List<String>> get categoriesAndSubcategories {
    Map<String, List<String>> result = {};
    for (var service in _services) {
      if (!result.containsKey(service.category)) {
        result[service.category] = [];
      }
      result[service.category]!.add(service.subCategory);
    }
    return result;
  }

  Future<void> fetchAllServices() async {
    _isLoading = true;
    var response = await http.get(Uri.parse('$baseUrl/services'));
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      var services = decodedResponse.cast<Map<String, dynamic>>();
      // Extract the unique subcategories
      var subcategories = services
          .map((service) => service['sub_category'] as String)
          .toSet() // Remove duplicates
          .toList()
          .cast<String>(); // Explicitly cast to List<String>

      _services = services
          .map<Businessprofileadd>((item) => Businessprofileadd.fromJson(item))
          .toSet() // convert to Set to remove duplicates
          .toList(); // convert back to List
      _subcategories = subcategories;
    } else {
      throw Exception('Failed to load services');
    }
    _isLoading = false;
    notifyListeners();
  }
}

