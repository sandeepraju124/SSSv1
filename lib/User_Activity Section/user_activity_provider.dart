import 'package:flutter/foundation.dart';
import 'package:sssv1/User_Activity%20Section/user_activity_model.dart';

import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';

class UserActivityProvider extends ChangeNotifier {
  UserActivityModel? _userActivity;
  bool _isLoading = false;

  UserActivityModel? get getUserActivityData => _userActivity;
  bool get isLoading => _isLoading;

  Future<void> userActivityProvider(uid) async {
    _isLoading = true;
    UserActivityModel userActivity =
        await Http().fetchUserActivity("$baseUrl/user_activities/$uid");
    _userActivity = userActivity;
    // print('Fetched User Activity: $userActivity');
    _isLoading = false;
    notifyListeners();
  }
}
