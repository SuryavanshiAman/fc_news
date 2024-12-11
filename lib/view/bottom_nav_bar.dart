// import 'dart:developer';
// import 'dart:math';
//
// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// import 'package:flutter/material.dart';
//
// import 'home/home_screen.dart';
//
//
// class BottomNavBarPage extends StatefulWidget {
//   const BottomNavBarPage({Key? key}) : super(key: key);
//
//   @override
//   State<BottomNavBarPage> createState() => _BottomNavBarPageState();
// }
//
// class _BottomNavBarPageState extends State<BottomNavBarPage> {
//   /// Controller to handle PageView and also handles initial page
//   final _pageController = PageController(initialPage: 0);
//
//   /// Controller to handle bottom nav bar and also handles initial page
//   final NotchBottomBarController _controller = NotchBottomBarController(index: 0);
//
//   int maxCount = 3;
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     /// widget list
//     final List<Widget> bottomBarPages = [
//       Page1(
//         controller: (_controller),
//       ),
//       const HomeScreen(),
//       const HomeScreen(),
//       const HomeScreen(),
//     ];
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         physics: const NeverScrollableScrollPhysics(),
//         children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
//       ),
//       extendBody: true,
//       bottomNavigationBar: (bottomBarPages.length <= maxCount)
//           ? AnimatedNotchBottomBar(
//         /// Provide NotchBottomBarController
//         notchBottomBarController: _controller,
//         color: Colors.white,
//         showLabel: true,
//         textOverflow: TextOverflow.visible,
//         maxLine: 1,
//         shadowElevation: 5,
//         kBottomRadius: 28.0,
//
//         notchShader: const SweepGradient(
//           startAngle: 0,
//           endAngle: pi / 2,
//           colors: [Colors.red, Colors.green, Colors.orange],
//           tileMode: TileMode.mirror,
//         ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
//         notchColor: Colors.black87,
//
//         /// restart app if you change removeMargins
//         removeMargins: false,
//         bottomBarWidth: 500,
//         showShadow: false,
//         durationInMilliSeconds: 300,
//
//         itemLabelStyle: const TextStyle(fontSize: 10),
//
//         elevation: 1,
//         bottomBarItems: const [
//           BottomBarItem(
//             inActiveItem: Icon(
//               Icons.home_filled,
//               color: Colors.blueGrey,
//             ),
//             activeItem: Icon(
//               Icons.home_filled,
//               color: Colors.blueAccent,
//             ),
//             itemLabel: 'Page',
//           ),
//           BottomBarItem(
//             inActiveItem: Icon(
//               Icons.home_filled,
//               color: Colors.blueGrey,
//             ),
//             activeItem: Icon(
//               Icons.home_filled,
//               color: Colors.blueAccent,
//             ),
//             itemLabel: 'Home',
//           ),
//           BottomBarItem(
//             inActiveItem: Icon(Icons.star, color: Colors.blueGrey),
//             activeItem: Icon(
//               Icons.search,
//               color: Colors.blueAccent,
//             ),
//             itemLabel: 'Search',
//           ),
//
//           BottomBarItem(
//             inActiveItem: Icon(
//               Icons.person,
//               color: Colors.blueGrey,
//             ),
//             activeItem: Icon(
//               Icons.person,
//               color: Colors.yellow,
//             ),
//             itemLabel: 'Profile',
//           ),
//         ],
//         onTap: (index) {
//           // log('current selected index $index');
//           _pageController.jumpToPage(index);
//         },
//         kIconSize: 24.0,
//       )
//           : null,
//     );
//   }
// }
//
// /// add controller to check weather index through change or not. in page 1
// class Page1 extends StatelessWidget {
//   final NotchBottomBarController? controller;
//
//   const Page1({Key? key, this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.yellow,
//       child: Center(
//         /// adding GestureDetector
//         child: GestureDetector(
//           behavior: HitTestBehavior.translucent,
//           onTap: () {
//             print("hello");
//             controller?.jumpTo(2);
//           },
//           child: const Text('Page 1'),
//         ),
//       ),
//     );
//   }
// }
import 'dart:developer';
import 'dart:math';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/view/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'search/search_screen.dart';


class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  int maxCount = 4;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      const HomeScreen(),
      const SearchScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        color: AppColor.secondaryColor,
        showLabel: true,
        textOverflow: TextOverflow.visible,
        maxLine: 1,
        shadowElevation: 0,
        kBottomRadius: 2.0,

        // notchShader: const SweepGradient(
        //   startAngle: 2,
        //   endAngle: pi / 1,
        //   colors: [AppColor.primaryColor,AppColor.secondaryColor,AppColor.primaryColor,],
        //   tileMode: TileMode.mirror,
        // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
        notchColor:AppColor.primaryColor,

        /// restart app if you change removeMargins
        removeMargins: true,
        bottomBarWidth: 500,
        showShadow: false,
        durationInMilliSeconds: 300,

        itemLabelStyle: const TextStyle(fontSize: 12,color: AppColor.white,fontFamily: "Nunito",fontWeight: FontWeight.w600),

        elevation: 1,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: AppColor.white,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color:AppColor.white,
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.search, color: AppColor.white,),
            activeItem: Icon(
              Icons.search,
              color: AppColor.white,
            ),
            itemLabel: 'Search',

          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.bookmark, color: AppColor.white,),
            activeItem: Icon(
              Icons.bookmark,
              color: AppColor.white,
            ),
            itemLabel: 'Save',

          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.person,
              color: AppColor.white,
            ),
            activeItem: Icon(
              Icons.person,
              color: AppColor.white,
            ),
            itemLabel: 'Profile',
          ),

        ],
        onTap: (index) {
          // log('current selected index $index');
          _pageController.jumpToPage(index);
        },
        kIconSize: 24.0,
      )
          : null,
    );
  }
}

/// add controller to check weather index through change or not. in page 1
class Page1 extends StatelessWidget {
  final NotchBottomBarController? controller;

  const Page1({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        /// adding GestureDetector
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            controller?.jumpTo(2);
          },
          child: const Text('Page 1'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, child: const Center(child: Text('Page 4')));
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.lightGreenAccent, child: const Center(child: Text('Page 5')));
  }
}