import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sssv1/models/Housedata_model.dart';

class HouseProvider with ChangeNotifier {
  List<HousedataModel> _houses = [];
  final bool _isLoading = false;

  List<HousedataModel> get houses => _houses;
  bool get isLoading => _isLoading;

  Future<void> fetchHouseData(Map<String, dynamic> queryParams) async {
  // Base URL
  final String baseUrl = 'https://supernova1137.azurewebsites.net/pg/house/house-search-latlong';

  // Default parameters
  final Map<String, String> defaultParams = {
    // 'latitude': _latitude.toString(),
    // 'longitude': _longitude.toString(),
    'distance': '5000'
  };

  // Combine default and provided parameters 
  final Map<String, String> params = {}..addAll(defaultParams);

  queryParams.forEach((key, value) {
    // if (value != null) {
    //   params[key] = value.toString();
    // }
    if(key == 'houseType'){
      params['house_type'] = 'apartment';
    }
    // if(key == 'houseType'){
    //   params['house_type'] = value.toString();
    // }
    if(key == 'bedrooms'){
      params['bedrooms'] = value.toString();
    }
    if(key == 'priceRange'){
      params['price'] = value.toString();
    }
    if(key == 'carParking'){
      params['car_parking'] = value.toString();
    }
    if(key == 'advance'){
      params['advance'] = value.toString();
    }
    if(key == 'buildingAge'){
      params['building_age'] = value.toString();
    }
  });

  // Construct the query string
  final String queryString = Uri(queryParameters: params).query;
  print('Query String: $queryString');

  // Final URL
  final String url = '$baseUrl?$queryString';

  try {
    final response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      // Parse the JSON response
      final data = jsonDecode(response.body);
      HousedataModel Hosuedata = HousedataModel.fromJson(data);
      print('House Data: $data');
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
}
