import 'package:fc_news/res/color-const.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          "Current Address",
          style: TextStyle(fontFamily: "NewYork", fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onCameraMove: (CameraPosition position){
          print("lat:${position.target.latitude} || lng:${position.target.longitude}  ");
            },
            // onMapCreated: (GoogleMapController controller) {
            //   // _controller.complete(controller);
            // },
          ),
          Center(
            child: Icon(Icons.location_on,size: 50,color: AppColor.primaryColor,),
          )
        ],
      ),
      bottomSheet:Container(
        color: AppColor.secondaryColor,
        padding: EdgeInsets.only(top:10,bottom: 30,left: 20,right: 20 ),
        child: Row(
          children: [
            Icon(Icons.location_on),
            Expanded(
              child: Text(
                "Current Address",
                style: TextStyle(fontFamily: "NewYork", fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      )
    );
  }
}
