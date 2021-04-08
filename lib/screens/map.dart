import 'package:upchar/global/global.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  void initState() {
    if (destination == true) {
      marker.add(Marker(
          infoWindow: InfoWindow(title: marid),
          markerId: MarkerId(
            marid,
          ),
          position: destinationlatlng));
    }
    super.initState();
  }

  Set<Marker> marker = Set();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
          zoom: 10,
          target: destination == true
              ? destinationlatlng
              : LatLng(userLocation.latitude, userLocation.longitude)),
      compassEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: marker,
    );
  }
}
