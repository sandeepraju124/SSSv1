

import 'package:flutter/material.dart';
import 'package:sssv1/models/rescomments_models.dart';
import 'package:sssv1/network_calling/http.dart';

class rescommentsProvider with ChangeNotifier{
  List<Rescommentonlyone> data = [];
  Future<void> resProv(resname) async {
    print("print in provider ");
    List<Rescommentonlyone> datalist = await GetData().getRestaurantCommentsData(resname);
    data = datalist;
    print("this is provider data $data");

    for (var element in data) { 
          print("checking for each $element");}
    }
    
     notifyListeners();
     
  }

  