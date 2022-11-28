import 'package:flutter/material.dart';

import '../services/trends_services.dart';

class WordCloudClass extends ChangeNotifier {
  String? wordCloud;
  getWordCloud(
      {required BuildContext context,
      required String query,
      required int total}) async {
    print(query);
    wordCloud = null;
    wordCloud =
        (await getWordCloudData(context: context, query: query, total: total));
    notifyListeners();
  }
}
