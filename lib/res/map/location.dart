// // import 'package:fc_news/main.dart';
// // import 'package:fc_news/res/color-const.dart';
// // import 'package:fc_news/res/custom_text_field.dart';
// // import 'package:fc_news/res/map/location_permission_handler.dart';
// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// //
// // class LocationScreen extends StatefulWidget {
// //   const LocationScreen({super.key});
// //
// //   @override
// //   State<LocationScreen> createState() => _LocationScreenState();
// // }
// //
// // class _LocationScreenState extends State<LocationScreen> {
// //   TextEditingController searchCont= TextEditingController();
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title:const Text(
// //           "Location",
// //           style: TextStyle(fontFamily: "NewYork", fontWeight: FontWeight.w600),
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
// //         child: Column(
// //           children: [
//             CustomTextField(
//               controller: searchCont,
//               label: "Search Place....",
//               hintColor: AppColor.labelColor,
//               hintSize: 14,
//               contentPadding: const EdgeInsets.only(bottom: 10,left: 10),
//               // width: width >= 450 ? width * 0.25 : width * 0.65,
//               height: 50,
//               maxLength: 10,
//               filled: false,
//               border: Border.all(color: AppColor.gray.withOpacity(0.3)),
//               borderRadius: BorderRadius.circular(15),
//               fieldRadius: BorderRadius.circular(15),
//               onChanged: (String value){
//                 print(value.toString());
//                 setState(() {
//
//                 });
//               },
//             ),
// //             Visibility(
// //                 visible: searchCont.text.isEmpty?false:true,
// //                 child: Expanded(
// //               child: ListView.builder(
// //                 itemCount: 5,
// //                   shrinkWrap: true,
// //                   itemBuilder: (context,index){
// //                 return ListTile(
// //                   onTap: (){},
// //                   leading: Icon(Icons.location_on),
// //                   title: Text(
// //                     "Location",
// //                     style: TextStyle(fontFamily: "nunito", fontWeight: FontWeight.w600),
// //                   ),
// //                 );
// //               }),
// //             )),
// //             Visibility(
// //               visible: searchCont.text.isEmpty?true:false,
// //               child: Padding(
// //                 padding: const EdgeInsets.only(top: 20.0),
// //                 child: ElevatedButton(
// //                   onPressed:
// //                       (){
// //                     determinePosition().then((value){}).onError((error,StackTrace){
// //
// //                       print("Location Error:${
// //                       error.toString()
// //                       }");
// //                     });
// //                   },
// //                   child:  Row(
// //                     children: [
// //                       const Icon(Icons.my_location_outlined,color: AppColor.secondaryColor,),
// //                       SizedBox(width: width*0.2),
// //                       const Center(child: Text("Current location",style: TextStyle(color: AppColor.secondaryColor,),))
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:fc_news/res/color-const.dart';
// import 'package:fc_news/res/custom_text_field.dart';
//
// class LocationScreen extends StatefulWidget {
//   const LocationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LocationScreen> createState() => _LocationScreenState();
// }
//
// class _LocationScreenState extends State<LocationScreen> {
//   TextEditingController searchCont = TextEditingController();
//   List<String> locationSuggestions = []; // Mock suggestions or fetch from API
//   String currentLocation = "";
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Future<void> _fetchCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//       setState(() {
//         currentLocation =
//         "Lat: ${position.latitude}, Long: ${position.longitude}";
//       });
//     } catch (e) {
//       print("Error fetching location: $e");
//     }
//   }
//
//   void _getSuggestions(String query) {
//     // Replace this with Google Places API or similar service
//     setState(() {
//       locationSuggestions = List.generate(
//         5,
//             (index) => "$query Suggestion $index",
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Location",
//           style: TextStyle(fontFamily: "NewYork", fontWeight: FontWeight.w600),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//         child: Column(
//           children: [
//             CustomTextField(
//               controller: searchCont,
//               label: "Search Place....",
//               hintColor: AppColor.labelColor,
//               hintSize: 14,
//               contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
//               height: 50,
//               maxLength: 50,
//               filled: false,
//               border: Border.all(color: AppColor.gray.withOpacity(0.3)),
//               borderRadius: BorderRadius.circular(15),
//               fieldRadius: BorderRadius.circular(15),
//               onChanged: (String value) {
//                 _getSuggestions(value);
//               },
//             ),
//             Visibility(
//               visible: locationSuggestions.isNotEmpty,
//               child: Expanded(
//                 child: ListView.builder(
//                   itemCount: locationSuggestions.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       onTap: () {
//                         setState(() {
//                           currentLocation = locationSuggestions[index];
//                           searchCont.clear();
//                           locationSuggestions.clear();
//                         });
//                       },
//                       leading: const Icon(Icons.location_on),
//                       title: Text(
//                         locationSuggestions[index],
//                         style: const TextStyle(
//                           fontFamily: "Nunito",
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             if (locationSuggestions.isEmpty)
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: ElevatedButton(
//                   onPressed: _fetchCurrentLocation,
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.my_location_outlined,
//                         color: AppColor.secondaryColor,
//                       ),
//                       SizedBox(width: 10),
//                       Text(
//                         "Current Location",
//                         style: TextStyle(color: AppColor.secondaryColor),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             if (currentLocation.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: Text(
//                   "Selected Location: $currentLocation",
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
///
// import 'dart:convert';
// import 'package:fc_news/res/color-const.dart';
// import 'package:fc_news/res/custom_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
//
// class LocationScreen extends StatefulWidget {
//   const LocationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LocationScreen> createState() => _LocationScreenState();
// }
//
// class _LocationScreenState extends State<LocationScreen> {
//   final TextEditingController searchCont = TextEditingController();
//   List<dynamic> suggestions = [];
//   bool isLoading = false;
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
//     print("Aman:$url");
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           suggestions = data['predictions'];
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
//       print("Current Location: Latitude: ${position.latitude}, Longitude: ${position.longitude}");
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(
//           "Current Location: (${position.latitude}, ${position.longitude})",
//         ),
//       ));
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
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Location",
//           style: TextStyle(fontFamily: "NewYork", fontWeight: FontWeight.w600),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             CustomTextField(
//               controller: searchCont,
//               label: "Search Place....",
//               hintColor: AppColor.labelColor,
//               hintSize: 14,
//               contentPadding: const EdgeInsets.only(bottom: 10,left: 10),
//               height: 50,
//               maxLength: 10,
//               filled: false,
//               border: Border.all(color: AppColor.gray.withOpacity(0.3)),
//               borderRadius: BorderRadius.circular(15),
//               fieldRadius: BorderRadius.circular(15),
//               onChanged: (String value){
//                 fetchSuggestions(value);
//               },
//             ),
//             if (isLoading)
//               const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 child: CircularProgressIndicator(),
//               ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: suggestions.length,
//                 itemBuilder: (context, index) {
//                   final suggestion = suggestions[index];
//                   return ListTile(
//                     onTap: () {
//                       print("Selected: ${suggestion['description']}");
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                         content: Text("Selected: ${suggestion['description']}"),
//                       ));
//                     },
//                     leading: const Icon(Icons.location_on),
//                     title: Text(
//                       suggestion['description'],
//                       style: const TextStyle(
//                         fontFamily: "nunito",
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: fetchCurrentLocation,
//               child: const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.my_location_outlined,color: AppColor.secondaryColor,),
//                   SizedBox(width: 10),
//                   Text("Current Location",style:TextStyle(color: AppColor.secondaryColor,)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
///
import 'dart:convert';
import 'package:fc_news/controller/profile_controller.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/res/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCurrentLocation();
  }
  final TextEditingController searchCont = TextEditingController();
  List<dynamic> suggestions = [];
  bool isLoading = false;

  static const String googleApiKey = "AIzaSyCOqfJTgg1Blp1GIeh7o8W8PC1w5dDyhWI";

  Future<void> fetchSuggestions(String query) async {
    if (query.isEmpty) return;

    setState(() {
      isLoading = true;
    });

    final url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$googleApiKey&components=country:IN";
    print("Fetching suggestions: $url");

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final rawSuggestions = data['predictions'] as List;

        // Fetch additional details for each suggestion
        List<Map<String, dynamic>> enrichedSuggestions = [];
        for (var suggestion in rawSuggestions) {
          final placeId = suggestion['place_id'];
          final details = await fetchPlaceDetailsForSuggestion(placeId);
          enrichedSuggestions.add({
            'description': suggestion['description'],
            'place_id': placeId, // Add the place_id here
            'district': details['district'] ?? '',
            'pincode': details['pincode'] ?? '',
            'latitude': details['latitude'] ?? 0.0,
            'longitude': details['longitude'] ?? 0.0,
          });
        }

        setState(() {
          suggestions = enrichedSuggestions;
        });
      } else {
        throw Exception("Failed to load suggestions");
      }
    } catch (e) {
      print("Error fetching suggestions: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<Map<String, dynamic>> fetchPlaceDetailsForSuggestion(String placeId) async {
    final url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$googleApiKey";
    print("Fetching place details: $url");

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final addressComponents = data['result']['address_components'];
        final geometry = data['result']['geometry']['location'];

        String district = '';
        String pincode = '';
        double latitude = geometry['lat'];
        double longitude = geometry['lng'];

        // Extract district and pincode
        for (var component in addressComponents) {
          if (component['types'].contains('administrative_area_level_2')) {
            district = component['long_name'];
          }
          if (component['types'].contains('postal_code')) {
            pincode = component['long_name'];
          }
        }

        return {
          'district': district,
          'pincode': pincode,
          'latitude': latitude,
          'longitude': longitude,
        };
      } else {
        throw Exception("Failed to fetch place details");
      }
    } catch (e) {
      print("Error fetching place details: $e");
      return {};
    }
  }
  String selectedLocation = "Write here my selected location";
  Future<void> fetchCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        throw Exception("Location permissions are denied");
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final latitude = position.latitude;
      final longitude = position.longitude;

      // Reverse geocoding to get district and pincode
      final url =
          "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$googleApiKey";
      print("Wwwww:$url");
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final addressComponents =
            data['results'][0]['address_components'] ?? [];

        String district = '';
        String pincode = '';

        for (var component in addressComponents) {
          if (component['types'].contains('administrative_area_level_3')) {
            district = component['long_name'];
          }
          if (component['types'].contains('postal_code')) {
            pincode = component['long_name'];
          }
        }

        print("District: $district");
        print("Pincode: $pincode");
        print("Latitude: $latitude, Longitude: $longitude");

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "District: $district\nPincode: $pincode\nLatLng: ($latitude, $longitude)"),
        ));
      } else {
        throw Exception("Failed to reverse geocode location");
      }
    } catch (e) {
      print("Error fetching location: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final elementList = Provider.of<ProfileController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Location",
          style: TextStyle(fontFamily: "NewYork", fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              selectedLocation,
              style: const TextStyle(
                fontFamily: "nunito",
                fontWeight: FontWeight.w600,
              ),
            ),
            CustomTextField(
              controller: searchCont,
              label: "Search Place....",
              hintColor: AppColor.labelColor,
              hintSize: 14,
              contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
              height: 50,
              filled: false,
              border: Border.all(color: AppColor.gray.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(15),
              fieldRadius: BorderRadius.circular(15),
              onChanged: (String value) {
                fetchSuggestions(value);
              },
            ),
            if (isLoading)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CircularProgressIndicator(),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = suggestions[index];
                  return ListTile(
                    onTap: () {
                      if (suggestion['place_id'] != null) {
                        fetchPlaceDetailsForSuggestion(suggestion['place_id']).then((details) {
                          elementList.setDistrict(details['district']);
                          setState(() {
                            selectedLocation =
                            "${suggestion['description']} (${details['district']}, ${details['pincode']})";
                          });
                        }).catchError((e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error fetching details: $e')),
                          );
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Place ID not available')),
                        );
                      }
                    },
                    leading: const Icon(Icons.location_on),
                    title: Text(
                      suggestion['description'] ?? 'No description available',
                      style: const TextStyle(
                        fontFamily: "nunito",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                    ///
                  //   ListTile(
                  //   onTap: () {
                  //     if (suggestion['place_id'] != null) {
                  //       fetchPlaceDetailsForSuggestion(suggestion['place_id']);
                  //     } else {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(content: Text('Place ID not available')),
                  //       );
                  //     }
                  //   },
                  //   leading: const Icon(Icons.location_on),
                  //   title: Text(
                  //     suggestion['description'] ?? 'No description available',
                  //     style: const TextStyle(
                  //       fontFamily: "nunito",
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // );
                  ///
                  //   ListTile(
                  //   onTap: () {
                  //     if (suggestion['place_id'] != null) {
                  //       fetchPlaceDetailsForSuggestion(suggestion['place_id']);
                  //     } else {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(content: Text('Place ID not available')),
                  //       );
                  //     }
                  //   },
                  //   leading: const Icon(Icons.location_on),
                  //   title: Text(
                  //     suggestion['description'] ?? 'No description available',
                  //     style: const TextStyle(
                  //       fontFamily: "nunito",
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // );

                },
              ),
            ),
            ElevatedButton(
              onPressed: fetchCurrentLocation,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.my_location_outlined,
                    color: AppColor.secondaryColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Current Location",
                    style: TextStyle(color: AppColor.secondaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
