import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/utils/constants.dart';
// Make sure to import the business model

class MapScreenPage extends StatefulWidget {
  final List<BusinessModel> businesses;

  const MapScreenPage({required this.businesses, Key? key}) : super(key: key);

  @override
  State<MapScreenPage> createState() => _MapScreenPageState();
}

class _MapScreenPageState extends State<MapScreenPage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(17.50490384102665, 78.46833444010403),
    zoom: 10.3,
  );

  late final Set<Marker> _markers;

  @override
  void initState() {
    super.initState();
    _markers = _createMarkers();
  }

  Set<Marker> _createMarkers() {
    return widget.businesses.map((business) {
      return Marker(
        markerId: MarkerId(business.businessUid),
        position: LatLng(business.latitude, business.longitude),
        infoWindow: InfoWindow(
          title: business.businessName,
          snippet: business.category,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GoogleMap(
        markers: _markers,
        mapType: MapType.normal,
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}
