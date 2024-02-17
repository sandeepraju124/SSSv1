import 'package:flutter/foundation.dart';
import 'package:sssv1/User_Activity%20Section/user_activity_model.dart';

import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';

class UserActivityProvider extends ChangeNotifier {
  UserActivityModel? _userActivity;
  bool _isLoading = false;

  UserActivityModel? get getUserActivityData => _userActivity;
  bool get isLoading => _isLoading;

  // Future<void> userActivityProvider(uid) async {
  //   _isLoading = true;
  //   Future.microtask(() => notifyListeners());
  //   UserActivityModel userActivity =
  //       await Http().fetchUserActivity("$baseUrl/user_activities/$uid");
  //   _userActivity = userActivity;
  //   _isLoading = false;
  //   Future.microtask(() => notifyListeners());
  // }

  Future<void> userActivityProvider(uid) async {
    _isLoading = true;
    Future.microtask(() => notifyListeners());
    try {
      UserActivityModel userActivity =
          await Http().fetchUserActivity("$baseUrl/user_activities/$uid");
      _userActivity = userActivity;
    } catch (e, stacktrace) {
      // Capture the stack trace
      // print('Failed to fetch user activity: $e');
      // print('Stack trace: $stacktrace'); // Log the stack trace
      // handle the error as needed
    } finally {
      _isLoading = false;
      Future.microtask(() => notifyListeners());
    }
  }
}
