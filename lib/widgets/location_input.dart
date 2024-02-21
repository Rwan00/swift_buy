import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

import '../models/address_model.dart';
import '../screens/map_screen.dart';
import '../theme/fonts.dart';

class LocationInput extends StatefulWidget {
  final void Function(PlaceLocation location) onSelectedLocation;
  const LocationInput({required this.onSelectedLocation, super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  bool _isLoading = false;

  String get locationImage {
    if (_pickedLocation == null) {
      return "";
    }

    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;
    return "https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:Z%7C$lat,$lng&key=AIzaSyDWYIwIwT2Cx7maujw2kxbcvbFKhIGhLOE";
  }

  void _savePlace(double lat, double lng) async {
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyDWYIwIwT2Cx7maujw2kxbcvbFKhIGhLOE");
    final res = await http.get(url);
    final resData = json.decode(res.body);
    final address = resData["results"][0]["formatted_address"];
    setState(() {
      _pickedLocation =
          PlaceLocation(latitude: lat, longitude: lng, address: address);
      _isLoading = false;
    });

    widget.onSelectedLocation(_pickedLocation!);
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isLoading = true;
    });

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;

    if (lat == null || lng == null) {
      return;
    }

    log(locationData.longitude.toString());
    log(locationData.latitude.toString());

    _savePlace(lat, lng);
  }

  void _selectOnMap() async {
    final LatLng? mapLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        builder: (context) => const MapScreen(),
      ),
    );
    if (mapLocation == null) {
      return;
    }
    _savePlace(mapLocation.latitude, mapLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      "No Location Choosen!",
      style:subTitle,
      textAlign: TextAlign.center,
    );

    if (_pickedLocation != null) {
      previewContent = 
      Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    if (_isLoading) {
      previewContent = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: [
        Text(
              _pickedLocation == null? "Set Your Location": _pickedLocation!.address,
              style: subTitle,
            ),
            const SizedBox(
              height: 16,
            ),
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          alignment: Alignment.center,
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: Text(
                "Current Location",
                style: subTitle,
              ),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: const Icon(Icons.map),
              label: Text(
                "Select On Map",
                style: subTitle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
