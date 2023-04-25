import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/services_model.dart';
import 'package:sssv1/network_calling/http.dart';

class serviceProvider with ChangeNotifier {
  List<ServicesModel> data = [];
  Future<void> serviceProv() async {
    List<ServicesModel> datalist = await GetData().getData();
    this.data = datalist;
    notifyListeners();
  }
}
