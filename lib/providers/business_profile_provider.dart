import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/business_profile.dart';
import 'package:sssv1/network_calling/http.dart';


class BusinessProfileProvider with ChangeNotifier{

  Businessprofile? _businessProfile;
  bool _isLoading = false;

  Businessprofile? get businessProfileData => _businessProfile;
  bool get isLoading => _isLoading;


  // List<Subcategory> _data = [];
  // List<Subcategory> get data => _data;
  
  Future<void> businessProfileProvider(uid) async {
    _isLoading = true;
    Businessprofile businessProfile = await Http().fetchBusinessProfile("https://revolution.azurewebsites.net/uid/$uid");
    _businessProfile = businessProfile;
    _isLoading = false;
    notifyListeners();
    // print("datalist $datalist");
    // print("printing");
    // print(_subcategory?.subcategories[3]);
    // print(subcategoryData?.subcategories.length.toString());
    // print("changenotifier called");
  }
  }
