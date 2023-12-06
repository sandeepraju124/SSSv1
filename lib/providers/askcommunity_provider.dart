// // // import 'package:flutter/cupertino.dart';
// // // import 'package:sssv1/models/askthecom_models.dart';
// // // import 'package:sssv1/network_calling/http.dart';
// // // import 'package:sssv1/utils/constants.dart';

// // // class AskCommunityProvider with ChangeNotifier {
// // //   AskTheCommunityModels? _askcommunity;
// // //   bool _isLoading = false;

// // //   AskTheCommunityModels? get askCommunityData => _askcommunity;
// // //   bool get isLoading => _isLoading;

// // //   // List<Subcategory> _data = [];
// // //   // List<Subcategory> get data => _data;

// // //   Future<void> askCommunityProvider(uid) async {
// // //     _isLoading = true;
// // //     AskTheCommunityModels datalist =
// // //         await Http().fetchAskCommunity("$baseUrl/askcommunity/$uid");
// // //     _askcommunity = datalist;
// // //     _isLoading = false;
// // //     notifyListeners();
// // //     // print("datalist $datalist");
// // //     // print("printing");$baseUrl/
// // //     // print(_askcommunity?.businessUid);
// // //     // print(subcategoryData?.subcategories.length.toString());
// // //     // print("changenotifier called");
// // //   }
// // // }

// // import 'package:flutter/cupertino.dart';
// // import 'package:sssv1/models/askthecom_models.dart';
// // import 'package:sssv1/network_calling/http.dart';
// // import 'package:sssv1/utils/constants.dart';

// // class AskCommunityProvider with ChangeNotifier {
// //   AskTheCommunityModels? _askcommunity;
// //   bool _isLoading = false;

// //   AskTheCommunityModels? get askCommunityData => _askcommunity;
// //   bool get isLoading => _isLoading;

// //   Future<void> fetchAskCommunityData(String uid) async {
// //     try {
// //       _isLoading = true;
// //       notifyListeners();

// //       AskTheCommunityModels datalist =
// //           await Http().fetchAskCommunity("$baseUrl/askcommunity/$uid");

// //       // Update the data in your provider
// //       _askcommunity = datalist;

// //       _isLoading = false;
// //       notifyListeners();
// //     } catch (e) {
// //       // Handle errors
// //       _isLoading = false;
// //       notifyListeners();
// //     }
// //   }
// // }

// // ignore_for_file: avoid_print, prefer_const_constructors, non_constant_identifier_names

// // ignore: avoid_web_libraries_in_flutter

// import 'package:flutter/Material.dart';

// import 'package:http/http.dart' as http;

// import 'package:sssv1/models/askthecom_models.dart';
// import 'package:sssv1/network_calling/http.dart';
// import 'package:sssv1/utils/constants.dart';

// class AskCommunityProvider with ChangeNotifier {
//   AskTheCommunityModels? _askcommunity;
//   bool _isLoading = false;

//   AskTheCommunityModels? get askCommunityData => _askcommunity;
//   bool get isLoading => _isLoading;

//   Future<void> fetchAskCommunityData(String uid) async {
//     _isLoading = true;
//     notifyListeners();

//     // Fetch new data
//     AskTheCommunityModels datalist =
//         await Http().fetchAskCommunity("$baseUrl/askcommunity/$uid");

//     print("Fetched data: $datalist");

//     // Update the existing data by appending the new data

//     _isLoading = false;
//     notifyListeners();
//   }

//   ////////////// Provider for posting question //////////

//   Future<bool> PostQuestionsProvider({
//     required BuildContext context,
//     required String question,
//     required String business_uid,
//     required String User_id,
//   }) async {
//     try {
//       _isLoading = true;
//       //  var data1 = Provider.of<AskCommunityProvider>(context, listen: false);

//       final body = {
//         "question": question,
//         "business_uid": business_uid,
//         "userid": User_id
//       };

//       final url = Uri.parse("$baseUrl/post_question");
//       final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

//       final response = await http.post(url, headers: headers, body: body);

//       // final response = await http.post(url, headers: headers, body: body);

//       if (response.statusCode == 200) {
//         print("comment posted successfully");
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("question posted Successfully"),
//             behavior: SnackBarBehavior.floating,
//           ),
//         );

//         await fetchAskCommunityData(business_uid);

//         _isLoading = false;
//         return true; //
//       } else {
//         // Handle error case
//         print("Failed to post comment. Status code: ${response.statusCode}");
//         print('Response body: ${response.body}');
//         // You can handle errors here, e.g., showing an error message to the user.
//       }
//     } catch (e) {
//       print('Error posting data: $e');
//       return false;
//     } finally {
//       _isLoading = false;
//     }
//     return false;
//   }
// }

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

      print("Fetched data: $datalist");

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
