import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
   const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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

   Future<LatLng?> getUserLocation() async {
     LocationData? currentLocation;
     final location = Location();
     try {
       currentLocation = await location.getLocation();
       final lat = currentLocation.latitude;
       final lng = currentLocation.longitude;
       final center = LatLng(lat!, lng!);
       return center;
     } on Exception {
       currentLocation = null;
       return null;
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: getUserLocation,
        child: const Icon(Icons.location_on,color: Colors.black,),
      ),
    );
  }
}
