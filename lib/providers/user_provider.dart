import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/user_models.dart';
import 'package:sssv1/network_calling/http.dart';

class UserProvider with ChangeNotifier {
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
