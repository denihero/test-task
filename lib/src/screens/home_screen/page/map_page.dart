import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:test_task/logic/restaurant_cubit/restaurant_cubit.dart';
import 'dart:ui' as ui;

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
  BitmapDescriptor myIcon = BitmapDescriptor.defaultMarker;

  void _onMapCreated(GoogleMapController controller) async {
    setState(() {
      mapController = controller;
    });
  }

  Future<LatLng?> getUserLocation() async {
    try {
      currentLocation = await _location.getLocation();
      final lat = currentLocation.latitude;
      final lng = currentLocation.longitude;
      final center = LatLng(lat!, lng!);
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(
              currentLocation.latitude ?? 0, currentLocation.longitude ?? 0),
          zoom: 15)));
      return center;
    } on Exception {
      return null;
    }
  }

  final Set<Marker> markers = {};

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(64, 64)),
            'assets/icons/vector.png')
        .then((value) => myIcon = value);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RestaurantCubit, RestaurantState>(
        builder: (context, state) {
          if (state is RestaurantSuccess) {
            final restMark = state.restaurant.restaurants;
            for (var i = 0; i < restMark!.length; i++) {
              markers.add(Marker(
                //add first marker
                markerId: MarkerId('${restMark[i].title}'),
                position: LatLng(restMark[i].coords!.latitude!,
                    restMark[i].coords!.longitude!), //position of marker
                infoWindow: InfoWindow(
                    //popup info
                    title: '${restMark[i].coords?.addressName}',
                    snippet: '${restMark[i].title}'),
                icon: myIcon, //Icon for Marker
              ));
            }
            return Stack(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(224, 230, 237, 0.1))),
                          hintText: '????????',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is RestaurantLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RestaurantError) {
            return const Center(
              child: Text('Something get wrong'),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          await getUserLocation();
        },
        child: const Icon(
          Icons.location_on,
          color: Colors.black,
        ),
      ),
    );
  }
}
