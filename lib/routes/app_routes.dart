import 'package:flutter/material.dart';
import 'package:twitter_crawling_app/screens/about_us_screen.dart';
import 'package:twitter_crawling_app/screens/result_screen.dart';
import 'package:twitter_crawling_app/screens/search_screen.dart';
import 'package:twitter_crawling_app/screens/splash_screen.dart';


class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String aboutUsScreen = '/about';
  static const String topTrendsScreen = '/trends';
  static const String searchScreen = '/search';
  static const String resultScreen = '/result';

  static final routes = {
    splashScreen: (context) => const SplashScreen(),
    aboutUsScreen: (context) => AboutUsScreen(),
  };

  static Route<dynamic> handlingGenerateRoute(RouteSettings settings) {
    String route = settings.name ?? '/';

    switch (route) {
      case AppRoutes.aboutUsScreen:
        return getPage(AboutUsScreen());
      case AppRoutes.splashScreen:
        return getPage(const SplashScreen());
      case AppRoutes.searchScreen:
        return getPage(const SearchScreen());
      // case AppRoutes.resultScreen:
      //   final query = settings.arguments as String;
      //   final tweetQuantity = settings.arguments as int;
      //   return getPage(ResultScreen(
      //     query: query,
      //     tweetQuantity: tweetQuantity,
      //   ));
      default:
        return getPage(const Scaffold(
          body: Text("Route Tidak Ada"),
        ));
    }
  }
}

MaterialPageRoute<dynamic> getPage(Widget page) =>
    MaterialPageRoute(builder: (context) => page);
