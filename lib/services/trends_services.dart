import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_crawling_app/models/trends_model.dart';
import 'package:twitter_crawling_app/models/word_cloud_model.dart';

Future<TrendsModel> getTrendsData({required BuildContext context}) async {
  var client = http.Client();
  var uri = Uri.parse('https://rx2dar.deta.dev/trends');
  try {
    var respone =
        await client.get(uri, headers: {'accept': 'application/json'});
    if (respone.statusCode == 200) {
      var json = respone.body;
      return trendsModelFromJson(json);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return TrendsModel();
}

Future<String> getWordCloudData({required BuildContext context, required String query, required int total}) async {
  var client = http.Client();
  var uri = Uri.parse('https://rx2dar.deta.dev/generate-word-cloud?keyword=$query&total_tweet=$total');
  try {
    var respone =
        await client.get(uri, headers: {'accept': 'application/json'});
    if (respone.statusCode == 200) {
      var json = respone.body;
      return json;
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return '';
}
