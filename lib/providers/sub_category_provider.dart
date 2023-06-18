import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/category_models.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';

class SubcategoryProvider with ChangeNotifier {
  Subcategory? _subcategory;
  bool _isLoading = false;

  Subcategory? get subcategoryData => _subcategory;
  bool get isLoading => _isLoading;

  // List<Subcategory> _data = [];
  // List<Subcategory> get data => _data;

  Future<void> subCategoryProvider(subcategory) async {
    _isLoading = true;
    Subcategory datalist = await Http().fetchSubcategoryData("$baseUrl/category/$subcategory");
    _subcategory = datalist;
    _isLoading = false;
    notifyListeners();
    // print("datalist $datalist");
    // print("printing");
    // print(_subcategory?.subcategories[3]);
    // print(subcategoryData?.subcategories.length.toString());
    // print("changenotifier called");
  }
}
