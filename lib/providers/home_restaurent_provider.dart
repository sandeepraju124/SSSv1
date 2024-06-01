import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/network_calling/http.dart';

class HomeRestaurantListProvider with ChangeNotifier {
  List<BusinessModel?> _homebBusinessData = [];
  // late List<String> _uniqueSubCategories;
  bool _isLoading = false;
  Map<String, Map<String, dynamic>> _businessRating = {};

  List<BusinessModel?> get getHomeBusinessData => _homebBusinessData;
  // List get getUniqueSubcategoryData => _uniqueSubCategories;
  bool get isLoading => _isLoading;
  Map<String, Map<String, dynamic>> get businessRating => _businessRating;

  // List<Subcategory> _data = [];
  // List<Subcategory> get data => _data;

  Future<void> getHomeBusinessProvider({key, value}) async {
    _isLoading = true;
    // Subcategory datalist = await Http().fetchSubcategoryData("$baseUrl/category/$subcategory");
    List<BusinessModel> datalist =
        await Http().getBusinessData(key: key, value: value);
    // print("datalist");
    // print(datalist);
    for (var business in datalist) {
      Map<String, dynamic> rating =
          await Http().overall_rating(business.businessUid);
      _businessRating[business.businessUid] = rating;
    }

    _homebBusinessData = datalist;
    // _uniqueSubCategories = datalist.map((data) => data.subCategory).toSet().toList();
    // print(_uniqueSubCategories);
    // print("_uniqueSubCategories");

    _isLoading = false;
    notifyListeners();
    // print("datalist $datalist");
    // print("printing");
    // print(_subcategory?.subcategories[3]);
    // print(subcategoryData?.subcategories.length.toString());
    // print(getBusinessData.length);
    // print("changenotifier called");
  }
}
