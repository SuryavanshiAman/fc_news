import 'package:fc_news/generated/assets.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(Assets.imagesLogo),
        leadingWidth: width*0.3,
        actions: [
          Container(
            height: height*0.05,
            width: width*0.12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColor.primaryColor,AppColor.secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            ),
              child: Icon(Icons.notifications_outlined,color: AppColor.white,))
        ],
      ) ,
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Latest News",style: TextStyle(color: AppColor.black,fontSize: 18,fontWeight: FontWeight.w600),),
              Text("See All"),
            ],
          ),


        ],
      ),
    );
  }
}
