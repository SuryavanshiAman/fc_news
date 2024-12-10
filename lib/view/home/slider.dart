// import 'dart:convert';
//
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:fc_news/main.dart';
// import 'package:flutter/material.dart';
//
// class SliderPage extends StatefulWidget {
//   const SliderPage({Key? key}) : super(key: key);
//
//   @override
//   State<SliderPage> createState() => _SliderPageState();
// }
//
// class _SliderPageState extends State<SliderPage> {
//   int _currentIndex = 0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CarouselSlider(
//           options: CarouselOptions(
//             height: height*0.25,
//             aspectRatio: 16/9,
//             viewportFraction: 0.9,
//             initialPage: 0,
//             enableInfiniteScroll: true,
//             reverse: false,
//             autoPlay: true,
//             autoPlayInterval: const Duration(seconds: 3),
//             autoPlayAnimationDuration: const Duration(milliseconds: 800),
//             autoPlayCurve: Curves.fastOutSlowIn,
//             enlargeCenterPage: true,
//             enlargeFactor: 0.3,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             scrollDirection: Axis.horizontal,
//           ),
//           items: (state_data).map((i) {
//             return Builder(
//               builder: (BuildContext context) {
//                 return Container(
//                   width: width,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       image: DecorationImage(
//                           fit: BoxFit.fill,
//                           image: NetworkImage(i.toString())
//                       )
//                   ),
//
//                 );
//               },
//             );
//           }).toList(),
//         ),
//         // Padding(
//         //   padding:  EdgeInsets.only(top: height*0.19),
//         //   child: Row(
//         //     mainAxisAlignment: MainAxisAlignment.center,
//         //     children: (banner?.data??[]).asMap().entries.map((entry) {
//         //       return GestureDetector(
//         //         onTap: () => setState(() => _currentIndex = entry.key),
//         //         child: Container(
//         //           width: 8.0,
//         //           height: 8.0,
//         //           margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//         //           decoration: BoxDecoration(
//         //             shape: BoxShape.circle,
//         //             color: (Theme.of(context).brightness == Brightness.dark
//         //                 ? GameColor.gray
//         //                 : GameColor.white)
//         //                 .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
//         //           ),
//         //         ),
//         //       );
//         //     }).toList(),
//         //   ),
//         // ),
//       ],
//     );
//   }
//
//   List<String> state_data = [
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs39HZSVdNk4sipuGJ10Ebwajwcq03xrqz_A&s",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1Dw7-4lVfRq74_YEiPEt4e-bQ0_6UA2y73Q&s"
//   ];
//
// }
import 'package:fc_news/main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarousel extends StatefulWidget {
  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;

  // Example data for the carousel
  final List<Map<String, String>> carouselItems = [
    {
      "image":
      "https://bsmedia.business-standard.com/_media/bs/img/article/2024-09/12/full/1726122715-1162.jpg?im=FitAndFill=(826,465)", // Replace with your image URL
      "title": "Crypto investors should be prepared to lose all their money",
      "subtitle":
      "“Buy them only if you're prepared to lose all your money,” BOE governor says.",
      "author": "by Ryan Browne"
    },
    {
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKfAKcn6U_c9jPjA6sTHBDvCCbzV7Ipb6KCg&s", // Replace with your image URL
      "title": "Another headline goes here",
      "subtitle": "This is the subtitle for another article.",
      "author": "by John Doe"
    },
    {
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC4aysnvqyourwt3KQtoIj093TMIDkEkMp3w&s", // Replace with your image URL
      "title": "Yet another headline",
      "subtitle": "Details about the third article go here.",
      "author": "by Jane Smith"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
    itemCount: carouselItems.length,
      options: CarouselOptions(
        height: height*0.27,
        viewportFraction: 0.88, // Show part of the next slide
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enlargeCenterPage: true,
        enlargeFactor: 0.15,
        scrollPhysics: const BouncingScrollPhysics(),
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      itemBuilder: (context, index, realIndex) {
        return Align(
          alignment: Alignment.centerLeft, // Push items left
          child: Container(
            width: width * 0.7,
            margin: const EdgeInsets.only(right: 12), // Create spacing for the next image
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(carouselItems[index]["image"]!),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(carouselItems[index]["author"]!,
                          style: const TextStyle(color: Colors.white70)),
                      const SizedBox(height: 8),
                      Text(carouselItems[index]["title"]!,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(carouselItems[index]["subtitle"]!,
                          style: const TextStyle(color: Colors.white70),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
