// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_detailing_app/models/booking.dart';
import 'package:mobile_detailing_app/widgets/utils/constants.dart';

// ignore: must_be_immutable
class MapWidget extends StatefulWidget {
  MapWidget({super.key, required this.bookings});

  List<Booking> bookings;

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController? mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            CameraPosition(target: defaultLatLng, zoom: 12.0),
        mapType: MapType.hybrid,
      ),
    );
  }
}
