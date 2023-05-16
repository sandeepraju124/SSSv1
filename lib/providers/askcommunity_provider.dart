import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/askthecom_models.dart';
import 'package:sssv1/network_calling/http.dart';

class AskCommunityProvider with ChangeNotifier {
  AskTheCommunityModels? _askcommunity;
  bool _isLoading = false;

  AskTheCommunityModels? get askCommunityData => _askcommunity;
  bool get isLoading => _isLoading;

  // List<Subcategory> _data = [];
  // List<Subcategory> get data => _data;

  Future<void> askCommunityProvider(uid) async {
    _isLoading = true;
<<<<<<< HEAD
    AskTheCommunityModels datalist = await Http().fetchAskCommunity("https://zukhov.azurewebsites.net/askcommunity/$uid");
=======
    AskTheCommunityModels datalist = await Http().fetchAskCommunity(
        "https://zukhov.azurewebsites.net/askcommunity/$uid");
>>>>>>> 8c184f7bec83ac5cefc587f96c706a98a89bf54c
    _askcommunity = datalist;
    _isLoading = false;
    notifyListeners();
    // print("datalist $datalist");
    // print("printing");https://zukhov.azurewebsites.net/
    // print(_askcommunity?.businessUid);
    // print(subcategoryData?.subcategories.length.toString());
    // print("changenotifier called");
  }
}
