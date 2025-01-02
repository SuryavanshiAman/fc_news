import 'package:fc_news/controller/home_controller.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notification",
          style: TextStyle(fontFamily: "NewYork", fontWeight: FontWeight.w600),
        ),
      ),
      body:  ListView.builder(
        itemCount: homeController.newsItems.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final data =homeController.newsItems[index];
          return GestureDetector(
            onTap: () {
              // homeController.setIndex(index);
              // Navigator.pushNamed(context, RoutesName.viewNewsScreen);
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(12),
                // border: Border.all(color: AppColor.gray.withOpacity(0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Icons.cancel_outlined,size: 18,),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height*0.075,
                        width: width*0.2,
                        // color: AppColor.black,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(data['image']!),fit: BoxFit.fill
                            )

                        )
                      ),
                      Container(
                        // color: Colors.red,
                        width: width*0.67,
                          height: height*0.05,
                          child:  Text(
                              data['description']!,style: TextStyle(
                            fontFamily: "nunito",fontWeight: FontWeight.w700
                          ),))
                    ],
                  ),
                  const Text("1-01-25 7:00 PM",style: TextStyle(fontFamily: "nunito",fontSize: 12,color: AppColor.labelColor,fontWeight: FontWeight.w700),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
