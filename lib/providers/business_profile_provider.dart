import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/models/business_profile.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';

// class BusinessProfileProvider with ChangeNotifier {
//   Businessprofile? _businessProfile;
//   bool _isLoading = false;

//   Businessprofile? get businessProfileData => _businessProfile;
//   bool get isLoading => _isLoading;

//   // List<Subcategory> _data = [];
//   // List<Subcategory> get data => _data;

//   Future<void> businessProfileProvider(uid) async {
//     _isLoading = true;
//     Businessprofile businessProfile =
//         await Http().fetchBusinessProfile("$baseUrl/uid/$uid");
//     _businessProfile = businessProfile;
//     _isLoading = false;
//     notifyListeners();
//     // print("datalist $datalist");
//     // print("printing");
//     // print(_subcategory?.subcategories[3]);
//     // print(subcategoryData?.subcategories.length.toString());
//     // print("changenotifier called");
//   }
// }
class BusinessProfileProvider with ChangeNotifier {
  BusinessModel? _businessProfile;
  Businessprofile? _businessProfileAdd;
  bool _isLoading = false;

  BusinessModel? get businessProfileData => _businessProfile;
  Businessprofile? get businessProfileAddData => _businessProfileAdd;
  bool get isLoading => _isLoading;

  // List<Subcategory> _data = [];
  // List<Subcategory> get data => _data;

  Future<void> businessProfileProvider(key, value) async {
    _isLoading = true;
    Businessprofile businessProfile =
        await Http().fetchBusinessProfile("$baseUrl/uid/$value");
    List<BusinessModel> datalist =
        await Http().getBusinessData(key: key, value: value);
    _businessProfile = datalist.first;
    _businessProfileAdd = businessProfile;
    _isLoading = false;
    notifyListeners();
    // print("datalist $datalist");
    // print("printing");
    // print(_subcategory?.subcategories[3]);
    // print(subcategoryData?.subcategories.length.toString());
    // print("changenotifier called");
  }
}
