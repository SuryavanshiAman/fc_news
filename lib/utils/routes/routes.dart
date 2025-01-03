//
// import 'package:fc_news/res/text_widget.dart';
// import 'package:fc_news/view/auth/login_screen.dart';
// import 'package:fc_news/view/auth/otp_screen.dart';
// import 'package:fc_news/view/auth/register_screen.dart';
// import 'package:fc_news/view/auth/splash_screen.dart';
// import 'package:fc_news/view/home/home_screen.dart';
// import 'package:flutter/material.dart';
//
// import 'routes_name.dart';
//
// class Routers {
//   static WidgetBuilder generateRoute(String routeName) {
//     switch (routeName) {
//       case RoutesName.splashScreen:
//         return (context) => const SplashScreen();
//       case RoutesName.loginScreen:
//         return (context) => const LoginScreen();
//       case RoutesName.verifyPage:
//         return (context) => const VerifyPage();
//       case RoutesName.registerScreen:
//         return (context) => const RegisterScreen();
//       case RoutesName.homeScreen:
//         return (context) => const HomeScreen();
//       default:
//         return (context) => Scaffold(
//           body: Center(
//             child: textWidget(
//                 text: 'No Route Found!',
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black),
//           ),
//         );
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:fc_news/view/auth/login_screen.dart';
// import 'package:fc_news/view/auth/otp_screen.dart';
// import 'package:fc_news/view/auth/register_screen.dart';
// import 'package:fc_news/view/auth/splash_screen.dart';
// import 'package:fc_news/view/home/home_screen.dart';
// import 'routes_name.dart';
//
// class Routers {
//   static Route<dynamic> generateRoute(String routeName) {
//     switch (routeName) {
//       case RoutesName.splashScreen:
//         return _customPageRoute(const SplashScreen());
//       case RoutesName.loginScreen:
//         return _customPageRoute(const LoginScreen());
//       case RoutesName.verifyPage:
//         return _customPageRoute(const VerifyPage());
//       case RoutesName.registerScreen:
//         return _customPageRoute(const RegisterScreen());
//       case RoutesName.homeScreen:
//         return _customPageRoute(const HomeScreen());
//       default:
//         return _customPageRoute(
//           Scaffold(
//             body: Center(
//               child: Text(
//                 'No Route Found!',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//               ),
//             ),
//           ),
//         );
//     }
//   }
//
//   // Custom page route with custom transition animation
//   static PageRouteBuilder _customPageRoute(Widget page) {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(1.0, 0.0); // Right to left
//         const end = Offset.zero;
//         const curve = Curves.easeInOut;
//
//         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         var offsetAnimation = animation.drive(tween);
//         return SlideTransition(position: offsetAnimation, child: child);
//       },
//       transitionDuration: const Duration(seconds: 1),
//     );
//   }
// }
import 'package:fc_news/view/bottom_nav_bar.dart';
import 'package:fc_news/view/home/notification_screen.dart';
import 'package:fc_news/view/home/view_news_screen.dart';
import 'package:fc_news/view/profile/about_us_screen.dart';
import 'package:fc_news/view/profile/policy_screen.dart';
import 'package:fc_news/view/profile/profile_screen.dart';
import 'package:fc_news/view/profile/terms_condition_screen.dart';
import 'package:fc_news/view/save/save_screen.dart';
import 'package:flutter/material.dart';
import 'package:fc_news/view/auth/login_screen.dart';
import 'package:fc_news/view/auth/otp_screen.dart';
import 'package:fc_news/view/auth/register_screen.dart';
import 'package:fc_news/view/auth/splash_screen.dart';
import 'package:fc_news/view/home/home_screen.dart';
import 'routes_name.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routeName = settings.name;
    final arguments = settings.arguments;
    switch (routeName) {
      case RoutesName.splashScreen:
        return _customPageRoute(const SplashScreen());
      case RoutesName.loginScreen:
        return _customPageRoute(const LoginScreen());
      case RoutesName.verifyPage:
        return _customPageRoute( VerifyPage(arguments:arguments.toString()
        ));
      case RoutesName.registerScreen:
        return _customPageRoute(const RegisterScreen());
      case RoutesName.homeScreen:
        return _customPageRoute(const HomeScreen());
      case RoutesName.bottomNavBarPage:
        return _customPageRoute(const BottomNavBarPage());
      case RoutesName.viewNewsScreen:
        return _customPageRoute(const ViewNewsScreen());
      case RoutesName.saveScreen:
        return _customPageRoute(const SaveScreen());
      case RoutesName.profileScreen:
        return _customPageRoute(const ProfileScreen());
      case RoutesName.aboutUsScreen:
        return _customPageRoute(const AboutUs());
      case RoutesName.policyScreen:
        return _customPageRoute(const PolicyScreen());
        case RoutesName.termsScreen:
      return _customPageRoute(const TermsConditionScreen());
      case RoutesName.notificationScreen:
        return _customPageRoute(const NotificationScreen());

      default:
        return _customPageRoute(
          const Scaffold(
            body: Center(
              child: Text(
                'No Route Found!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
    }
  }

  // Custom page route with custom transition animation
  static PageRouteBuilder _customPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Define animations for forward and reverse transitions
        const forwardBegin = Offset(1.0, 0.0); // Right-to-left
        const reverseBegin = Offset(-1.0, 0.0); // Left-to-right
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        // Use the `animation` for both forward and reverse transitions
        var tween = Tween(begin: forwardBegin, end: end)
            .chain(CurveTween(curve: curve));
        var offsetAnimation = animation.status == AnimationStatus.reverse
            ? Tween(begin: reverseBegin, end: end)
            .chain(CurveTween(curve: curve))
            .animate(animation)
            : animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(seconds: 1),
    );
  }

}
