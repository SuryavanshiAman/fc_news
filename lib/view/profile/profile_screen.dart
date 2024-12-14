import 'package:fc_news/main.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/res/custom_text_field.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(fontFamily: "NewYork",fontWeight: FontWeight.w600),),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
        CircleAvatar(
          radius: 50,
        ),
          SizedBox(height: height*0.04,),
          CustomTextField(
            controller: _phoneController,
            hintColor: AppColor.labelColor,
            hintSize: 14,
            height: 50,
            filled: false,
            border: Border.all(color: AppColor.gray.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(15),
            fieldRadius: BorderRadius.circular(15),
          ),
          SizedBox(height: height*0.02,),
          CustomTextField(
            controller: _phoneController,
            hintColor: AppColor.labelColor,
            hintSize: 14,
            height: 50,
            filled: false,
            border: Border.all(color: AppColor.gray.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(15),
            fieldRadius: BorderRadius.circular(15),
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 80,
              ),
              itemCount: element.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(18),
                  child: InkWell(
                    onTap: () {
                      if (element[index].onTap != null) {
                        element[index].onTap!(context);
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: GameColor.bg, //New
                              blurRadius: 2,
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: GameColor.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage(
                                element[index].image,
                              ),
                              color: GameColor.blue,
                            ),
                            Text(
                              element[index].name,
                              style: const TextStyle(
                                  color: GameColor.blue,
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
