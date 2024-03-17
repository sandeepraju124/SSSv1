// import 'package:flutter/cupertino.dart';
// import 'package:sssv1/models/business_models.dart';
// import 'package:sssv1/models/business_profile.dart';
// import 'package:sssv1/network_calling/http.dart';
// import 'package:sssv1/utils/constants.dart';

// // class BusinessProfileProvider with ChangeNotifier {
// //   BusinessModel?  _businessProfile;
// //   Businessprofileadd? _businessProfileAdd;
// //   bool _isLoading = false;

// //   BusinessModel? get businessProfileData => _businessProfile;
// //   Businessprofileadd? get businessProfileAddData => _businessProfileAdd;
// //   bool get isLoading => _isLoading;

// //   Future<void> businessProfileProvider(key, value) async {

// //     _isLoading = true;
// //     print("businessProfileAdd");
// //     Businessprofileadd businessProfileAdd =await Http().fetchBusinessProfile("$baseUrl/uid/$value");
// //     print("businessProfileAdd");
// //     print(businessProfileAdd);
// //     List<BusinessModel> datalist = await Http().getBusinessData(key: key, value: value);
// //     print("datalist");
// //     print(datalist);

// //     _businessProfile = datalist.first ;
// //     _businessProfileAdd = businessProfileAdd;
// //     _isLoading = false;
// //     notifyListeners();
// //     // print("datalist $datalist");
// //     // print("printing");
// //     // print(_subcategory?.subcategories[3]);
// //     // print(subcategoryData?.subcategories.length.toString());
// //     // print("changenotifier called");
// //   }
// // }

// class BusinessProfileProvider with ChangeNotifier {
//   BusinessModel? _businessProfile;
//   Businessprofileadd? _businessProfileAdd;
//   bool _isLoading = false;

//   BusinessModel? get businessProfileData => _businessProfile;
//   Businessprofileadd? get businessProfileAddData => _businessProfileAdd;
//   bool get isLoading => _isLoading;

//   Future<void> businessProfileProvider(key, value) async {
//     try {
//       _isLoading = true;
//       notifyListeners();

//       print("businessProfileAdd");
//       Businessprofileadd businessProfileAdd = await Http().fetchBusinessProfile("$baseUrl/uid/$value");
//       print("businessProfileAdd");
//       print(businessProfileAdd);

//       // List<BusinessModel> datalist = await Http().getBusinessData(key: key, value: value);
//       // print("datalist");
//       // print(datalist);

//       // _businessProfile = datalist.first;
//       _businessProfileAdd = businessProfileAdd;
//     } catch (error) {
//       // Handle the error appropriately, here we print it for debugging purposes
//       print("Error occurred: $error");

//       // You can set _businessProfileAdd to null or any default value if needed
//       _businessProfileAdd = null;
//     } finally {
//       List<BusinessModel> datalist = await Http().getBusinessData(key: key, value: value);
//       _businessProfile = datalist.first;
//       print("datalist");
//       print(datalist);
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/models/business_profile.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';

class BusinessProfileProvider with ChangeNotifier {
  BusinessModel? _businessProfile;
  Businessprofileadd? _businessProfileAdd;
  bool _isLoading = false;
  String? _error;

  BusinessModel? get businessProfileData => _businessProfile;
  Businessprofileadd? get businessProfileAddData => _businessProfileAdd;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Future<void> businessProfileProvider(key, value) async {
  //   try {
  //     _isLoading = true;
  //     _error = null;
  //     notifyListeners();

  //     print("Fetching business profile data...");
  //     Businessprofileadd businessProfileAdd =
  //         await Http().fetchBusinessProfile("$baseUrl/uid/$value");
  //     print("Business profile data fetched successfully.");

  //     // Fetch business data
  //     print("Fetching business data...");
  //     List<BusinessModel> dataList =
  //         await Http().getBusinessData(key: key, value: value);
  //     print("Business data fetched successfully.");

  //     _businessProfileAdd = businessProfileAdd;
  //     _businessProfile = dataList.isNotEmpty ? dataList.first : null;
  //   } catch (error) {
  //     // Handle the error appropriately, here we print it for debugging purposes
  //     print("Error occurred: $error");

  //     // Set the error message
  //     _error = "Failed to fetch business data: $error";
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  // Future<void> businessProfileProvider(key, value) async {
  //   try {
  //     _isLoading = true;
  //     _error = null;
  //     notifyListeners();

  //     print("Fetching business profile data...");
  //     Businessprofileadd businessProfileAdd =
  //         await Http().fetchBusinessProfile("$baseUrl/uid/$value");
  //     print("Business profile data fetched successfully.");

  //     // Fetch business data
  //     print("Fetching business data...");
  //     List<BusinessModel> dataList =
  //         await Http().getBusinessData(key: key, value: value);
  //     print("Business data fetched successfully.");

  //     if (dataList.isNotEmpty) {
  //       _businessProfile = dataList.first;
  //     } else {
  //       // Handle the case when dataList is empty
  //       throw Exception('Business data is empty');
  //     }

  //     _businessProfileAdd = businessProfileAdd;
  //   } catch (error) {
  //     // Handle the error appropriately, here we print it for debugging purposes
  //     print("Error occurred: $error");

  //     // Set the error message
  //     _error = "Failed to fetch business data: $error";
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }
  Future<void> businessProfileProvider(key, value) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Fetch business profile data
      Businessprofileadd businessProfileAdd =
          await Http().fetchBusinessProfile("$baseUrl/uid/$value");

      // Fetch business data
      List<BusinessModel> dataList =
          await Http().getBusinessData(key: key, value: value);

      if (dataList.isNotEmpty) {
        _businessProfile = dataList.first;
        _businessProfileAdd = businessProfileAdd;
      } else {
        // Handle the case when dataList is empty
        _error = 'Business data is empty';
      }
    } catch (error) {
      // Handle the error appropriately, here we set the error message
      _error = "Failed to fetch business data: $error";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
