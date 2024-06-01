import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:sssv1/models/service_models.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';

class ServicesProvider extends ChangeNotifier {
  ServicesModels? _businessdata;
  ServicesModels? get BusinessData => _businessdata;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

// is loading for deleting
  bool _isLoadingDelete = false;
  bool get isLoadingDelete => _isLoadingDelete;

// is loading for upload images
  bool _isLoadingUpload = false;
  bool get isLoadingUpload => _isLoadingUpload;

  Future<void> getMongoBusinessData(String business_uid) async {
    _isLoading = true;
    try {
      // var uri = "https://supernova1137.azurewebsites.net/mongo/business?business_uid=HOMPLUS9PVd3F9W6NEW";
      var uri =
          "https://supernova1137.azurewebsites.net/mongo/business?business_uid=HOMPLUmwIKNIYtSTNEWW";
      // var uri = "$baseUrl/mongo/business?business_uid=$business_uid";
      ServicesModels data = await Http().fetchMongoBusinessData(uri);
      // print("data from provider $data");
      // print("data");
      _businessdata = data;
    } catch (e) {
      print('Error fetching mongo business data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
