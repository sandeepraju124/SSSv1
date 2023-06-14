import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sssv1/models/askthecom_models.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/models/business_profile.dart';
import 'package:sssv1/models/category_models.dart';
import 'package:sssv1/models/commentsection_models.dart';
import 'package:sssv1/models/subcatrgorylist_model.dart';
import 'package:sssv1/models/users_models.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Http {
  List<Business> business = [];

  // used this for 5 restaurants showed in homepage
  Future<List<Business>> fetchBusinessData(String uri) async {
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body) as List;
      // print("responsebody ${response.body}");
      // print("json $jsonList");
      business = jsonList.map((json) => Business.fromJson(json)).toList();
      // print(business);
      return business;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  // used this to show subcatogories
  List<Subcategory> Category_data = [];
  Future<Subcategory> fetchSubcategoryData(String uri) async {
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      // print("responsebody ${response.body}");
      // print("decodedResponse $decodedResponse");
      var subcategory = Subcategory.fromJson(decodedResponse);
      // print("Category_data $subcategory");
      return subcategory;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  // used this to show the list of subcategories
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

  Future<Businessprofile> fetchBusinessProfile(String uri) async {
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var businessProfile =
          Businessprofile.fromJson(json.decode(response.body));
      return businessProfile;
    } else {
      throw Exception('Failed to load business profile');
    }
  }

// used this to show ask for community

  Future<AskTheCommunityModels> fetchAskCommunity(String uri) async {
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // print(response.body);
      var askCommunity =
          AskTheCommunityModels.fromJson(json.decode(response.body));
      return askCommunity;
    } else {
      throw Exception('Failed to load business profile');
    }
  }

// used this for comment scetion

  Future<CommentSectionModels> fetchComments(String uri) async {
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // print(response.body);
      var comments = CommentSectionModels.fromJson(json.decode(response.body));
      return comments;
    } else {
      throw Exception('Failed to load business profile');
    }
  }





    // used this to show all business list foe search
  Future<List<Businessprofile>> fetchAllBusinessListData(String uri) async {
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List;
      print("responsebody ${response.body}");
      print("json $jsonList");
      final List<Businessprofile> services = jsonList.map((json) => Businessprofile.fromJson(json)).toList();
      return services;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

// used this for post comments
// not using alreday implemented in provider

// Future<void> postComments(String uri, body) async {
//   // var url = Uri.parse(uri);
//   final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
//   final response = await http.post(Uri.parse(uri), headers: headers, body:body);
//     // var response = await http.get(url);
//   if (response.statusCode == 200) {
//     // print(response.body);
//     print('Data posted successfully');
//   } else {
//      throw Exception('Error posting data: ${response.statusCode}');
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
    print("userid $userid");

    final apiUrl = Uri.parse('https://zukhov.azurewebsites.net/user/$userid');
    final response = await http.get(apiUrl);
    print("response $response");

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      // print("responseBody $responseBody");
      var userdata = UserModels.fromJson(responseBody);
      return userdata;
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }

  // Future<UserModel> fetchUsersData() async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   // await Future.delayed(const Duration(seconds: 2));
  //   final userid = user?.uid; //d8JpVQttpad6s5maOboGC0iCVaB3
  //   final apiUrl =
  //       Uri.parse('https://zukhov.azurewebsites.net/user/$userid');
  //   final response = await http.get(apiUrl);
  //   if (kDebugMode) {
  //     print("response $response");
  //   }
  //   if (response.statusCode == 200) {
  //     if (kDebugMode) {
  //       print('printing if statement');
  //     }
  //     final responseBody = await json.decode(response.body);
  //     if (kDebugMode) {
  //       print("response $responseBody");
  //     }

  //     return UserModel.fromJson(responseBody);
  //   } else {
  //     throw Exception('Failed to fetch data');
  //   }
  // }

  // ------------------------------------------------------------------------------------
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
      String url = "https://zukhov.azurewebsites.net/user";
      final response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode != 200) {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
