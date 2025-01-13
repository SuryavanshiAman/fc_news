//
// import 'dart:convert';
// import 'package:fc_news/res/color-const.dart';
// import 'package:fc_news/res/custom_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
//
// class LocationBottomSheet extends StatefulWidget {
//   const LocationBottomSheet({Key? key}) : super(key: key);
//
//   @override
//   State<LocationBottomSheet> createState() => _LocationBottomSheetState();
// }
//
// class _LocationBottomSheetState extends State<LocationBottomSheet> {
//   final TextEditingController searchCont = TextEditingController();
//   List<dynamic> suggestions = [];
//   bool isLoading = false;
//
//   // static const String googleApiKey = "YOUR_GOOGLE_API_KEY_HERE";
//
//   String selectedLocation = "Write here my selected location";
//
//   @override
//   void initState() {
//     super.initState();
//     fetchCurrentLocation();
//   }
//
//   static const String googleApiKey = "AIzaSyCOqfJTgg1Blp1GIeh7o8W8PC1w5dDyhWI";
//
//   Future<void> fetchSuggestions(String query) async {
//     if (query.isEmpty) return;
//
//     setState(() {
//       isLoading = true;
//     });
//
//     final url =
//         "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$googleApiKey&components=country:IN";
//     print("Fetching suggestions: $url");
//
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final rawSuggestions = data['predictions'] as List;
//
//         // Fetch additional details for each suggestion
//         List<Map<String, dynamic>> enrichedSuggestions = [];
//         for (var suggestion in rawSuggestions) {
//           final placeId = suggestion['place_id'];
//           final details = await fetchPlaceDetailsForSuggestion(placeId);
//           enrichedSuggestions.add({
//             'description': suggestion['description'],
//             'place_id': placeId, // Add the place_id here
//             'district': details['district'] ?? '',
//             'pincode': details['pincode'] ?? '',
//             'latitude': details['latitude'] ?? 0.0,
//             'longitude': details['longitude'] ?? 0.0,
//           });
//         }
//
//         setState(() {
//           suggestions = enrichedSuggestions;
//         });
//       } else {
//         throw Exception("Failed to load suggestions");
//       }
//     } catch (e) {
//       print("Error fetching suggestions: $e");
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   Future<Map<String, dynamic>> fetchPlaceDetailsForSuggestion(String placeId) async {
//     final url =
//         "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$googleApiKey";
//     print("Fetching place details: $url");
//
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final addressComponents = data['result']['address_components'];
//         final geometry = data['result']['geometry']['location'];
//
//         String district = '';
//         String pincode = '';
//         double latitude = geometry['lat'];
//         double longitude = geometry['lng'];
//
//         // Extract district and pincode
//         for (var component in addressComponents) {
//           if (component['types'].contains('administrative_area_level_3')) {
//             district = component['long_name'];
//           }
//           if (component['types'].contains('postal_code')) {
//             pincode = component['long_name'];
//           }
//         }
//
//         return {
//           'district': district,
//           'pincode': pincode,
//           'latitude': latitude,
//           'longitude': longitude,
//         };
//       } else {
//         throw Exception("Failed to fetch place details");
//       }
//     } catch (e) {
//       print("Error fetching place details: $e");
//       return {};
//     }
//   }
//   // String selectedLocation = "Write here my selected location";
//   Future<void> fetchCurrentLocation() async {
//     try {
//       LocationPermission permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied ||
//           permission == LocationPermission.deniedForever) {
//         throw Exception("Location permissions are denied");
//       }
//
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//
//       final latitude = position.latitude;
//       final longitude = position.longitude;
//
//       // Reverse geocoding to get district and pincode
//       final url =
//           "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$googleApiKey";
//       print("Wwwww:$url");
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final addressComponents =
//             data['results'][0]['address_components'] ?? [];
//
//         String district = '';
//         String pincode = '';
//
//         for (var component in addressComponents) {
//           if (component['types'].contains('administrative_area_level_3')) {
//             district = component['long_name'];
//           }
//           if (component['types'].contains('postal_code')) {
//             pincode = component['long_name'];
//           }
//         }
//
//         print("District: $district");
//         print("Pincode: $pincode");
//         print("Latitude: $latitude, Longitude: $longitude");
//
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(
//               "District: $district\nPincode: $pincode\nLatLng: ($latitude, $longitude)"),
//         ));
//       } else {
//         throw Exception("Failed to reverse geocode location");
//       }
//     } catch (e) {
//       print("Error fetching location: $e");
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Error: $e"),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             selectedLocation,
//             style: const TextStyle(
//               fontFamily: "nunito",
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           CustomTextField(
//             controller: searchCont,
//             label: "Search Place....",
//             hintColor: AppColor.labelColor,
//             hintSize: 14,
//             contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
//             height: 50,
//             filled: false,
//             border: Border.all(color: AppColor.gray.withOpacity(0.3)),
//             borderRadius: BorderRadius.circular(15),
//             fieldRadius: BorderRadius.circular(15),
//             onChanged: (String value) {
//               fetchSuggestions(value);
//             },
//           ),
//           if (isLoading)
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: CircularProgressIndicator(),
//             ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: suggestions.length,
//               itemBuilder: (context, index) {
//                 final suggestion = suggestions[index];
//                 return ListTile(
//                   onTap: () {
//                     if (suggestion['place_id'] != null) {
//                       fetchPlaceDetailsForSuggestion(suggestion['place_id']).then((details) {
//                         // elementList.setDistrict(details['district']);
//                         setState(() {
//                           selectedLocation =
//                           "${suggestion['description']} (${details['district']}, ${details['pincode']})";
//                         });
//                       }).catchError((e) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Error fetching details: $e')),
//                         );
//                       });
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Place ID not available')),
//                       );
//                     }
//                   },
//                   leading: const Icon(Icons.location_on),
//                   title: Text(
//                     suggestion['district'] ?? 'No description available',
//                     style: const TextStyle(
//                       fontFamily: "nunito",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 );
//
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: fetchCurrentLocation,
//             child: const Text("Use Current Location"),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// void showLocationBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (BuildContext context) {
//       return DraggableScrollableSheet(
//         expand: false,
//         builder: (_, scrollController) => Container(
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           ),
//           child: LocationBottomSheet(),
//         ),
//       );
//     },
//   );
// }
