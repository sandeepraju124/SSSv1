// import 'package:flutter/cupertino.dart';
// // import 'package:sssv1/models/business_models.dart';
// import 'package:sssv1/models/users_models.dart';
// import 'package:sssv1/network_calling/http.dart';

// class UserProvider with ChangeNotifier {
//   UserModels? _data;
//   UserModels? get getUserData => _data;

//   Future<void> userProvider() async {
//     _data = null;
//     notifyListeners();
//     // List<UserModel> datalist = await GetData().getUserData(id);
//     try {
//       UserModels userModel = await Http().fetchUserData();
//       print(userModel);
//       print("userModel");
//       // Map datalist = await GetData().fetchUsersData();
//       _data = userModel;

//       // print("userProvider data $_data");
//       notifyListeners();
//     } catch (e) {
//       print("catch in userprovider");
//       throw Exception(e);
//     }
//   }

//   Future<void> clearUserData() async {
//     _data = null;
//     notifyListeners();
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:sssv1/models/users_models.dart';
import 'package:sssv1/network_calling/http.dart';

class UserProvider with ChangeNotifier {
  UserModels? _data;
  UserModels? get getUserData => _data;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> userProvider() async {
    if (_isLoading) return; // Prevent multiple simultaneous calls
    _isLoading = true;
    notifyListeners();

    try {
      UserModels userModel = await Http().fetchUserData();
      _data = userModel;
    } catch (e) {
      print("Error in userProvider: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearUserData() {
    _data = null;
    notifyListeners();
  }
}
