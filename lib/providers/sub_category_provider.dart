import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/category_models.dart';
import 'package:sssv1/network_calling/http.dart';


class SubcategoryProvider with ChangeNotifier{

  Subcategory? _subcategory;

  Subcategory? get subcategoryData => _subcategory;

  // List<Subcategory> _data = [];
  // List<Subcategory> get data => _data;
  
  Future<void> subCategoryProvider(subcategory) async {
    Subcategory datalist = await Http().fetchSubcategoryData("https://revolution.azurewebsites.net/category/$subcategory");
    print("datalist $datalist");
    _subcategory = datalist;
    notifyListeners();
    print("printing");
    print(_subcategory?.subcategories[3]);
    if (subcategoryData != null){
      print("not null statement");
    }
    print(subcategoryData?.subcategories.length.toString());
    // notifyListeners();
    print("changenotifier called");
  }
  }
