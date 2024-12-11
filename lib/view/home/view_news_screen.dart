import 'package:fc_news/controller/home_controller.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewNewsScreen extends StatefulWidget {
  const ViewNewsScreen({super.key});

  @override
  State<ViewNewsScreen> createState() => _ViewNewsScreenState();
}

class _ViewNewsScreenState extends State<ViewNewsScreen> {
  @override
  Widget build(BuildContext context) {
    final homeController =Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Icon(Icons.bookmark_border,color: AppColor.gray,),
          Icon(homeController.savedIndices.contains(1)
              ? Icons.bookmark
              : Icons.bookmark_border,
            color: homeController.savedIndices.contains(1)
                ? AppColor.secondaryColor
                : AppColor.gray,),
          SizedBox(width: width*0.05,),
          Icon(Icons.share,color:AppColor.gray,),
          SizedBox(width: width*0.08,)
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: width,
            height: height*0.25,
            // color: Colors.blue,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(homeController.newsItems[0]["image"].toString(),),fit: BoxFit.fill)
            ),
          ),
          SizedBox(height: height*0.02,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Election Campaigns Heat Up:",
              style: TextStyle(
                color: AppColor.black,
                fontFamily: "NewYork",
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "The Delhi government has directed operators of the city's hotels, clubs and restaurants serving liquor to verify the age of their clients through hard copies of government-issued identity proofs after violations of the legal drinking age norm were detected."
                    "\nIn Delhi, liquor is served only to persons aged 25 years and above."
                    "\n The excise department of the Delhi government, during routine inspections by its teams in recent days, found customers younger than 25 years having alcohol at bars, clubs and restaurants."
            "\n The inspections also revealed that some customers were consuming liquor pretending to have completed 25 years. Complaints were also received by the department that some excise licensees were serving liquor to underage persons, officials said.",
              style: TextStyle(
                color: AppColor.gray,
                fontFamily: "Nunito",
                fontSize: 14,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
        ],
      ),
    );
  }
}
