// ignore_for_file: non_constant_identifier_names, prefer_const_declarations, avoid_print

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sssv1/HousingServices/business_houseModel.dart';
import 'package:sssv1/User_Activity%20Section/user_activity_model.dart';
import 'package:sssv1/models/askthecom_models.dart';
import 'package:sssv1/models/business_models.dart';

import 'package:sssv1/models/business_profile.dart';
import 'package:sssv1/models/category_models.dart';
import 'package:sssv1/models/commentsection_models.dart';
import 'package:sssv1/models/service_models.dart';
import 'package:sssv1/models/subcatrgorylist_model.dart';
import 'package:sssv1/models/users_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sssv1/utils/constants.dart';

class Http {
  List<Subcategorylist> business = [];

  // used this for 5 restaurants showed in homepage
  Future<List<Subcategorylist>> fetchBusinessData(String uri) async {
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body) as List;
      // print("responsebody ${response.body}");
      // print("json $jsonList");
      business =
          jsonList.map((json) => Subcategorylist.fromJson(json)).toList();
      // print(business);
      return business;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  // used this to show subcatogories
  // List<Subcategory> Category_data = [];
  // Future<Subcategory> fetchSubcategoryData(String uri) async {
  //   var url = Uri.parse(uri);
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var decodedResponse = json.decode(response.body);
  //     // print("responsebody ${response.body}");
  //     // print("decodedResponse $decodedResponse");
  //     var subcategory = Subcategory.fromJson(decodedResponse);
  //     // print("Category_data $subcategory");
  //     return subcategory;
  //   } else {
  //     throw Exception('Failed to fetch data');
  //   }
  // }

// recreating of above api
  // Future<List<BusinessModel>> getBusinessData(
  //     {required String key, required String value}) async {
  //   final String apiUrl =
  //       'https://supernova1137.azurewebsites.net/pg/business/where?$key=$value';

  //   final response = await http.get(Uri.parse(apiUrl));

  //   if (response.statusCode == 200) {
  //     // If the server returns a 200 OK response, parse the JSON
  //     final List<dynamic> jsonList = json.decode(response.body);
  //     print("responsebody ${response.body}");
  //     // print("jsonList $jsonList");
  //     return jsonList.map((json) => BusinessModel.fromJson(json)).toList();
  //   } else {
  //     print("printing Exception");
  //     // If the server did not return a 200 OK response, throw an exception.
  //     throw Exception('Failed to load business data');
  //   }
  // }

  // Future<List<BusinessModel>> getBusinessData(
  //     {required String key, required String value}) async {
  //   final String apiUrl =
  //       'https://supernova1137.azurewebsites.net/pg/business/where?$key=$value';

  //   try {
  //     final response = await http.get(Uri.parse(apiUrl));

  //     // print('Response status code: ${response.statusCode}');
  //     // print('Response body: ${response.body}');

  //     if (response.statusCode == 200) {
  //       final List<dynamic> jsonList = json.decode(response.body);
  //       return jsonList.map((json) => BusinessModel.fromJson(json)).toList();
  //     } else {
  //       throw Exception(
  //           'Failed to load business data. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     // print('Error fetching business data: $e');
  //     throw Exception('Failed to load business data: $e');
  //   }
  // }

  Future<BusinessHousemodel?> fetchBusinessHouseData(String businessUid) async {
    final String url =
        'https://supernova1137.azurewebsites.net/pg/business/house-data?business_uid=$businessUid';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        // Assuming the data is a list and we need to filter by business_uid
        final filteredData = data.firstWhere(
            (json) => json['business_uid'] == businessUid,
            orElse: () => null);
        return filteredData != null
            ? BusinessHousemodel.fromJson(filteredData)
            : null;
      } else {
        throw Exception('Failed to load housing data');
      }
    } catch (e) {
      print('Error fetching housing data: $e');
      return null;
    }
  }

  Future<List<BusinessModel>> getBusinessData({
    required String key,
    required String value,
  }) async {
    final String apiUrl =
        'https://supernova1137.azurewebsites.net/pg/business/where?$key=$value';
    // print('Calling API: $apiUrl');

    try {
      final response = await http.get(Uri.parse(apiUrl));
      // print('Response status code: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        // print('Decoded JSON List: $jsonList');

        return jsonList.map((json) => BusinessModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load business data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching business data: $e');
      throw Exception('Failed to load business data: $e');
    }
  }

  Future<ServicesModels> fetchMongoBusinessData(String uri) async {
    try {
      var url = Uri.parse(uri);
      var response = await http.get(url);
      // log(response.body);

      if (response.statusCode == 200) {
        return ServicesModels.fromJson(json.decode(response.body));
      } else {
        throw Exception("Failed to load mongo business data");
      }
    } catch (e) {
      // Handle any exceptions that occur during the HTTP request
      print("Error fetching mongo business data: $e");
      throw Exception("Failed to load mongo business data");
    }
  }

  // Future<List<BusinessModel>> getBusinessLatLongData({
  //   required String key,
  //   required String value,
  //   required String latitude,
  //   required String longitude,
  //   required String distance,
  // }) async {
  //   // Construct the API URL with the additional parameters
  //   final String apiUrl =
  //       'https://supernova1137.azurewebsites.net/pg/business/latlong?key=$key&value=$value&latitude=$latitude&longitude=$longitude&distance=$distance';

  //   try {
  //     final response = await http.get(Uri.parse(apiUrl));

  //     if (response.statusCode == 200) {
  //       final List<dynamic> jsonList = json.decode(response.body);
  //       return jsonList.map((json) => BusinessModel.fromJson(json)).toList();
  //     } else {
  //       throw Exception(
  //           'Failed to load business data. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error fetching business data: $e');
  //     throw Exception('Failed to load business data: $e');
  //   }
  // }

  // Future<List<BusinessModel>> getNearbyBusinesses({
  //   required String key,
  //   required String value,
  //   required String latitude,
  //   required String longitude,
  //   required String distance,
  // }) async {
  //   final String apiUrl =
  //       'https://supernova1137.azurewebsites.net/pg/business/latlong';

  //   final Uri uri = Uri.parse(
  //       '$apiUrl?latitude=$latitude&longitude=$longitude&distance=$distance&key=$key&value=$value');

  //   try {
  //     final response = await http.get(uri);
  //     if (response.statusCode == 200) {
  //       // Parse the response
  //       final data = jsonDecode(response.body);
  //       // Assuming the list of businesses is under a key called 'businesses'
  //       // Make sure to replace 'businesses' with the actual key from the API response
  //       List<dynamic>? businessesJson = data['businesses'];
  //       if (businessesJson != null) {
  //         List<BusinessModel> businesses = businessesJson
  //             .map((item) => BusinessModel.fromJson(item))
  //             .toList();
  //         return businesses;
  //       } else {
  //         // print('No businesses found in the response');
  //         return []; // Return an empty list if no businesses are found
  //       }
  //     } else {
  //       // Handle error
  //       // print('Failed to fetch nearby businesses: ${response.statusCode}');
  //       throw Exception('Failed to load business data');
  //     }
  //   } catch (e) {
  //     // Handle error
  //     // print('Error fetching business data: $e');
  //     throw Exception('Failed to load business data');
  //   }
  // }

  Future<List<BusinessModel>> getNearbyBusinesses({
    required String key,
    required String value,
    required String latitude,
    required String longitude,
    required String distance,
  }) async {
    final String apiUrl =
        'https://supernova1137.azurewebsites.net/pg/business/latlong';

    final Uri uri = Uri.parse(
        '$apiUrl?latitude=$latitude&longitude=$longitude&distance=$distance&key=$key&value=$value');

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        // Parse the response
        final data = jsonDecode(response.body);
        // Assuming the list of businesses is under a key called 'businesses'
        // Make sure to replace 'businesses' with the actual key from the API response
        if (data is Map<String, dynamic> && data.containsKey('businesses')) {
          var businessesJson = data['businesses'];
          if (businessesJson is List) {
            List<BusinessModel> businesses = businessesJson
                .map((item) => BusinessModel.fromJson(item))
                .toList();
            return businesses;
          } else {
            print('Expected a list of businesses but got: $businessesJson');
            return []; // Return an empty list if the data is not a list
          }
        } else {
          print('No businesses found in the response');
          return []; // Return an empty list if no businesses are found
        }
      } else {
        // Handle non-200 status codes
        print('Failed to fetch nearby businesses: ${response.statusCode}');
        throw Exception('Failed to load business data');
      }
    } catch (e) {
      // Handle any other exceptions
      print('Error fetching business data: $e');
      throw Exception('Failed to load business data');
    }
  }

  Future<Map<String, dynamic>> overall_rating(String business_uid) async {
    try {
      final String apiUrl =
          'https://supernova1137.azurewebsites.net/overall_rating/$business_uid';
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // print(response.body);
        // final rating = double.parse(response.body);
        final Map<String, dynamic> responseData = json.decode(response.body);
        final double rating = responseData['overall_rating'].toDouble();
        final int reviewsCount = responseData['reviews_count'];
        return {'rating': rating, 'reviewsCount': reviewsCount};
      } else {
        // print("printing Exception");
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception(
            'Failed to load business data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load business data: $e');
    }
  }

  Future<String> getLocationName(
      double latitude, double longitude, String apiKey) async {
    final String baseurl = "https://maps.googleapis.com/maps/api/geocode/json";
    final String endpoint = "$baseurl?latlng=$latitude,$longitude&key=$apiKey";

    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      // print(response.body);
      print("body");
      // print(data["results"][0]["formatted_address"]);
      // print(data["results"][0]["address_components"][0]["short_name"]);

      if (data.containsKey("results") && (data["results"] as List).isNotEmpty) {
        List<dynamic> addressComponents =
            data["results"][0]["address_components"];
        String shortName = addressComponents.isNotEmpty
            ? addressComponents[0]["short_name"]
            : "N/A";
        print(shortName);
        return shortName;
        // return data["results"][0]["formatted_address"];
      } else {
        throw Exception("location not found");
      }
    } else {
      throw Exception("Failed to load data");
    }
  }

  // used this to show the list of subcategories
  // also used this to show restaurant widget in homepage ----->
  Future<List<Subcategorylist>> fetchSubcategoryListData(String uri) async {
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List;
      // print("responsebody ${response.body}");
      // print("json $jsonList");
      final List<Subcategorylist> services =
          jsonList.map((json) => Subcategorylist.fromJson(json)).toList();
      return services;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

// used this to show business profile

  // Future<Businessprofile> fetchBusinessProfile(String uri) async {
  //   var url = Uri.parse(uri);
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var businessProfile =
  //         Businessprofile.fromJson(json.decode(response.body));
  //     return businessProfile;
  //   } else {
  //     throw Exception('Failed to load business profile');
  //   }
  // }

  // Future<Businessprofile> fetchBusinessProfile(String uri) async {
  //   var url = Uri.parse(uri);
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var jsonBody = json.decode(response.body);
  //     if (jsonBody != null) {
  //       var businessProfile = Businessprofile.fromJson(jsonBody);
  //       return businessProfile;
  //     } else {
  //       throw Exception('JSON response is null');
  //     }
  //   } else {
  //     throw Exception('Failed to load business profile');
  //   }
  // }

  // Future<Businessprofileadd> fetchBusinessProfile(String uri) async {
  //   var url = Uri.parse(uri);
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     // print(response.body);
  //     var jsonBody = json.decode(response.body);
  //     if (jsonBody != null) {
  //       var businessProfile = Businessprofileadd.fromJson(jsonBody);
  //       return businessProfile;
  //     } else {
  //       // return Future.value(Null);
  //       throw Exception('JSON response is null');
  //     }
  //   } else if (response.statusCode == 500) {
  //     // return Future.value(null);
  //     throw Exception('Server error: ${response.body}');
  //   } else {
  //     throw Exception(
  //         'Failed to load business profile. Status code: ${response.statusCode}, Response body: ${response.body}');
  //   }
  // }

  Future<Businessprofileadd> fetchBusinessProfile(String uri) async {
    print('Calling API: $uri');
    var url = Uri.parse(uri);
    try {
      var response = await http.get(url);
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonBody = json.decode(response.body);
        print('Decoded JSON Body: $jsonBody');

        if (jsonBody != null) {
          var businessProfile = Businessprofileadd.fromJson(jsonBody);
          print('Parsed Business Profile: $businessProfile');
          return businessProfile;
        } else {
          throw Exception('JSON response is null');
        }
      } else if (response.statusCode == 500) {
        throw Exception('Server error: ${response.body}');
      } else {
        throw Exception(
            'Failed to load business profile. Status code: ${response.statusCode}, Response body: ${response.body}');
      }
    } catch (e) {
      print('Error fetching business profile: $e');
      throw Exception('Failed to load business profile: $e');
    }
  }
// // used this to show ask for community

  Future<AskTheCommunityModels> fetchAskCommunity(String uri) async {
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      // print('Decoded JSON: $decodedJson'); // Debug print
      var askCommunity = AskTheCommunityModels.fromJson(decodedJson);
      return askCommunity;
    } else {
      throw Exception('Failed to load business profile');
    }
  }

  Future<CommentSectionModels> fetchComments(String uri) async {
    var url = Uri.parse(uri);
    var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      var comments = CommentSectionModels.fromJson(json.decode(response.body));
      return comments;
    } else {
      throw Exception('Failed to load business profile');
    }
  }

  // used this to show all business list foe search
  // Future<List<Businessprofileadd>> fetchAllBusinessListData(String uri) async {
  //   var url = Uri.parse(uri);
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final jsonList = json.decode(response.body) as List;
  //     // print("responsebody ${response.body}");
  //     // print("json $jsonList");
  //     final List<Businessprofileadd> services =
  //         jsonList.map((json) => Businessprofileadd.fromJson(json)).toList();
  //     return services;
  //   } else {
  //     throw Exception('Failed to fetch data');
  //   }
  // }

// -----------------------------------------------------------------------------------------------------
  // getting  users api data
  // we are not using this for getting uid we are directly using below line
  // final user = FirebaseAuth.instance.currentUser;

  Future<UserModels> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    // await Future.delayed(const Duration(seconds: 2));

    final userid = user?.uid;
    // print("userid $userid");
    // print("userid $userid");

    final apiUrl = Uri.parse('$baseUrl/user/$userid');
    final response = await http.get(apiUrl);
    // print("response $response");

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      // print("responseBody $responseBody");
      var userdata = UserModels.fromJson(responseBody);
      return userdata;
    } else {
      // print('Failed to fetch data: ${response.statusCode}');
      // print('Response body: ${response.body}');
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }

  //////////////////////////  userActivity ///////////////////////////

  Future<UserActivityModel> fetchUserActivity(String uri) async {
    var url = Uri.parse(uri);
    // print('Request URL: $url');
    var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      var userActivity = UserActivityModel.fromJson(json.decode(response.body));
      return userActivity;
    } else if (response.statusCode == 404) {
      throw Exception('User activity not found');
    } else {
      throw Exception(
          'Failed to load user activity with status code: ${response.statusCode}');
    }
  }
// -------------------------------------------------------------------------------------------------------------------

  // post user data
  // Function to perform the POST request
  Future<void> postData(String url, Map<String, String> body) async {
    // Map<String, String> body = {
    //           'name': "sandee",
    //           'email': "sandeepsai@gmail.com",
    //           "username":username.toString(),
    //           "dp":"https://tinypng.com/images/social/website.jpg",
    //           "street":"hyderabad",
    //           "state":"telangana",
    //           "zipcode":"500072",
    //           "lat":"546",
    //           "lng":"648",
    //           "userid":"7447485859"
    // };
    try {
      String url = "$baseUrl/user";
      final response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode != 200) {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      if (kDebugMode) {
        // print(e.toString());
      }
    }
  }

  Future<List<dynamic>> search(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/search?query=$query'));
    // final response = await http.get(Uri.parse('$baseUrl/search?query=LPWQASZXC909642BVV'));

    if (response.statusCode == 200) {
      List<dynamic> results = jsonDecode(response.body);
      return results;
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
