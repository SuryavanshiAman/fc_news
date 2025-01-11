import 'package:fc_news/controller/profile_controller.dart';
import 'package:fc_news/generated/assets.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/res/custom_container.dart';
import 'package:fc_news/res/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'routes/routes_name.dart';

class Utils {

  static showExitConfirmation(BuildContext context) async {
    return await showModalBottomSheet(
          elevation: 5,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35))),
          context: context,
          builder: (context) {
            return Container(
              height: height * 0.4,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0, top: 28),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: AppColor.black,
                        )),
                  ),
                  SizedBox(height: height * 0.02),
                  Center(
                    child: Text("Exit App",
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 20,
                            fontFamily: "NewYork",
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: height * 0.02),
                  Center(
                    child: Text("Are you sure want to exit app?",
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 16,
                            fontFamily: "nunito",
                            fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(height: height * 0.02),
                  Center(
                    child: SizedBox(
                      width: width * 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomContainer(
                            margin: const EdgeInsets.all(18),
                            alignment: Alignment.center,
                            height: height * 0.05,
                            gradient: const LinearGradient(
                                colors: [
                                  AppColor.primaryColor,
                                  AppColor.secondaryColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            ),
                            child: const Text(
                              "Yes",
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            onTap: () {
                              SystemNavigator.pop();
                            },
                          ),
                          CustomContainer(
                            margin: const EdgeInsets.all(18),
                            alignment: Alignment.center,
                            height: height * 0.05,
                            gradient: const LinearGradient(
                                colors: [
                                  AppColor.primaryColor,
                                  AppColor.secondaryColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            ),
                            child: const Text(
                              "No",
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            onTap: () {
                              Navigator.pop(context, false);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ) ??
        false;
  }
// ProfileController profileController=ProfileController();
  static Future<bool?> showLogOutConfirmation(BuildContext context) async {
    return await showModalBottomSheet(
      elevation: 5,
      // backgroundColor: AppColor.black,
      shape: const RoundedRectangleBorder(
        side: BorderSide(width: 2, color: Colors.white),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adjust height dynamically
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 28.0, top: 28),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColor.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColor.secondaryColor,
                  child: Image.asset(
                    Assets.iconLogout,
                    color: AppColor.white,
                    scale: 2,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  "Logging out?",
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 22,
                    fontFamily: "NewYork",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  "Are you sure you want to log out of this\naccount?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 16,
                    fontFamily: "nunito",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // const SizedBox(height: 24),
              CustomContainer(
                margin: const EdgeInsets.all(18),
                alignment: Alignment.center,
                height: height * 0.05,
                gradient: const LinearGradient(
                    colors: [AppColor.primaryColor, AppColor.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                child: const Text(
                  "Yes, Logout",
                  style: TextStyle(
                      color: AppColor.white,
                      fontFamily: "nunito",
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  Navigator.pushReplacementNamed(
                      context, RoutesName.loginScreen);
                },
              ),
              CustomContainer(
                margin: const EdgeInsets.all(18),
                alignment: Alignment.center,
                height: height * 0.05,
                gradient: const LinearGradient(
                    colors: [AppColor.primaryColor, AppColor.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      color: AppColor.white,
                      fontFamily: "nunito",
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          ),
        );
      },
    );
  }
  // static void showDistrict(BuildContext context) async {
  //   final profileController=Provider.of<ProfileController>(context,listen: false);
  //   final TextEditingController searchCont = TextEditingController();
  //   return await showModalBottomSheet(
  //     elevation: 5,
  //     // backgroundColor: AppColor.black,
  //     shape: const RoundedRectangleBorder(
  //       side: BorderSide(width: 2, color: Colors.white),
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(35),
  //         topRight: Radius.circular(35),
  //       ),
  //     ),
  //     context: context,
  //     builder: (context) {
  //       return Column(
  //         children: [
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
  //               profileController.fetchSuggestions(value);
  //             },
  //           ),
  //           Expanded(
  //             child: ListView.builder(
  //               itemCount: profileController.suggestions.length,
  //               itemBuilder: (context, index) {
  //                 final suggestion = profileController.suggestions[index];
  //                 return ListTile(
  //                   onTap: () {
  //                     if (suggestion['place_id'] != null) {
  //                       profileController.fetchPlaceDetailsForSuggestion(suggestion['place_id']).then((details) {
  //                         profileController.setDistrict(details['district']);
  //
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
  //                     profileController.district,
  //                     style: const TextStyle(
  //                       fontFamily: "nunito",
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   ),
  //                 );
  //                 ///
  //                 //   ListTile(
  //                 //   onTap: () {
  //                 //     if (suggestion['place_id'] != null) {
  //                 //       fetchPlaceDetailsForSuggestion(suggestion['place_id']);
  //                 //     } else {
  //                 //       ScaffoldMessenger.of(context).showSnackBar(
  //                 //         SnackBar(content: Text('Place ID not available')),
  //                 //       );
  //                 //     }
  //                 //   },
  //                 //   leading: const Icon(Icons.location_on),
  //                 //   title: Text(
  //                 //     suggestion['description'] ?? 'No description available',
  //                 //     style: const TextStyle(
  //                 //       fontFamily: "nunito",
  //                 //       fontWeight: FontWeight.w600,
  //                 //     ),
  //                 //   ),
  //                 // );
  //                 ///
  //                 //   ListTile(
  //                 //   onTap: () {
  //                 //     if (suggestion['place_id'] != null) {
  //                 //       fetchPlaceDetailsForSuggestion(suggestion['place_id']);
  //                 //     } else {
  //                 //       ScaffoldMessenger.of(context).showSnackBar(
  //                 //         SnackBar(content: Text('Place ID not available')),
  //                 //       );
  //                 //     }
  //                 //   },
  //                 //   leading: const Icon(Icons.location_on),
  //                 //   title: Text(
  //                 //     suggestion['description'] ?? 'No description available',
  //                 //     style: const TextStyle(
  //                 //       fontFamily: "nunito",
  //                 //       fontWeight: FontWeight.w600,
  //                 //     ),
  //                 //   ),
  //                 // );
  //
  //               },
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  static Future<dynamic>showDistrict(BuildContext context) async {
    final profileController = Provider.of<ProfileController>(context, listen: false);
    final TextEditingController searchCont = TextEditingController();

    return  Column(
      children: [
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
            profileController.fetchSuggestions(value);

          },
        ),
        Expanded(
          child: Consumer<ProfileController>(
            builder: (context, profileController, child) {
              return ListView.builder(
                itemCount: profileController.suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = profileController.suggestions[index];
                  return ListTile(
                    onTap: () {
                      if (suggestion['place_id'] != null) {
                        profileController.fetchPlaceDetailsForSuggestion(suggestion['place_id']).then((details) {
                          profileController.setDistrict(details['district']);
                        }).catchError((e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error fetching details: $e')),
                          );
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Place ID not available')),
                        );
                      }
                    },
                    leading: const Icon(Icons.location_on),
                    title: Text(
                      profileController.district,
                      style: const TextStyle(
                        fontFamily: "nunito",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

   void showLoadingDialog(BuildContext context, dynamic msg) {
    showDialog(
      context: context,
      barrierDismissible: false,

      builder: (BuildContext context) {
        return AlertDialog(

          contentPadding: const EdgeInsets.all(25),
          shape: RoundedRectangleBorder(

          ),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
              const SizedBox(width: 20),
              Text(
                "$msg",
                style: const TextStyle(
                    fontFamily: "NewYork", fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      },
    );
  }
}
