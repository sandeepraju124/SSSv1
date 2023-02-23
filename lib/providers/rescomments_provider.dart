

import 'package:flutter/material.dart';
import 'package:sssv1/models/rescomments_models.dart';
import 'package:sssv1/network_calling/http.dart';

class commentsProvider with ChangeNotifier{
  List<Comment> data = [];
  Future<void> resProv(serviceid) async {
    // print("print in provider ");
    // List<Rescommentonlyone> datalist = await GetData().getRestaurantCommentsData(resname);
    List<Comment> datalist = await GetData().getComments(serviceid);
    data = datalist;
    // print("this is provider data $data");

    for (var element in data) { 
          // print("checking for each $element");
          }
    }
     
     notifyListeners();
     
  }

  