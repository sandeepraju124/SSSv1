import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/searchlist_models.dart';
import 'package:sssv1/network_calling/http.dart';




class SearchlistProvider with ChangeNotifier{
  List<SearchListModels> data = [];
  Future<void> resProv() async {
    List<SearchListModels> datalist = await GetData().getSearchlistData();
    this.data = datalist;
     notifyListeners();
     print("changenotifier called");
  }
  }
