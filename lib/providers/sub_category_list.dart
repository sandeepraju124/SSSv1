import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/models/subcatrgorylist_model.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';

class SubcategoryListProvider with ChangeNotifier {
  List<BusinessModel> _subCategoryList = [];
  bool _isLoading = false;

  List<BusinessModel>? get subcategoryListData => _subCategoryList;
  bool get isLoading => _isLoading;

  // List<Subcategory> _data = [];
  // List<Subcategory> get data => _data;

  Future<void> subCategoryListProvider(key, value) async {
    _isLoading = true;
    

    
    // List<Subcategorylist> datalist = await Http().fetchSubcategoryListData("$baseUrl/subcategory/$subcategory");
    // _subCategoryList = datalist ;
    List<BusinessModel> datalist = await Http().getBusinessData(key: key, value: value);
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
