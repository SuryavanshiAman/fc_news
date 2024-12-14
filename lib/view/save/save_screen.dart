import 'package:fc_news/controller/home_controller.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        // foregroundColor: AppColor.white,
        // backgroundColor: AppColor.white,
        title: const Text("Save News",style: TextStyle(fontFamily: "NewYork",fontWeight: FontWeight.w600),),
      ),
      body: ListView(
        children: [
          ListView.builder(
            itemCount: homeController.newsItems.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  homeController.setIndex(index);
                  Navigator.pushNamed(context, RoutesName.viewNewsScreen);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    boxShadow:  [
                      BoxShadow(
                          color:  AppColor.gray, //New
                          blurRadius: 2.0,
                          spreadRadius: 0.1
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.gray.withOpacity(0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heading
                      Text(
                        homeController.newsItems[index]['heading'] ?? '',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontFamily: "NewYork"),
                      ),
                      SizedBox(height: height * 0.01), // Spacing
                      // Description with rich content
                      Text(
                        homeController.newsItems[index]['description'] ?? '',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                            fontFamily: "Nunito"),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    homeController.toggleSave(index);
                                  },
                                  child: Icon(
                                    homeController.savedIndices.contains(index)
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                    color: homeController.savedIndices.contains(index)
                                        ? AppColor.secondaryColor
                                        : AppColor.gray,
                                  )),
                              Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.gray,
                                    fontFamily: "Nunito"),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.share,
                                color: AppColor.gray,
                              ),
                              Text(
                                'Share',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.gray,
                                    fontFamily: "Nunito"),
                              ),
                            ],
                          ),
                          Container(
                            height: 60,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(homeController
                                        .newsItems[index]["image"] ??
                                        ""))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
