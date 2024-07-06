import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/network_calling/http.dart';

class SubcategoryListProvider with ChangeNotifier {
  List<BusinessModel> _subCategoryList = [];
  bool _isLoading = false;
  Map<String, Map<String, dynamic>> _businessRating = {};

  bool _hasNearbyBusinesses = false; // Add this line to declare the flag

  bool get hasNearbyBusinesses => _hasNearbyBusinesses;

  List<BusinessModel>? get subcategoryListData => _subCategoryList;
  bool get isLoading => _isLoading;
  Map<String, Map<String, dynamic>> get businessRating => _businessRating;

  Future<void> subCategoryListProvider(key, value) async {
    _isLoading = true;
    List<BusinessModel> datalist =
        await Http().getBusinessData(key: key, value: value);
    for (var business in datalist) {
      Map<String, dynamic> rating =
          await Http().overall_rating(business.businessUid);
      _businessRating[business.businessUid] = rating;
    }
    _subCategoryList = datalist;
    _isLoading = false;
    notifyListeners();
  }

  // New method to update the business list
  void updateBusinessList(List<BusinessModel> newBusinessList) {
    _subCategoryList = newBusinessList;
    _hasNearbyBusinesses =
        newBusinessList.isNotEmpty; // Set the flag based on the list length

    _isLoading = false;
    notifyListeners();
  }
}
