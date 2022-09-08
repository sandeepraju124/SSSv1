import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:sssv1/models/restaurant.dart';
import 'package:sssv1/network_calling/http.dart';
import '../models/restaurant.dart';
import '../screens/homepage.dart';

class restaurentProvider with ChangeNotifier{
  List<RestaurantModels> data = [];
  Future<void> resProv() async {
    List<RestaurantModels> datalist = await GetData().getRestaurantData();
    this.data = datalist;
     notifyListeners();
  }
  }






