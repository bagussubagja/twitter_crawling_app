import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:twitter_crawling_app/core/trends_notifier.dart';

import '../core/word_cloud_model.dart';

class ProviderList {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (_) => TrendsClass(),
    ),
    ChangeNotifierProvider(
      create: (_) => WordCloudClass(),
    )
  ];
}
