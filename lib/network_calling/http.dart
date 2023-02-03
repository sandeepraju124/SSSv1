import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:sssv1/models/user_models.dart';
import '../utils/urls.dart';
import 'package:sssv1/models/rescomments_models.dart';
import 'package:sssv1/models/restaurant.dart';
import 'package:sssv1/models/searchlist_models.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetData{

// getting restaurant data 5 in main page

  Future<List<RestaurantModels>> getRestaurantData() async {
    List<RestaurantModels> resList = [];
    try {
      var url = 'https://script.google.com/macros/s/AKfycby1kxJDHbw4-MAfoA2ZkdkMeFvCIpREeknhqKIDrIAeJc9zFm6vtsO29YxayCjQqDRY/exec';
      var request = http.Request('GET', Uri.parse(url));
      http.StreamedResponse response = await request.send();
      if (response.statusCode==200) {
         var rawData=await response.stream.bytesToString();
        //  print("checking raw data $rawData");
        List<dynamic> _data = jsonDecode(rawData);
        // print("checking raw decode data $_data");
        _data.forEach((element) { 
          // print("checking each element data $element");
         RestaurantModels modeldata =  RestaurantModels.fromJson(element);
        //  print("checking model data $modeldata");
         resList.add(modeldata);
        // print("checking resList $resList");
        });
      return resList;
      }else{
         print(response.reasonPhrase);
        return [];
      }
      
    } catch (e) {
      // print("exemption $e");
      throw e;
    }
  }



// getting search list data

  Future<List<SearchListModels>> getSearchlistData() async {
    List<SearchListModels> resList = [];
    try {
      var url = 'https://sandyblog.azurewebsites.net/users';
      var request = http.Request('GET', Uri.parse(url));
      http.StreamedResponse response = await request.send();
      if (response.statusCode==200) {
         var rawData=await response.stream.bytesToString();
        List<dynamic> _data = jsonDecode(rawData);
        _data.forEach((element) { 
         SearchListModels modeldata =  SearchListModels.fromJson(element);
         resList.add(modeldata);
         print("http called");
        
        });
      return resList;
      }else{
         print(response.reasonPhrase);
        return [];
      }
      
    } catch (e) {
      // print("exemption $e");
      rethrow;
    }
  }


  void updateState(){
    Future<List<RestaurantModels>> list = getRestaurantData();
    
  }

// -----------------------------------------------------------------------------------------------------
  // getting  restaurant comments api data 

  Future<List<Rescommentonlyone>> getRestaurantCommentsData(resname) async {
    List<Rescommentonlyone> resList = [];
    try {
      var url = 'https://fuhrer.azurewebsites.net/rescommentname/$resname';
      var request = http.Request('GET', Uri.parse(url));
      // print("checking request $request");
      http.StreamedResponse response = await request.send();
      // print("checking raw data before $response");
      if (response.statusCode==200) {
         var rawData=await response.stream.bytesToString();
        //  print("checking raw data before $rawData");
        Map<String, dynamic> data = Map<String, dynamic>.from(json.decode(rawData));
        // print("checking decode data $data");
        // print(data["tatva"][1]["comment"]);
        // print(data["tatva"][0]['comment']);
        // for (var element in data["tatva"]) { 
        //   print("checking for each$element");
          
        //  Rescommentonlyone modeldata =  Rescommentonlyone.fromJson(element);
        //  resList.add(modeldata);  
        //  print("checking model data in http $modeldata");
        // resList.add(modeldata);
        // print("checking resList $resList");
        // }
        Rescommentonlyone modeldata =  Rescommentonlyone.fromJson(data);
        resList.add(modeldata);  
        //  print("checking model data in http $modeldata");
        // print("checking resList $resList");
        

        
      return resList;
      }else{
        print(response.reasonPhrase);
         print("get in to else in http $response");
        return [];
      }
      
    } catch (e) {
      print("exemption: $e");
      print('excemption catched');
      throw e.toString();
    }
  }


// -----------------------------------------------------------------------------------------------------
  // getting  users api data 

Future<List<Usermodel>> getUserData(id) async {
  print("function called");
    List<Usermodel> resList = [];
    try {
      var url = 'https://fuhrer.azurewebsites.net/user/$id';
      var request = http.Request('GET', Uri.parse(url));
      //  print("checking request data $request");
      http.StreamedResponse response = await request.send();
      // print("checking response data $response");
      if (response.statusCode==200) {
        // print("200");
         var rawData=await response.stream.bytesToString();
        //  print("checking raw data $rawData");
        // 
         Map<String, dynamic> data = Map<String, dynamic>.from(json.decode(rawData));
         Usermodel modeldata =  Usermodel.fromJson(data);
         print("checking raw decode data $data");
        //  print("checking modeldata $modeldata");
        resList.add(modeldata);
        print("resList $resList");
      return resList;
      }else{
        print("not 200");
        print("exemption getUserData");
         print(response.reasonPhrase);
        return [];
      }
      
    } catch (e) {
      print("exemption getUserData catch $e");
      throw e;
    }
  }

  // ------------------------------------------------------------------------------------
  // post user data
  // Function to perform the POST request
Future<void> postData(String url, Map<String, String> body) async {
  final user = FirebaseAuth.instance.currentUser;
  final userid = user?.uid;
  final username = user!.email;
  // final =  
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
    final response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode != 200) {
      throw Exception('Failed to post data');
    }
  } catch (e) {
    print(e.toString());
  }
}

}