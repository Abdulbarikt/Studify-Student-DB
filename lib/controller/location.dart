import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  String currentAddress = "Location";
  LocationPermission? permission;

  Future<void> getLocation() async {
    bool servicesEnabled;

    servicesEnabled = await Geolocator.isLocationServiceEnabled();
    if (!servicesEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position currentPosition = await Geolocator.getCurrentPosition();

    List<Placemark> placeMarks = await placemarkFromCoordinates(
        currentPosition.latitude, currentPosition.longitude);
    Placemark place = placeMarks[0];

    currentAddress = "${place.locality}, ${place.country}";

    notifyListeners();

    print(currentAddress);
    print(currentPosition);
  }

  void clearCurrentAddress() {
    currentAddress = "Location";
    notifyListeners();
  }
}
