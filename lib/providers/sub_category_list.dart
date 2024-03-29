// import 'package:flutter/cupertino.dart';
// import 'package:sssv1/models/business_models.dart';
// import 'package:sssv1/models/subcatrgorylist_model.dart';
// import 'package:sssv1/network_calling/http.dart';
// import 'package:sssv1/utils/constants.dart';

// class SubcategoryListProvider with ChangeNotifier {
//   List<BusinessModel> _subCategoryList = [];
//   bool _isLoading = false;
//   Map<String, Map<String, dynamic>> _businessRating = {};
//   List<BusinessModel> _businesses = []; // Add this line to declare _busine

//   List<BusinessModel>? get subcategoryListData => _subCategoryList;
//   bool get isLoading => _isLoading;
//   Map<String, Map<String, dynamic>> get businessRating => _businessRating;

//   // List<Subcategory> _data = [];
//   // List<Subcategory> get data => _data;

//   Future<void> subCategoryListProvider(key, value) async {
//     _isLoading = true;

//     // List<Subcategorylist> datalist = await Http().fetchSubcategoryListData("$baseUrl/subcategory/$subcategory");
//     // _subCategoryList = datalist ;
//     List<BusinessModel> datalist =
//         await Http().getBusinessData(key: key, value: value);
//     for (var business in datalist) {
//       Map<String, dynamic> rating =
//           await Http().overall_rating(business.businessUid);
//       _businessRating[business.businessUid] = rating;
//     }
//     print("map");
//     print(_businessRating);
//     _subCategoryList = datalist;
//     _isLoading = false;
//     notifyListeners();
//     // print("datalist $datalist");
//     // print("printing");
//     // print(_subCategoryList[0].);
//     // print(subcategoryData?.subcategories.length.toString());
//     // print("changenotifier called");

//     // New method to update the business list
//     void updateBusinessList(List<BusinessModel> newBusinessList) {
//       _subCategoryList = newBusinessList;
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   // Future<void> fetchNearbyBusinesses(
//   //     double userLat, double userLong, String key, String value) async {
//   //   try {
//   //     _isLoading = true;
//   //     _subCategoryList = await Http().getNearbyBusinesses(
//   //       key: key,
//   //       value: value,
//   //       latitude: userLat.toString(),
//   //       longitude: userLong.toString(),
//   //       distance: '10000', // You can set the distance as per your requirement
//   //     );
//   //     for (var business in _subCategoryList) {
//   //       Map<String, dynamic> rating =
//   //           await Http().overall_rating(business.businessUid);
//   //       _businessRating[business.businessUid] = rating;
//   //     }
//   //     _isLoading = false;
//   //     notifyListeners();
//   //   } catch (e) {
//   //     print('Failed to fetch nearby businesses: $e');
//   //     // Handle the error appropriately
//   //   }
//   // }

//   // Add this method to your SubcategoryListProvider class
//   // Future<void> fetchNearbyBusinesses(String userLat, String userLang) async {
//   //   try {
//   //     _businesses = await Http().getNearbyBusinesses(
//   //       key: 'latitude',
//   //       value: userLat,
//   //       latitude: userLat,
//   //       longitude: userLang,
//   //       distance: '50', // You can set the distance as per your requirement
//   //     );
//   //     notifyListeners();
//   //   } catch (e) {
//   //     print('Failed to fetch nearby businesses: $e');
//   //     // Handle the error appropriately
//   //   }
//   // }
// }

import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/network_calling/http.dart';

class SubcategoryListProvider with ChangeNotifier {
  List<BusinessModel> _subCategoryList = [];
  bool _isLoading = false;
  Map<String, Map<String, dynamic>> _businessRating = {};

  bool _hasNearbyBusinesses = false; // Add this line to declare the flag

  bool get hasNearbyBusinesses => _hasNearbyBusinesses;

  List<BusinessModel>? get subcategoryListData => _subCategoryList;
  bool get isLoading => _isLoading;
  Map<String, Map<String, dynamic>> get businessRating => _businessRating;

  Future<void> subCategoryListProvider(key, value) async {
    _isLoading = true;
    List<BusinessModel> datalist =
        await Http().getBusinessData(key: key, value: value);
    for (var business in datalist) {
      Map<String, dynamic> rating =
          await Http().overall_rating(business.businessUid);
      _businessRating[business.businessUid] = rating;
    }
    _subCategoryList = datalist;
    _isLoading = false;
    notifyListeners();
  }

  // New method to update the business list
  void updateBusinessList(List<BusinessModel> newBusinessList) {
    _subCategoryList = newBusinessList;
    _hasNearbyBusinesses =
        newBusinessList.isNotEmpty; // Set the flag based on the list length

    _isLoading = false;
    notifyListeners();
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:sssv1/models/business_models.dart';
// import 'package:sssv1/network_calling/http.dart';

// class SubcategoryListProvider with ChangeNotifier {
//   List<BusinessModel> _subCategoryList = [];
//   bool _isLoading = false;
//   Map<String, Map<String, dynamic>> _businessRating = {};
//   bool _hasNearbyBusinesses =
//       false; // Flag to toggle between all and nearby businesses

//   bool get hasNearbyBusinesses => _hasNearbyBusinesses;
//   List<BusinessModel>? get subcategoryListData => _subCategoryList;
//   bool get isLoading => _isLoading;
//   Map<String, Map<String, dynamic>> get businessRating => _businessRating;

//   Future<void> subCategoryListProvider(key, value) async {
//     _isLoading = true;
//     List<BusinessModel> datalist =
//         await Http().getBusinessData(key: key, value: value);
//     for (var business in datalist) {
//       Map<String, dynamic> rating =
//           await Http().overall_rating(business.businessUid);
//       _businessRating[business.businessUid] = rating;
//     }
//     _subCategoryList = datalist;
//     _isLoading = false;
//     notifyListeners();
//   }

//   // New method to update the business list
//   void updateBusinessList(List<BusinessModel> newBusinessList) {
//     _subCategoryList = newBusinessList;
//     _hasNearbyBusinesses =
//         newBusinessList.isNotEmpty; // Set the flag based on the list length
//     _isLoading = false;
//     notifyListeners();
//   }

//   // Method to toggle the business list between all businesses and nearby businesses
//   void toggleBusinessList(bool showNearby) {
//     if (showNearby) {
//       // Assuming you have a method to fetch nearby businesses
//       // This is just a placeholder. You'll need to implement the actual logic
//       // to fetch nearby businesses based on the user's location.
//       List<BusinessModel> nearbyBusinesses = fetchNearbyBusinesses();
//       updateBusinessList(nearbyBusinesses);
//       _hasNearbyBusinesses = true;
//     } else {
//       // Assuming you have a method to fetch all businesses
//       // This is just a placeholder. You'll need to implement the actual logic
//       // to fetch all businesses.
//       List<BusinessModel> allBusinesses = fetchAllBusinesses();
//       updateBusinessList(allBusinesses);
//       _hasNearbyBusinesses = false;
//     }
//     notifyListeners();
//   }

//   // Placeholder methods for fetching businesses. You'll need to implement these.
//   List<BusinessModel> fetchNearbyBusinesses() {
//     // Implement logic to fetch nearby businesses
//     return [];
//   }

//   List<BusinessModel> fetchAllBusinesses() {
//     // Implement logic to fetch all businesses
//     return [];
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:sssv1/models/business_models.dart';
// import 'package:sssv1/network_calling/http.dart';

// class SubcategoryListProvider with ChangeNotifier {
//   List<BusinessModel> _subCategoryList = [];
//   bool _isLoading = false;
//   Map<String, Map<String, dynamic>> _businessRating = {};
//   bool _hasNearbyBusinesses =
//       false; // Flag to toggle between all and nearby businesses

//   bool get hasNearbyBusinesses => _hasNearbyBusinesses;
//   List<BusinessModel>? get subcategoryListData => _subCategoryList;
//   bool get isLoading => _isLoading;
//   Map<String, Map<String, dynamic>> get businessRating => _businessRating;

//   Future<void> subCategoryListProvider(key, value) async {
//     _isLoading = true;
//     List<BusinessModel> datalist =
//         await Http().getBusinessData(key: key, value: value);
//     for (var business in datalist) {
//       Map<String, dynamic> rating =
//           await Http().overall_rating(business.businessUid);
//       _businessRating[business.businessUid] = rating;
//     }
//     _subCategoryList = datalist;
//     _isLoading = false;
//     notifyListeners();
//   }

//   // New method to update the business list
//   void updateBusinessList(List<BusinessModel> newBusinessList) {
//     _subCategoryList = newBusinessList;
//     _hasNearbyBusinesses = newBusinessList.isNotEmpty;
//     _isLoading = false;
//     notifyListeners();
//   }

//   // Method to toggle the business list between all businesses and nearby businesses
//  Future<void> toggleBusinessList(bool showNearby, double userLat, double userLong, String key, String value) async {
//  _isLoading = true;
//  notifyListeners(); // Notify listeners to show loading state

//  if (showNearby) {
//     // Fetch nearby businesses
//     List<BusinessModel> nearbyBusinesses = await Http().getNearbyBusinesses(
//       key: key,
//       value: value,
//       latitude: userLat.toString(),
//       longitude: userLong.toString(),
//       distance: '20000', // Adjust the distance as needed
//     );
//     updateBusinessList(nearbyBusinesses);
//     _hasNearbyBusinesses = true;
//  } else {
//     // Fetch all businesses
//     List<BusinessModel> allBusinesses = await Http().getBusinessData(
//       key: key,
//       value: value,
//     );
//     updateBusinessList(allBusinesses);
//     _hasNearbyBusinesses = false;
//  }

//  _isLoading = false;
//  notifyListeners(); // Notify listeners to update the UI with the new list
// }
// }
