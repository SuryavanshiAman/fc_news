import 'package:fc_news/controller/profile_controller.dart';
import 'package:fc_news/generated/assets.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/res/custom_text_field.dart';
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
  String name = "News App";
  String mobile = "1111111111";
  @override
  void initState() {
    super.initState();
    _nameController.text = "News App";
    _phoneController.text = "1111111111";
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
      body: ListView(
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
                    backgroundImage: elementList.image != null
                        ? FileImage(elementList.image!)
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
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Increase vertical spacing between items
                  mainAxisExtent: 65,
                  crossAxisSpacing: 20),
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
        ],
      ),
    );
  }
}
