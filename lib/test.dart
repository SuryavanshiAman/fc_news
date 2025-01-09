// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:geolocator/geolocator.dart';
// //
// // class MapScreen extends StatefulWidget {
// //   @override
// //   _MapScreenState createState() => _MapScreenState();
// // }
// //
// // class _MapScreenState extends State<MapScreen> {
// //   late GoogleMapController mapController;
// //   Position? _currentPosition;  // Make _currentPosition nullable
// //
// //   static final CameraPosition _initialPosition =
// //   CameraPosition(target: LatLng(37.7749, -122.4194), zoom: 10);
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _getCurrentLocation();
// //   }
// //
// //   // Fetch the current location using Geolocator
// //   Future<void> _getCurrentLocation() async {
// //     try {
// //       Position position = await Geolocator.getCurrentPosition(
// //           desiredAccuracy: LocationAccuracy.high);
// //       setState(() {
// //         _currentPosition = position;
// //       });
// //     } catch (e) {
// //       print("Error fetching location: $e");
// //       // You could handle error appropriately (e.g., show a message to the user)
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // If location is not yet fetched, show a loading indicator
// //     if (_currentPosition == null) {
// //       return Scaffold(
// //         appBar: AppBar(
// //           title: Text('Google Maps with Location'),
// //         ),
// //         body: Center(child: CircularProgressIndicator()), // Show loading indicator
// //       );
// //     }
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Google Maps with Location'),
// //       ),
// //       body: GoogleMap(
// //         onMapCreated: (GoogleMapController controller) {
// //           mapController = controller;
// //         },
// //         initialCameraPosition: CameraPosition(
// //           target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
// //           zoom: 14,
// //         ),
// //         markers: {
// //           Marker(
// //             markerId: MarkerId('currentLocation'),
// //             position: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
// //           ),
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _getCurrentLocation,
// //         child: Icon(Icons.location_searching),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
//
//
// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController mapController;
//   Position? _currentPosition;  // Make _currentPosition nullable
//
//   static final CameraPosition _initialPosition =
//   CameraPosition(target: LatLng(37.7749, -122.4194), zoom: 10);
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   // Check and request location permission
//   Future<void> _checkAndRequestPermission() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
//       permission = await Geolocator.requestPermission();
//       if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
//         // Handle the case where permission is denied permanently.
//         print("Location permission denied.");
//         return;
//       }
//     }
//     // Permission granted, fetch the location.
//     _getCurrentLocation();
//   }
//
//   // Fetch the current location using Geolocator
//   Future<void> _getCurrentLocation() async {
//     try {
//       // Ensure permissions are granted before getting location.
//       await _checkAndRequestPermission();
//
//       // Now fetch the current position
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         _currentPosition = position;
//       });
//     } catch (e) {
//       print("Error fetching location: $e");
//       // You could show an error message to the user if location couldn't be fetched.
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // If location is not yet fetched, show a loading indicator
//     if (_currentPosition == null) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Google Maps with Location'),
//         ),
//         body: Center(child: CircularProgressIndicator()), // Show loading indicator
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps with Location'),
//       ),
//       body: GoogleMap(
//         onMapCreated: (GoogleMapController controller) {
//           mapController = controller;
//         },
//         initialCameraPosition: CameraPosition(
//           target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
//           zoom: 14,
//         ),
//         markers: {
//           Marker(
//             markerId: MarkerId('currentLocation'),
//             position: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
//           ),
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _getCurrentLocation,
//         child: Icon(Icons.location_searching),
//       ),
//     );
//   }
// }
