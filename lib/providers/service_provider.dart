
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/models/restaurant.dart';
import 'package:sssv1/models/services_model.dart';
import 'package:sssv1/network_calling/http.dart';
import '../models/restaurant.dart';


class serviceProvider with ChangeNotifier{
  List<ServicesModel> data = [];
  Future<void> serviceProv() async {
    List<ServicesModel> datalist = await GetData().getData();
    this.data = datalist;
     notifyListeners();
  }
    
  }





