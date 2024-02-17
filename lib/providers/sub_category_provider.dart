import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/models/category_models.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';

class businessProvider with ChangeNotifier {
  late List<BusinessModel?> _businessData;
  late List<String> _uniqueSubCategories;
  // late Map<String, double> _businessRating;
  bool _isLoading = false;

  List<BusinessModel?> get getBusinessData => _businessData;
  List get getUniqueSubcategoryData => _uniqueSubCategories;
  bool get isLoading => _isLoading;
  // Map<String, double> get businessRating => _businessRating;


  // List<Subcategory> _data = [];
  // List<Subcategory> get data => _data;
  


  Future<void> getBusinessProvider(key, value) async {
    _isLoading = true;
    // Subcategory datalist = await Http().fetchSubcategoryData("$baseUrl/category/$subcategory");
    List<BusinessModel> datalist = await Http().getBusinessData(key: key, value: value);
    // _businessRating = {};

    // for (var business in datalist){
    //   double rating = await Http().overall_rating(business.businessUid);
    //   _businessRating[business.businessUid] = rating;

    // }

    // print("datalist");
    // print(datalist);
    _businessData = datalist;
    _uniqueSubCategories = datalist.map((data) => data.subCategory).toSet().toList();
    print(_uniqueSubCategories);
    print("_uniqueSubCategories");

    
    _isLoading = false;
    notifyListeners();
    // print("datalist $datalist");
    // print("printing");
    // print(_subcategory?.subcategories[3]);
    // print(subcategoryData?.subcategories.length.toString());
    print(getBusinessData.length);
    // print("changenotifier called");
  }
}
