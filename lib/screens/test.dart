// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// / import 'package:fluttertoast/fluttertoast.dart';

class LocationTest extends StatefulWidget {
  const LocationTest({super.key});

  @override
  State<LocationTest> createState() => _LocationTestState();
}

class _LocationTestState extends State<LocationTest> {
  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("serviceEnabled");
      // Location services are disabled, show a dialog or prompt to enable them
      // You can use a package like 'fluttertoast' or 'flutter_dialogs' to display a message
      // to the user indicating that location services need to be enabled.
      // Example using 'fluttertoast':
      // Fluttertoast.showToast(msg: 'Please enable location services.');

      // Handle the scenario where location services are not enabled

      return;
    }

    permission = await Geolocator.checkPermission();
    print(permission);
    print("permission");
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // Handle the scenario where the user denies permission
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle the scenario where the user has permanently denied permission
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    double latitude = position.latitude;
    double longitude = position.longitude;

    print(latitude);
    print(longitude);

    // Use the latitude and longitude in your application as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("get location")),
    );
  }
}
