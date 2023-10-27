// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sssv1/utils/constants.dart';

class MapScreenPage extends StatefulWidget {
  const MapScreenPage({super.key});

  @override
  State<MapScreenPage> createState() => _MapScreenPageState();
}

class _MapScreenPageState extends State<MapScreenPage> {
  static final _initialCameraPosition = CameraPosition(
      target: LatLng(17.50490384102665, 78.46833444010403), zoom: 11.0);

  static final Marker _markers = Marker(
    markerId: MarkerId('Biryani House'),
    infoWindow: InfoWindow(title: "biryani house"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(17.50490384102665, 78.46833444010403),
  );

  @override
  Widget build(BuildContext context) {
    return
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(
        //       "Directions",
        //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        //     ),
        //     Container(
        //         margin: EdgeInsets.only(left: 10, top: 1),
        //         height: 3, // Adjust the height of the line as needed
        //         width: 70, // Adjust the width of the line as needed
        //         color: tgPrimaryColor // Set the color of the line
        //         ),
        SizedBox(
      height: 400,
      child: GoogleMap(
          markers: {_markers},
          mapType: MapType.normal,
          // myLocationButtonEnabled: false,
          // zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition),
    );
    //   ],
    // );
  }
}
