// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:sssv1/models/Housedata_model.dart';

// // // class HouseProvider with ChangeNotifier {
// // //   // List to store fetched house data
// // //   List<HousedataModel> _houses = [];

// // //   // Getter for accessing house data
// // //   List<HousedataModel> get houses => _houses;

// // //   Future<void> fetchHouseData(Map<String, String> queryParams) async {
// // //     try {
// // //       final url = Uri.parse(
// // //           'https://supernova1137.azurewebsites.net/pg/business/house-data');
// // //       final response =
// // //           await http.get(url.replace(queryParameters: queryParams));

// // //       if (response.statusCode == 200) {
// // //         final List<dynamic> responseData = json.decode(response.body);
// // //         print(
// // //             'Fetched data: $responseData'); // Debugging: Print the fetched data

// // //         _houses =
// // //             responseData.map((data) => HousedataModel.fromJson(data)).toList();
// // //         print(
// // //             'Houses: ${_houses.length}'); // Debugging: Print the number of houses loaded

// // //         notifyListeners();
// // //       } else {
// // //         throw Exception('Failed to load house data');
// // //       }
// // //     } catch (error) {
// // //       rethrow;
// // //     }
// // //   }

// // //   Future<void> fetchHouseData(Map<String, String> queryParams) async {
// // //   try {
// // //     final url = Uri.parse(
// // //         'https://supernova1137.azurewebsites.net/pg/business/house-data');
// // //     final response =
// // //         await http.get(url.replace(queryParameters: queryParams));

// // //     if (response.statusCode == 200) {
// // //       final dynamic responseData = json.decode(response.body);
// // //       print('Fetched data: $responseData');

// // //       if (responseData is List) {
// // //         _houses = responseData
// // //             .map((data) => HousedataModel.fromJson(data))
// // //             .toList();
// // //       } else if (responseData is Map) {
// // //         // If the response is a single object, convert it into a list with a single item
// // //         _houses = [HousedataModel.fromJson(responseData)];
// // //       }

// // //       print('Houses: ${_houses.length}');
// // //       notifyListeners();
// // //     } else {
// // //       throw Exception('Failed to load house data');
// // //     }
// // //   } catch (error) {
// // //     rethrow;
// // //   }
// // // }
// // }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:sssv1/models/Housedata_model.dart';

// class HouseProvider with ChangeNotifier {
//   List<HousedataModel> _houses = [];

//   List<HousedataModel> get houses => _houses;

//   Future<void> fetchHouseData(Map<String, String> queryParams) async {
//     try {
//       final url = Uri.parse(
//           'https://supernova1137.azurewebsites.net/pg/business/house-data');
//       final response =
//           await http.get(url.replace(queryParameters: queryParams));

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);

//         if (responseData is List) {
//           _houses = responseData
//               .map((data) => HousedataModel.fromJson(data))
//               .toList();
//         } else if (responseData is Map &&
//             responseData.containsKey('No results found with your filter')) {
//           // Handle message, e.g., "No results found"
//           print('Server message: ${responseData['No results were found']}');
//           _houses = [];
//         } else {
//           throw Exception('Unexpected response format');
//         }

//         notifyListeners();
//       } else {
//         throw Exception('Failed to load house data');
//       }
//     } catch (error) {
//       rethrow;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sssv1/models/Housedata_model.dart';

class HouseProvider with ChangeNotifier {
  List<HousedataModel> _houses = [];
  final bool _isLoading = false;

  List<HousedataModel> get houses => _houses;
  bool get isLoading => _isLoading;

  Future<void> fetchHouseData(Map<String, String> queryParams) async {
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
      } else {
        throw Exception('Failed to load house data');
      }
    } catch (error) {
      print('Error: $error');
      rethrow;
    }
  }
}
