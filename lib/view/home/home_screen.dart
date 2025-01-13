import 'package:fc_news/controller/home_controller.dart';
import 'package:fc_news/controller/profile_controller.dart';
import 'package:fc_news/generated/assets.dart';
import 'package:fc_news/main.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/res/custom_text_field.dart';
import 'package:fc_news/res/map/location.dart';
import 'package:fc_news/utils/routes/routes_name.dart';
import 'package:fc_news/view/home/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> shareContent(String heading, String description, String videoUrl) async {
    await FlutterShare.share(
      title: heading,
      text: '$heading\n$description\n\nWatch the video: $videoUrl',
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  bool visible=false;
  final TextEditingController searchCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    final address = Provider.of<ProfileController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(Assets.imagesLogo),
        leadingWidth: width * 0.3,
        actions: [
          Container(
              height: height * 0.05,
              width: width * 0.12,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [AppColor.primaryColor, AppColor.secondaryColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Stack(
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesName.notificationScreen);
                      },
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  Positioned(
                      left: width * 0.061,
                      top: height * 0.01,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: AppColor.yellow,
                      ))
                ],
              )),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(Icons.location_on),
              Icon(Icons.location_on,color: AppColor.secondaryColor,size: 20,),
              Text(
                address.district,
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'NewYork'),
              ),
              // Visibility(
              //   visible:visible==true?true:false ,
              //   child: CustomTextField(
              //     controller: searchCont,
              //     label: "Search Place....",
              //     hintColor: AppColor.labelColor,
              //     hintSize: 14,
              //     width: width*0.9,
              //     contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
              //     height: 50,
              //     filled: false,
              //     border: Border.all(color: AppColor.gray.withOpacity(0.3)),
              //     borderRadius: BorderRadius.circular(15),
              //     fieldRadius: BorderRadius.circular(15),
              //     onChanged: (String value) {
              //       address.fetchSuggestions(value);
              //     },
              //     suffix:   InkWell(
              //         onTap:(){
              //           showLocationBottomSheet(context);
              //         },
              //         child: Icon(Icons.search,color: AppColor.secondaryColor,size: 20,)),
              //   ),
              // ),
              Spacer(),
              InkWell(
                  onTap:(){
                    setState(() {
                      showLocationBottomSheet(context);
                    });
                  },
                  child: Icon(Icons.search,color: AppColor.secondaryColor,size: 20,)),
            ],
          ),

          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest News",
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'NewYork'),
              ),
              const Text(
                "See All",
                style: TextStyle(
                  color: AppColor.blue,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          CustomCarousel(),
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            height: height * 0.062,
            child: ListView.builder(
                itemCount: homeController.categories.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      homeController.setIndex(index);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: homeController.selectedIndex == index
                            ? const LinearGradient(
                                colors: [
                                    AppColor.primaryColor,
                                    AppColor.secondaryColor
                                  ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)
                            : null,
                        borderRadius: BorderRadius.circular(20),
                        border: homeController.selectedIndex != index
                            ? Border.all(color: AppColor.gray.withOpacity(0.2))
                            : null,
                      ),
                      child: Text(
                        homeController.categories[index],
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Nunito",
                            color: homeController.selectedIndex == index
                                ? AppColor.white
                                : AppColor.black),
                      ),
                    ),
                  );
                }),
          ),
          ListView.builder(
            itemCount: homeController.newsItems.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final data = homeController.newsItems[index];
              return GestureDetector(
                onTap: () {
                  homeController.setIndex(index);
                  Navigator.pushNamed(context, RoutesName.viewNewsScreen,
                      arguments: {
                        'heading': data['heading'],
                        'description': data['description'],
                        'video': data['videoUrl'],
                      });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.gray.withOpacity(0.3)),
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
                                    color: homeController.savedIndices
                                            .contains(index)
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
                              InkWell(
                                onTap: () {
                                  shareContent(
                                    data['heading']!,
                                    data['description']!,
                                    data['videoUrl']!,
                                  );
                                },
                                child: Icon(
                                  Icons.share,
                                  color: AppColor.gray,
                                ),
                              ),
                              // Icon(
                              //   Icons.share,
                              //   color: AppColor.gray,
                              // ),
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
                            // color: AppColor.black,
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
