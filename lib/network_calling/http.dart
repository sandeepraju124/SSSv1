import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:sssv1/models/services_model.dart';
import 'package:sssv1/models/user_models.dart';
import 'package:sssv1/providers/service_provider.dart';
import '../utils/urls.dart';
import 'package:sssv1/models/rescomments_models.dart';
import 'package:sssv1/models/restaurant.dart';
import 'package:sssv1/models/searchlist_models.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetData{

// getting restaurant data 5 in main page

  // Future<List<RestaurantModels>> getRestaurantData() async {
  //   List<RestaurantModels> resList = [];
  //   try {
  //     var url = 'https://script.google.com/macros/s/AKfycby1kxJDHbw4-MAfoA2ZkdkMeFvCIpREeknhqKIDrIAeJc9zFm6vtsO29YxayCjQqDRY/exec';
  //     var request = http.Request('GET', Uri.parse(url));
  //     http.StreamedResponse response = await request.send();
  //     if (response.statusCode==200) {
  //        var rawData=await response.stream.bytesToString();
  //       //  print("checking raw data $rawData");
  //       List<dynamic> _data = jsonDecode(rawData);
  //       // print("checking raw decode data $_data");
  //       _data.forEach((element) { 
  //         // print("checking each element data $element");
  //        RestaurantModels modeldata =  RestaurantModels.fromJson(element);
  //       //  print("checking model data $modeldata");
  //        resList.add(modeldata);
  //       // print("checking resList $resList");
  //       });
  //     return resList;
  //     }else{
  //        print(response.reasonPhrase);
  //       return [];
  //     }
      
  //   } catch (e) {
  //     // print("exemption $e");
  //     throw e;
  //   }
  // }

Future<List<ServicesModel>> getData() async {
    List<ServicesModel> resList = [];
    try {
      var url = 'https://bitebest.azurewebsites.net/services/restaurant';
      var request = http.Request('GET', Uri.parse(url));
      http.StreamedResponse response = await request.send();
      if (response.statusCode==200) {
         var rawData=await response.stream.bytesToString();
        //  print("checking raw data $rawData");
        List<dynamic> _data = jsonDecode(rawData);
        // print("checking raw decode data $_data");
        _data.forEach((element) { 
          // print("checking each element data $element");
         ServicesModel modeldata =  ServicesModel.fromJson(element);
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



// get single service data
// api_service.dart

Future<Map<String, dynamic>> getSingleServiceData(id) async {
  final response = await http.get(Uri.parse("https://bitebest.azurewebsites.net/serviceid/$id"));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to retrieve data');
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
        //  print("http called");
        
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


  // void updateState(){
  //   Future<List<RestaurantModels>> list = getRestaurantData();
    
  // }

// -----------------------------------------------------------------------------------------------------
  // getting  restaurant comments api data 

  Future<List<CommentsModel>> getRestaurantCommentsData(resname) async {
    List<CommentsModel> resList = [];
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
        CommentsModel modeldata =  CommentsModel.fromJson(data);
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

// modeified above get comment code

late Future<List<Comment>> commentsvar;

  set commentsFuture(Future<List<Comment>> value) {
      commentsvar = value;

  }

  int getCommentsLength() {
  int length = 0;
  commentsvar.then((list) => length = list.length);
  return length;
}

Future<List<Comment>> getComments(String serviceid) async {
  print("getComments called");
  final response = await http.get(Uri.parse("https://bitebest.azurewebsites.net/commentsid/$serviceid"));
  print("Response status code: ${response.statusCode}");
  print("Response body: ${response.body}");

  if (response.statusCode == 200) {
    var body = json.decode(response.body);
    print("body $body");
    var commentsJson = body["comments"];
    print("commentsJson $commentsJson");
    // List<Comment> comments = commentsJson.map((commentJson) => Comment.fromJson(commentJson)).toList();
    List<Comment> comments = (commentsJson as List<dynamic>).map((commentJson) => Comment.fromJson(commentJson as Map<String, dynamic>)).toList();
    // List<Comment> comments = commentsJson.map((commentJson) => Comment.fromJson(commentJson as Map<String, dynamic>)).toList();
    // commentsvar = comments as Future<List<Comment>>;


    print("comments $comments");
    return comments;
  } else {
    throw Exception('Failed to load comments');
  }
}




// -----------------------------------------------------------------------------------------------------
  // getting  users api data 


Future<UserModel> fetchUsersData() async {
  final user = FirebaseAuth.instance.currentUser;
  final userid = user?.uid;  //d8JpVQttpad6s5maOboGC0iCVaB3
  final apiUrl = Uri.parse('https://bitebest.azurewebsites.net/user/$userid'); 
  final response = await http.get(apiUrl);
  print("response $response");
  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    print("responseBody $responseBody");
    return UserModel.fromJson(responseBody);
  } else {
    throw Exception('Failed to fetch data');
  }
}

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
    final response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode != 200) {
      throw Exception('Failed to post data');
    }
  } catch (e) {
    print(e.toString());
  }
}

}