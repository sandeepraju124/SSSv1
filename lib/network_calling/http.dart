import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
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
        List<dynamic> _data = jsonDecode(rawData);
        _data.forEach((element) { 
         RestaurantModels modeldata =  RestaurantModels.fromJson(element);
         resList.add(modeldata);
        
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

}