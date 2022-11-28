import 'package:flutter/material.dart';
import 'package:twitter_crawling_app/models/trends_model.dart';
import 'package:twitter_crawling_app/services/trends_services.dart';

class TrendsClass extends ChangeNotifier {
  TrendsModel? trend;
  bool isLoading = false;
  getTrends({required BuildContext context}) async {
    isLoading = true;
    trend = (await getTrendsData(context: context));
    isLoading = false;
    notifyListeners();
  }
}
