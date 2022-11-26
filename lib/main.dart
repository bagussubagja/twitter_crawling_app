import 'package:flutter/material.dart';
import 'package:twitter_crawling_app/routes/app_routes.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Twitter Crawling App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Nunito',
          ),
          initialRoute: AppRoutes.splashScreen,
          routes: AppRoutes.routes,
          onGenerateRoute: AppRoutes.handlingGenerateRoute,
        );
      },
    );
  }
}
