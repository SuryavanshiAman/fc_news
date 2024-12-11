import 'package:fc_news/controller/home_controller.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/res/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return  Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          CustomTextField(
            controller: _controller,
            label: "Search",
            hintColor: AppColor.labelColor,
            hintSize: 14,
            // width: width >= 450 ? width * 0.25 : width * 0.65,
            height: 50,
            filled: false,
            border: Border.all(color: AppColor.gray.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(15),
            fieldRadius: BorderRadius.circular(15),
            suffix: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.search,color: AppColor.primaryColor,),
            ),
          ),
          SizedBox(height: height*0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: width*0.3,
                height: 1,
                color: AppColor.gray,
              ),
              Text(
                "News Topic",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "NewYork",
                    color: AppColor.black),
              ),
              Container(
                width: width*0.3,
                height: 1,
                color: AppColor.gray,
              ),
            ],
          ),
          ListView.builder(
              itemCount: homeController.categories.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _controller.text = homeController.categories[index];
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                    ),
                    child: Text(
                      homeController.categories[index],
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Nunito",
                          color: AppColor.black),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
