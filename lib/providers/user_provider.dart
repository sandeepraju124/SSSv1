
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/models/restaurant.dart';
import 'package:sssv1/models/user_models.dart';
import 'package:sssv1/network_calling/http.dart';
import '../models/restaurant.dart';


class UserProvider with ChangeNotifier{
  UserModel? data;
  Future<void> userProv() async {
    // List<UserModel> datalist = await GetData().getUserData(id);
    UserModel userModel = await GetData().fetchUsersData();
    // Map datalist = await GetData().fetchUsersData();
    data = userModel;
    print("userProvider data $data");
     notifyListeners(); 
  }
  }
