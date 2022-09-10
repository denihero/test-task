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
      body: Stack(
        children: [
          GoogleMap(
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
        onPressed: getUserLocation,
        child: const Icon(Icons.location_on,color: Colors.black,),
      ),
    );
  }
}
