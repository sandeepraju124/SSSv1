
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/models/restaurant.dart';
import 'package:sssv1/network_calling/http.dart';
import '../models/restaurant.dart';


class restaurentProvider with ChangeNotifier{
  List<RestaurantModels> data = [];
  Future<void> resProv() async {
    List<RestaurantModels> datalist = await GetData().getRestaurantData();
    this.data = datalist;
     notifyListeners();
  }
  }






