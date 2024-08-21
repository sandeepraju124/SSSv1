import 'package:flutter/foundation.dart';
import 'package:sssv1/HousingServices/business_houseModel.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/models/business_profile.dart';
import 'package:sssv1/network_calling/http.dart';

// class BusinessProfileProvider with ChangeNotifier {
//   BusinessModel? _businessProfile;
//   Businessprofileadd? _businessProfileAdd;
//   BusinessHousemodel? _businessHouseModel;
//   bool _isLoading = false;
//   String? _error;
//
//   BusinessModel? get businessProfileData => _businessProfile;
//   Businessprofileadd? get businessProfileAddData => _businessProfileAdd;
//   BusinessHousemodel? get businessHouseModelData => _businessHouseModel;
//   bool get isLoading => _isLoading;
//   String? get error => _error;
//
//   Future<void> businessProfileProvider(String key, String value) async {
//     try {
//       _isLoading = true;
//       _error = null;
//       notifyListeners();
//
//       // Fetch business data
//       List<BusinessModel> dataList =
//           await Http().getBusinessData(key: key, value: value);
//       // print('Fetched business data: ${dataList.length} items');
//
//       if (dataList.isNotEmpty) {
//         _businessProfile = dataList.first;
//
//         // Fetch business house data
//         try {
//           if (value.isNotEmpty) {
//             _businessHouseModel = await Http().fetchBusinessHouseData(value);
//             // print('Fetched business house data: $_businessHouseModel');
//             if (_businessHouseModel == null) {
//               // print('Business house data is null');
//             }
//           } else {
//             // print('Value is empty, skipping business house data fetch');
//           }
//         } catch (e) {
//           // print('Error fetching business house data: $e');
//           _error = "Failed to fetch business house data: $e";
//         }
//       } else {
//         _error = 'Business data is empty';
//       }
//     } catch (error) {
//       _error = "Failed to fetch business data: $error";
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class BusinessProfileProvider with ChangeNotifier {
  BusinessModel? business;
  BusinessModel? get businessProfileData => business;
  bool isLoading = false;
  String? errorMessage;

  Future<void> businessProfileProvider(String businessUid) async {
    final String url =
        'https://supernova1137.azurewebsites.net/pg/business/where?business_uid=$businessUid';

    // final String url =
    //     'https://supernova1137.azurewebsites.net/pg/business/house-data?business_uid=$businessUid';

    try {
      isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.isNotEmpty) {
          business = BusinessModel.fromJson(jsonResponse[0]);
          print(business);
        } else {
          errorMessage = "No business data found.";
        }
      } else {
        errorMessage = "Failed to load data: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage = "An error occurred: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
