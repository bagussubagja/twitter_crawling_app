import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_crawling_app/providers/provider_list.dart';
import 'package:twitter_crawling_app/routes/app_routes.dart';

import 'package:sizer/sizer.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderList.providers,
      child: Sizer(
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
      ),
    );
  }
}
