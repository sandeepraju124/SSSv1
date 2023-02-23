
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/models/restaurant.dart';
import 'package:sssv1/models/user_models.dart';
import 'package:sssv1/network_calling/http.dart';
import '../models/restaurant.dart';


class UserProvider with ChangeNotifier{
  List<UserModel> data = [];
  Future<void> userProv(id) async {
    List<UserModel> datalist = await GetData().getUserData(id);
    this.data = datalist;
     notifyListeners();
     print("userProvider data $data");
  }
  }
