import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../utils/urls.dart';
import 'package:sssv1/models/rescomments_models.dart';
import 'package:sssv1/models/restaurant.dart';
import 'package:sssv1/models/searchlist_models.dart';

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
      http.StreamedResponse response = await request.send();
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

}