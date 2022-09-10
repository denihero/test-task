import 'dart:async';

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

  late LocationData currentLocation;
  late PermissionStatus permission;

  void _onMapCreated(GoogleMapController controller) {
    setState((){
      mapController = controller;
    });
  }

   Future<LatLng?> getUserLocation() async {
     try {
       currentLocation = await _location.getLocation();
       final lat = currentLocation.latitude;
       final lng = currentLocation.longitude;
       final center = LatLng(lat!, lng!);
       mapController.animateCamera(
           CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(currentLocation.latitude ?? 0,currentLocation.longitude ?? 0 ),zoom: 15))
       );
       return center;
     } on Exception {
       return null;
     }
   }

  final Set<Marker> markers = {
    const Marker( //add first marker
      markerId: MarkerId('Аль фараби'),
      position: LatLng(43.23672076148338, 76.88892877135433), //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    )
  };


  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: markers,
            zoomGesturesEnabled: true,
            tiltGesturesEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.terrain,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: SizedBox(
              height: 40,
              width: 200,
              child: TextFormField(
                decoration: const InputDecoration(
                   filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(224,230,237, 0.1)
                        )),
                    hintText: 'Поик',
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
          ),


        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          await getUserLocation();
        },
        child: const Icon(Icons.location_on,color: Colors.black,),
      ),
    );
  }
}
