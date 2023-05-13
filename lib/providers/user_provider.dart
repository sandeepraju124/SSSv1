import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/models/users_models.dart';
import 'package:sssv1/network_calling/http.dart';

class UserProvider with ChangeNotifier {
  UserModels? _data;
  UserModels? get getUserData => _data; 

  Future<void> userProvider() async {
    // List<UserModel> datalist = await GetData().getUserData(id);
    UserModels userModel = await Http().fetchUserData();
    // Map datalist = await GetData().fetchUsersData();
    _data = userModel;
    print("userProvider data $_data");
    notifyListeners();
  }
}
