import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/models/subcatrgorylist_model.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';

class SubcategoryListProvider with ChangeNotifier {
  List<BusinessModel> _subCategoryList = [];
  bool _isLoading = false;
  Map<String, Map<String, dynamic>> _businessRating = {};

  List<BusinessModel>? get subcategoryListData => _subCategoryList;
  bool get isLoading => _isLoading;
  Map<String, Map<String, dynamic>> get businessRating => _businessRating;

  // List<Subcategory> _data = [];
  // List<Subcategory> get data => _data;

  Future<void> subCategoryListProvider(key, value) async {
    _isLoading = true;
    

    
    // List<Subcategorylist> datalist = await Http().fetchSubcategoryListData("$baseUrl/subcategory/$subcategory");
    // _subCategoryList = datalist ;
    List<BusinessModel> datalist = await Http().getBusinessData(key: key, value: value);
    for (var business in datalist){
      Map<String, dynamic> rating = await Http().overall_rating(business.businessUid);
      _businessRating[business.businessUid] = rating;
    }
    print("map");
    print(_businessRating);
    _subCategoryList = datalist ;
    _isLoading = false;
    notifyListeners();
    // print("datalist $datalist");
    // print("printing");
    // print(_subCategoryList[0].);
    // print(subcategoryData?.subcategories.length.toString());
    // print("changenotifier called");
  }
}
