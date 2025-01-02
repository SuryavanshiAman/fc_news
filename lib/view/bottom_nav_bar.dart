
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:fc_news/res/color-const.dart';
import 'package:fc_news/utils/utils.dart';
import 'package:fc_news/view/home/home_screen.dart';
import 'package:fc_news/view/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'save/save_screen.dart';
import 'search/search_screen.dart';


class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  int maxCount = 4;
  Future<bool> _onWillPop() async {
    if (_pageController.page != 0) {

        _pageController.jumpToPage(0);
        setState(() {
          _controller.index = 0; // Update the bottom navigation index
        });
      return Future.value(false);
    } else {
      return await Utils.showExitConfirmation(context) ?? false;
    }
  }

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
      const SaveScreen(),
      const ProfileScreen(),
    ];
    return PopScope(
      canPop: false,
      onPopInvoked: (v) {
        _onWillPop();
      },
      child: Scaffold(
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
            _controller.index = index;
          },
          kIconSize: 24.0,
        )
            : null,
      ),
    );
  }
}

