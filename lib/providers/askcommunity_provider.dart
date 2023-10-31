// // import 'package:flutter/cupertino.dart';
// // import 'package:sssv1/models/askthecom_models.dart';
// // import 'package:sssv1/network_calling/http.dart';
// // import 'package:sssv1/utils/constants.dart';

// // class AskCommunityProvider with ChangeNotifier {
// //   AskTheCommunityModels? _askcommunity;
// //   bool _isLoading = false;

// //   AskTheCommunityModels? get askCommunityData => _askcommunity;
// //   bool get isLoading => _isLoading;

// //   // List<Subcategory> _data = [];
// //   // List<Subcategory> get data => _data;

// //   Future<void> askCommunityProvider(uid) async {
// //     _isLoading = true;
// //     AskTheCommunityModels datalist =
// //         await Http().fetchAskCommunity("$baseUrl/askcommunity/$uid");
// //     _askcommunity = datalist;
// //     _isLoading = false;
// //     notifyListeners();
// //     // print("datalist $datalist");
// //     // print("printing");$baseUrl/
// //     // print(_askcommunity?.businessUid);
// //     // print(subcategoryData?.subcategories.length.toString());
// //     // print("changenotifier called");
// //   }
// // }

// import 'package:flutter/cupertino.dart';
// import 'package:sssv1/models/askthecom_models.dart';
// import 'package:sssv1/network_calling/http.dart';
// import 'package:sssv1/utils/constants.dart';

// class AskCommunityProvider with ChangeNotifier {
//   AskTheCommunityModels? _askcommunity;
//   bool _isLoading = false;

//   AskTheCommunityModels? get askCommunityData => _askcommunity;
//   bool get isLoading => _isLoading;

//   Future<void> fetchAskCommunityData(String uid) async {
//     try {
//       _isLoading = true;
//       notifyListeners();

//       AskTheCommunityModels datalist =
//           await Http().fetchAskCommunity("$baseUrl/askcommunity/$uid");

//       // Update the data in your provider
//       _askcommunity = datalist;

//       _isLoading = false;
//       notifyListeners();
//     } catch (e) {
//       // Handle errors
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/askthecom_models.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';

class AskCommunityProvider with ChangeNotifier {
  AskTheCommunityModels? _askcommunity;
  bool _isLoading = false;

  AskTheCommunityModels? get askCommunityData => _askcommunity;
  bool get isLoading => _isLoading;

  Future<void> fetchAskCommunityData(String uid) async {
    try {
      _isLoading = true;
      notifyListeners();

      // Fetch new data
      AskTheCommunityModels datalist =
          await Http().fetchAskCommunity("$baseUrl/askcommunity/$uid");

      // Update the existing data by appending the new data
      if (_askcommunity != null) {
        _askcommunity!.data.addAll(datalist.data);
      } else {
        _askcommunity = datalist;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      // Handle errors and notify listeners
      _isLoading = false;
      notifyListeners();
    }
  }
}
