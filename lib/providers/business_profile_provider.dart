import 'package:flutter/foundation.dart';
import 'package:sssv1/HousingServices/business_houseModel.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/models/business_profile.dart';
import 'package:sssv1/network_calling/http.dart';

class BusinessProfileProvider with ChangeNotifier {
  BusinessModel? _businessProfile;
  Businessprofileadd? _businessProfileAdd;
  BusinessHousemodel? _businessHouseModel;
  bool _isLoading = false;
  String? _error;

  BusinessModel? get businessProfileData => _businessProfile;
  Businessprofileadd? get businessProfileAddData => _businessProfileAdd;
  BusinessHousemodel? get businessHouseModelData => _businessHouseModel;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> businessProfileProvider(String key, String value) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Fetch business data
      List<BusinessModel> dataList =
          await Http().getBusinessData(key: key, value: value);
      // print('Fetched business data: ${dataList.length} items');

      if (dataList.isNotEmpty) {
        _businessProfile = dataList.first;

        // Fetch business house data
        try {
          if (value.isNotEmpty) {
            _businessHouseModel = await Http().fetchBusinessHouseData(value);
            // print('Fetched business house data: $_businessHouseModel');
            if (_businessHouseModel == null) {
              // print('Business house data is null');
            }
          } else {
            // print('Value is empty, skipping business house data fetch');
          }
        } catch (e) {
          // print('Error fetching business house data: $e');
          _error = "Failed to fetch business house data: $e";
        }
      } else {
        _error = 'Business data is empty';
      }
    } catch (error) {
      _error = "Failed to fetch business data: $error";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
