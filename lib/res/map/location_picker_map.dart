import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationPickerMap extends StatefulWidget {
  @override
  _LocationPickerMapState createState() => _LocationPickerMapState();
}

class _LocationPickerMapState extends State<LocationPickerMap> {
  GoogleMapController? _mapController;
  LatLng? _pickedLocation;
  final Location _location = Location();

  // Future<void> _getUserLocation() async {
  //   try {
  //     final locData = await _location.getLocation();
  //     setState(() {
  //       _pickedLocation = LatLng(locData.latitude!, locData.longitude!);
  //     });
  //     _mapController?.animateCamera(
  //       CameraUpdate.newLatLngZoom(
  //         LatLng(locData.latitude!, locData.longitude!),
  //         15,
  //       ),
  //     );
  //   } catch (e) {
  //     print("Error getting location: $e");
  //   }
  // }
  Future<void> _getUserLocation() async {
    try {
      final hasPermission = await _location.hasPermission();
      if (hasPermission == PermissionStatus.denied) {
        final granted = await _location.requestPermission();
        if (granted != PermissionStatus.granted) {
          print("Location permission not granted");
          return;
        }
      }

      final serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        final enabled = await _location.requestService();
        if (!enabled) {
          print("Location services are not enabled");
          return;
        }
      }

      final locData = await _location.getLocation();
      setState(() {
        _pickedLocation = LatLng(locData.latitude!, locData.longitude!);
      });

      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(locData.latitude!, locData.longitude!),
          15,
        ),
      );
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<bool> _checkLocationServices() async {
    final serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      return await _location.requestService();
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a Location'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (_pickedLocation != null) {
                Navigator.of(context).pop(_pickedLocation);
              }
            },
          ),
        ],
      ),
      body: FutureBuilder<bool>(
        future: _checkLocationServices(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !(snapshot.data ?? false)) {
            return const Center(child: Text('Please enable location services'));
          } else if (_pickedLocation == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _pickedLocation!,
              zoom: 15,
            ),
            onMapCreated: (controller) => _mapController = controller,
            onTap: (location) {
              setState(() {
                _pickedLocation = location;
              });
            },
            markers: _pickedLocation != null
                ? {
              Marker(
                markerId: MarkerId('pickedLocation'),
                position: _pickedLocation!,
              ),
            }
                : {},
          );
        },
      ),

      // body: _pickedLocation == null
      //     ? const Center(child: CircularProgressIndicator())
      //     : GoogleMap(
      //   initialCameraPosition: CameraPosition(
      //     target: _pickedLocation!,
      //     zoom: 15,
      //   ),
      //   onMapCreated: (controller) => _mapController = controller,
      //   onTap: (location) {
      //     setState(() {
      //       _pickedLocation = location;
      //     });
      //   },
      //   markers: _pickedLocation != null
      //       ? {
      //     Marker(
      //       markerId: MarkerId('pickedLocation'),
      //       position: _pickedLocation!,
      //     ),
      //   }
      //       : {},
      // ),
    );
  }
}
