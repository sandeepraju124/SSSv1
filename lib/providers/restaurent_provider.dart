import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:sssv1/models/restaurant.dart';

import '../models/restaurant.dart';
import '../screens/homepage.dart';
class restaurentProvider with ChangeNotifier{

  // Future<restaurant_model> getdata(context) async {
  //   late DataModel dataModel;
    DataModel? dataModel;
    // var dio = Dio();
    // final response = await dio.get('http://3.110.147.80/test');
    // final response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    fetchData (context) async{
      dataModel = (await getData(context));
      notifyListeners();
    }
  }






