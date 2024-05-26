import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sssv1/models/Housedata_model.dart';

class HouseProvider with ChangeNotifier {
  List<HousedataModel> _houses = [];
  final bool _isLoading = false;

  List<HousedataModel> get houses => _houses;
  bool get isLoading => _isLoading;

  Future<List<HousedataModel>> fetchHouseData(
      Map<String, String> queryParams) async {
    try {
      final url = Uri.parse(
          'https://supernova1137.azurewebsites.net/pg/business/house-data');
      final response =
          await http.get(url.replace(queryParameters: queryParams));

      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData is List) {
          _houses = responseData
              .map((data) => HousedataModel.fromJson(data))
              .toList();
        } else if (responseData is Map && responseData.containsKey('message')) {
          // Handle message, e.g., "No results found"
          // print('Server message: ${responseData['message']}');
          _houses = [];
        } else {
          throw Exception('Unexpected response format: ${response.body}');
        }

        notifyListeners();
        return _houses; // Return the list of houses
      } else {
        throw Exception('Failed to load house data');
      }
    } catch (error) {
      print('Error: $error');
      rethrow;
    }
  }
}
