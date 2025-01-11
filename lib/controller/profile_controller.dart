
import 'dart:convert';
import 'dart:io';

import 'package:fc_news/generated/assets.dart';
import 'package:fc_news/utils/routes/routes_name.dart';
import 'package:fc_news/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart'as http;

class ProfileController with ChangeNotifier{
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  File? _image;
  File? get image => _image;
  final picker = ImagePicker();
  void setImage(File? value) {
    _image = value;
    notifyListeners();
  }
  String _district="";

  String get district => _district;

  setDistrict(String value) {
    _district = value;
    notifyListeners();
  }
  String? base64Image;
  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      base64Image = base64Encode(_image!.readAsBytesSync());
      notifyListeners();
    }
  }


  String _currentLocation = "";

  String get currentLocation => _currentLocation;

  setCurrentLocation(String value) {
    _currentLocation = value;
    notifyListeners();
  }
  List<ElementModel> elementList = [
    ElementModel(
        image:Assets.iconAboutUs,
        name: 'About Us',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.aboutUsScreen);
        }),
    ElementModel(
        image: Assets.iconPolicy,
        name: 'Policy',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.policyScreen);
        }),
    ElementModel(
        image: Assets.iconTerms,
        name: 'T&C',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.termsScreen);
        }),
    ElementModel(
        image:Assets.iconLocation,
        name: 'Location',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.locationScreen);
        }),
    ElementModel(
        image:Assets.iconLogout,
        name: 'Logout',
        onTap: (context){
          Utils.showLogOutConfirmation(context);
        }),


  ];
  List<dynamic> _suggestions = [];

  List<dynamic> get suggestions => _suggestions;

  setSuggestions(List<dynamic> value) {
    _suggestions = value;
    notifyListeners();
  }
  static const String googleApiKey = "AIzaSyCOqfJTgg1Blp1GIeh7o8W8PC1w5dDyhWI";
  Future<void> fetchSuggestions(String query) async {
    if (query.isEmpty) return;
    setIsLoading(false);
    final url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$googleApiKey&components=country:IN";
    print("Fetching suggestions: $url");

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final rawSuggestions = data['predictions'] as List;
notifyListeners();
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
          notifyListeners();
        }
        setSuggestions(enrichedSuggestions);
      } else {
        throw Exception("Failed to load suggestions");
      }
    } catch (e) {
      print("Error fetching suggestions: $e");
    } finally {
      setIsLoading(false);
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
          if (component['types'].contains('administrative_area_level_3')) {
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
  Future<void> fetchCurrentLocation(context) async {
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
        setCurrentLocation(data['results'][0]['formatted_address']);
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

        setDistrict(district);

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

}
class ElementModel{
  final String image;
  final String name;
  final Function(BuildContext)? onTap;
  ElementModel({required this.image,required this.name,required this.onTap,});

}