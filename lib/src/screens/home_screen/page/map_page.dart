import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatelessWidget {
   MapPage({Key? key}) : super(key: key);

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(420.5937, 78.9629);
  final Location _location = Location();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _location.onLocationChanged.listen((LocationData? event) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(event?.latitude ?? 0,event?.longitude ?? 0 ),zoom: 15))
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,

        ),
      ),
    );
  }
}
