
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/models/commentsection_models.dart';
import 'package:sssv1/network_calling/http.dart';
import "package:http/http.dart" as http;
import 'package:sssv1/providers/user_review_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:geolocator/geolocator.dart';

import '../models/favourite_models.dart';


class FavouriteProvider extends ChangeNotifier {
  // final TextEditingController _reviewController = TextEditingController();

  List<FavouriteModels> _favourite = [];
  bool _isLoading = false;

  List<FavouriteModels> get favourite => _favourite;
  bool get isLoading => _isLoading;


  // Get comments
  Future<void> getFavourites(String user_id) async {
    // String url = "$baseUrl/favourite/where?user_id=EgwA2GOIGGXAwZqv1YLFbHFdWer1";
    String url = "$baseUrl/favourite/where?user_id=$user_id";


    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        // print("Favourite List: $responseData");
        _favourite = responseData.map((data) => FavouriteModels.fromJson(data)).toList();
        // print("Favourite List: $_favourite");
      }else if (response.statusCode == 404) {
        // If the status code is 400, return an empty list
        _favourite = [];
        print('No favourite found: status code 400');
      }
      else {
        throw Exception('Failed to load comments');
      }
    } catch (error) {
      print(error);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Check if a business is in the favourites list
  bool isFavourite(String businessId) {
    return _favourite.any((fav) => fav.businessId == businessId);
  }

  // Get the favourite ID for a specific business if it exists
  int? getFavouriteId(String businessId) {
    for (var fav in _favourite) {
      if (fav.businessId == businessId) {
        return fav.favouriteId;
      }
    }
    return null; // If not found, return null
  }



  // Future<void> addFavourite(String businessId) async {
  //   final user = await FirebaseAuth.instance.currentUser!;
  //   final String url = '$baseUrl/favourite/where'; // Replace with your API URL
  //   print('User ID: ${user.uid}');
  //   print('Business ID: $businessId');
  //
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode({
  //         'user_id': user.uid,
  //         'business_id': businessId,
  //       }),
  //     );
  //
  //     if (response.statusCode == 201) {
  //       print('Business added to favorites successfully');
  //
  //     } else {
  //       print('Failed to add favorite: ${response.body}');
  //     }
  //   } catch (e) {
  //     print('Error occurred: $e');
  //   }
  // }

  Future<bool> addFavourite(BuildContext context, String businessId) async {
    try {
      _isLoading = true;
      final user = await FirebaseAuth.instance.currentUser!;


      final body = {
        'user_id': user.uid,
        'business_id': businessId,
      };

      print(body);

      final url = Uri.parse("$baseUrl/favourite/where");
      final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

      final response = await http.post(url, headers: headers, body: body);
      // print(response.body);
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Favourite added successfully"),
            behavior: SnackBarBehavior.floating,
          ),
        );

        // Fetch updated comments and display new one on top
        await getFavourites(user.uid);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<bool> deleteFavourite(int favouriteId) async {
    // final String url = '$baseUrl/favourite/where?user_id=EgwA2GOIGGXAwZqv1YLFbHFdWer1'; // Replace with your API URL
    final String url = '$baseUrl/favourite/where?favourite_id=$favouriteId'; // Replace with your API URL
    final user = await FirebaseAuth.instance.currentUser!;

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'favourite_id': favouriteId,
        }),
      );

      if (response.statusCode == 200) {
        print('Favourite removed successfully');
        getFavourites(user.uid);
        return true;

      } else {
        print('Failed to remove favourite: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      return false;
    }
  }
}

