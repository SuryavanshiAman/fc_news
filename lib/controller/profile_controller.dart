
import 'dart:convert';
import 'dart:io';

import 'package:fc_news/generated/assets.dart';
import 'package:fc_news/utils/routes/routes_name.dart';
import 'package:fc_news/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController with ChangeNotifier{

  File? _image;
  File? get image => _image;
  final picker = ImagePicker();
  void setImage(File? value) {
    _image = value;
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
  List<ElementModel> elementList = [
    // ElementModel(
    //   image:Assets.imagesBank,
    //   name: 'Bank Details',
    //   onTap: (context){
    //     Navigator.pushNamed(context, RoutesName.bankDetailsScreen);
    //   }, ),
    // ElementModel(
    //     image:Assets.imagesSupport,
    //     name: 'Support',
    //     onTap: (context){
    //       Launcher.openTelegram(context);
    //     }),
    // ElementModel(
    //     image: Assets.imagesTeam,
    //     name: 'Team',
    //     onTap: (context) async{
    //       UserViewModel userViewModel = UserViewModel();
    //       String? userId = await userViewModel.getUser();
    //       Launcher.launchURL(ApiUrl.team+userI);
    //       // Navigator.pushNamed(context, RoutesName.myTeam);
    //     }),
    // ElementModel(
    //     image: Assets.imagesKyc,
    //     name: 'KYC',
    //     onTap: (context){
    //       Navigator.pushNamed(context, RoutesName.kycScreen);
    //     }),

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
        image:Assets.iconLogout,
        name: 'Logout',
        onTap: (context){
          Utils.showLogOutConfirmation(context);
        }),


  ];
}
class ElementModel{
  final String image;
  final String name;
  final Function(BuildContext)? onTap;
  ElementModel({required this.image,required this.name,required this.onTap,});

}