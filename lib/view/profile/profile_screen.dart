import 'dart:convert';

import 'package:fc_news/controller/profile_controller.dart';
import 'package:fc_news/generated/assets.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/model/register_model.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/res/custom_container.dart';
import 'package:fc_news/res/custom_text_field.dart';
import 'package:fc_news/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String name = "News App";
  String mobile = "1111111111";
  @override
  void initState() {
    super.initState();
   // Provider.of<ProfileController>(context,listen: false).fetchCurrentLocation(context);


  }
  Future<Data?> fetchUserData() async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    DBHelper dbHelper = DBHelper();
    return await dbHelper.getUserByUsername(userId);
  }
  @override
  Widget build(BuildContext context) {
    final elementList = Provider.of<ProfileController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontFamily: "NewYork", fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder<Data?>(
          future: fetchUserData(),
        builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            else if(
            snapshot.hasData && snapshot.data != null
            ){
              Data user = snapshot.data!;
              if (_nameController.text.isEmpty && _phoneController.text.isEmpty) {
                _nameController.text = user.userName ?? "";
                _phoneController.text = user.number ?? "";
              }

              print("Fetched user data: ${snapshot.data}");
              return ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Stack(
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            elementList.getImage(ImageSource.gallery);
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColor.secondaryColor,
                            backgroundImage:
                            // elementList.image != null
                            //     ? FileImage(elementList.image!):
                            user.image != null? MemoryImage(base64Decode(user.image!))
                                :  const AssetImage(Assets.imagesLogo),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.08,
                        left: width * 0.5,
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              elementList.getImage(ImageSource.camera);
                            },
                            child: const CircleAvatar(
                              backgroundColor: AppColor.primaryColor,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  CustomTextField(
                    controller: _nameController,
                    hintColor: AppColor.labelColor,
                    hintSize: 14,
                    height: 50,
                    label: user.userName??"Enter your name",
                    filled: false,
                    prefix: Image.asset(
                      Assets.imagesPerson,
                      scale: 3,
                    ),
                    border: Border.all(color: AppColor.gray.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(15),
                    fieldRadius: BorderRadius.circular(15),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextField(
                    controller: _phoneController,
                    hintColor: AppColor.labelColor,
                    hintSize: 14,
                    height: 50,
                    label: "Enter your number",
                    filled: false,
                    prefix: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "+91 |",
                        style: TextStyle(color: AppColor.primaryColor, fontSize: 16),
                      ),
                    ),
                    border: Border.all(color: AppColor.gray.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(15),
                    fieldRadius: BorderRadius.circular(15),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.gray.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Image(image: AssetImage( Assets.imagesLocation,),height: height*0.045,),
                        SizedBox(
                          width: width*0.74,
                          child: Text(elementList.currentLocation,style: TextStyle(
                              fontSize:15,
                              // fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: AppColor.gray)),
                        )
                      ],
                    ),
                  ),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Increase vertical spacing between items
                          mainAxisExtent: 60,
                          crossAxisSpacing: 20
                      ),
                      itemCount: elementList.elementList.length,
                      itemBuilder: (BuildContext context, index) {
                        final data = elementList.elementList[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.only(top: 18),
                          child: InkWell(
                            onTap: () {
                              if (data.onTap != null) {
                                data.onTap!(context);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColor.secondaryColor),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                                // color: AppColor.primaryColor
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        data.image,
                                      ),
                                      // color: GameColor.blue,
                                    ),
                                    Text(
                                      data.name,
                                      style: TextStyle(
                                          color: AppColor.black,
                                          fontFamily: "nunito",
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                  CustomContainer(
                    alignment: Alignment.center,
                    height: height * 0.05,
                    margin: EdgeInsets.only(top: height*0.03),
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
                      "Update",
                      style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    onTap: () async{
                      Data updatedData = Data(
                          id: snapshot.data!.id, // Use the ID from the fetched data
                          userName: _nameController.text,
                          number: _phoneController.text,
                          image: elementList.image != null
                              ? elementList.base64Image
                          : snapshot.data!.image, // Update image if changed, else keep the old image
                      );
                      DBHelper dbHelper = DBHelper();
                      await dbHelper.updateUser(updatedData);
                    },
                  ),
                ],
              );
            }
            else {
              print("😊😊😊😊");
              return const Center(child: Text("No user found."));
            }
        }
      ),
    );
  }
}
