import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sssv1/models/Housedata_model.dart';

class HouseProvider with ChangeNotifier {
  List<HousedataModel> _houseData = [];
  bool _isLoading = false;

  List<HousedataModel> get houses => _houseData;
  bool get isLoading => _isLoading;

  Future<bool> fetchHouseData(Map<String, dynamic> queryParams, String latitude,
      String longitude) async {
    // Base URL
    final String baseUrl =
        'https://supernova1137.azurewebsites.net/pg/house/house-search-latlong';

    // Default parameters
    final Map<String, String> defaultParams = {
      'latitude': latitude,
      'longitude': longitude,
      'distance': '5000'
    };

    // Combine default and provided parameters
    final Map<String, String> params = {}..addAll(defaultParams);

    queryParams.forEach((key, value) {
      if (value != null) {
        switch (key) {
          case 'houseType':
            params['house_type'] = 'apartment';
            break;
          case 'bedrooms':
            params['bedrooms'] = value.toString();
            break;
          case 'priceRange':
            params['price'] = value.toString();
            break;
          case 'carParking':
            params['car_parking'] = value.toString();
            break;
          case 'advance':
            params['advance'] = value.toString();
            break;
          case 'buildingAge':
            params['building_age'] = value.toString();
            break;
        }
      }
    });

    // Construct the query string
    final String queryString = Uri(queryParameters: params).query;
    // print('Query String: $queryString');

    // Final URL
    final String url = '$baseUrl?$queryString';

    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(url));
      // print(response.body);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> data = jsonDecode(response.body);
        _houseData = data.map((json) => HousedataModel.fromJson(json)).toList();
        // print('House Data: $data');
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        // print('Failed to load data: ${response.statusCode}');
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      // print('Error: $e');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
