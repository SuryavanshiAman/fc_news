import 'package:fc_news/controller/home_controller.dart';
import 'package:fc_news/res/app_constant.dart';
import 'package:fc_news/res/map/location.dart';
import 'package:fc_news/test.dart';
import 'package:fc_news/utils/routes/routes.dart';
import 'package:fc_news/utils/routes/routes_name.dart';
import 'package:fc_news/view_model/services/splash_services.dart';
import 'package:fc_news/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/profile_controller.dart';
import 'res/map/google_map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashServices()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: (RouteSettings settings) {
          final routeName = settings.name;
          if (settings.name != null) {
            return Routers.generateRoute(settings);
          }
          return null;
        },
        // home:  LocationScreen(),
        // home:  GoogleMapScreen(),
      ),
    );
  }
}
double height=0.0;
double width=0.0;
