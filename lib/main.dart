import 'package:fc_news/res/app_constant.dart';
import 'package:fc_news/utils/routes/routes.dart';
import 'package:fc_news/utils/routes/routes_name.dart';
import 'package:fc_news/view/auth/login_screen.dart';
import 'package:fc_news/view_model/services/splash_services.dart';
import 'package:fc_news/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: (RouteSettings settings) {
          final routeName = settings.name;
          if (settings.name != null) {
            return Routers.generateRoute(routeName.toString());
          }
          return null;
        },
        // home: const LoginScreen(),
      ),
    );
  }
}
double height=0.0;
double width=0.0;
