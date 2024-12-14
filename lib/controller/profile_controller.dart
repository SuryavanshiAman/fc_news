

import 'package:flutter/cupertino.dart';

class ProfileController with ChangeNotifier{
  List<ElementModel> elementList = [
    ElementModel(
      image:Assets.imagesBank,
      name: 'Bank Details',
      onTap: (context){
        Navigator.pushNamed(context, RoutesName.bankDetailsScreen);
      }, ),
    ElementModel(
        image:Assets.imagesSupport,
        name: 'Support',
        onTap: (context){
          Launcher.openTelegram(context);
        }),
    ElementModel(
        image: Assets.imagesTeam,
        name: 'Team',
        onTap: (context) async{
          UserViewModel userViewModel = UserViewModel();
          String? userId = await userViewModel.getUser();
          Launcher.launchURL(ApiUrl.team+userId!);
          // Navigator.pushNamed(context, RoutesName.myTeam);
        }),
    ElementModel(
        image: Assets.imagesKyc,
        name: 'KYC',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.kycScreen);
        }),
    ElementModel(
        image:Assets.imagesAbout,
        name: 'About Us',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.aboutUsScreen);
        }),
    ElementModel(
        image: Assets.imagesPolicy,
        name: 'Privacy Policy  ',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.policyScreen);
        }),
    ElementModel(
        image: Assets.imagesTermCon,
        name: 'T&C',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.termsScreen);
        }),
    ElementModel(
        image:Assets.imagesLogOut,
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