

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sssv1/network_calling/http.dart';

// class LiveUserLocation extends ChangeNotifier{
//
//   double? latitude;
//   double? longitude;
//   String? locationName;
//
//
//   void getCurrentLocation() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     print("serviceEnabled");
//     // Location services are disabled, show a dialog or prompt to enable them
//     // You can use a package like 'fluttertoast' or 'flutter_dialogs' to display a message
//     // to the user indicating that location services need to be enabled.
//     // Example using 'fluttertoast':
//     // Fluttertoast.showToast(msg: 'Please enable location services.');
//
//     // Handle the scenario where location services are not enabled
//
//     return;
//   }
//
//   permission = await Geolocator.checkPermission();
//   print(permission);
//   print("permission");
//   if (permission == LocationPermission.denied) {
//
//     permission = await Geolocator.requestPermission();
//     if (permission != LocationPermission.whileInUse &&
//         permission != LocationPermission.always) {
//       // Handle the scenario where the user denies permission
//       return;
//     }
//   }
//
//   if (permission == LocationPermission.deniedForever) {
//     // Handle the scenario where the user has permanently denied permission
//     return;
//   }
//
//   Position position = await Geolocator.getCurrentPosition(
//     desiredAccuracy: LocationAccuracy.high,
//   );
//
//  latitude = position.latitude;
//  longitude = position.longitude;
//  locationName = await Http().getLocationName(latitude!,longitude!,"AIzaSyBIp8U5x3b2GVj1cjNU3N6funOz_tEUAdk");
//  notifyListeners();
//
//   print(latitude);
//   print(longitude);
//   print(position);
//
//   // Use the latitude and longitude in your application as needed
// }
//
// }

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LiveUserLocation extends ChangeNotifier {
  double? latitude;
  double? longitude;
  String? locationName;

  Future<bool> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Notify user to enable location services
      // You can use a package like 'fluttertoast' or 'flutter_dialogs' to display a message
      // Example: Fluttertoast.showToast(msg: 'Please enable location services.');
      return false;
    }

    // Check and request location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        // Permission denied, cannot proceed
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle the scenario where the user has permanently denied permission
      // You might want to show a dialog instructing the user to enable permissions in settings
      return false;
    }

    // Get current position with high accuracy
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude = position.latitude;
      longitude = position.longitude;

      // Example API call to fetch location name
      locationName = await _getLocationName(latitude!, longitude!);

      // Notify listeners about the location update
      notifyListeners();

      return true;
    } catch (e) {
      // Handle potential errors, such as location service errors
      // Example: Log the error or display a message to the user
      return false;
    }
  }

  Future<String?> _getLocationName(double latitude, double longitude) async {
    locationName = await Http().getLocationName(latitude,longitude,"AIzaSyBIp8U5x3b2GVj1cjNU3N6funOz_tEUAdk");
    // Replace this with your actual implementation to get the location name
    // Example: Use an API call or a reverse geocoding service
    return locationName;
  }
}
