import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/business_profile.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';

class AllBusinessListProvider with ChangeNotifier {
  List<Businessprofile> _allBusinessList = [];
  bool _isLoading = false;

  List<Businessprofile>? get allBusinessListData => _allBusinessList;
  bool get isLoading => _isLoading;

  // List<Subcategory> _data = [];
  // List<Subcategory> get data => _data;

  Future<void> allBusinessListProvider() async {
    // print("_allBusinessList $_allBusinessList");
    // print("_allBusinessList ${_allBusinessList.length}");
    _isLoading = true;
    List<Businessprofile> datalist =
        await Http().fetchAllBusinessListData("$baseUrl/services");
    _allBusinessList = datalist;
    _isLoading = false;
    notifyListeners();
    // print("datalist $datalist");
    // print("printing");
    // print(_allBusinessList.length);
    //  print(_allBusinessList);
    // print(subcategoryData?.subcategories.length.toString());
    // print("changenotifier called");
  }
}
