import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:twitter_crawling_app/core/trends_notifier.dart';
import 'package:twitter_crawling_app/core/word_cloud_model.dart';
import 'package:twitter_crawling_app/shared/theme.dart';
import 'package:twitter_crawling_app/widgets/margin_height.dart';

import '../routes/app_routes.dart';
import '../utils/assets_directory.dart';
import '../widgets/margin_width.dart';

// ignore: must_be_immutable
class ResultScreen extends StatefulWidget {
  String query;
  String name;
  int tweetQuantity;
  ResultScreen(
      {super.key,
      required this.query,
      required this.tweetQuantity,
      required this.name});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final item = Provider.of<WordCloudClass>(context, listen: false);
    item.getWordCloud(
        context: context, query: widget.query, total: widget.tweetQuantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: extraLightGray,
      body: SafeArea(
          child: ListView(
        children: [
          _headerSection(context),
          _mainSection(),
          MarginHeight(height: 5.h)
        ],
      )),
    );
  }

  Widget _headerSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(svgDirIcon),
              MarginWidth(width: 15.w),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.aboutUsScreen);
                },
                child: Icon(
                  Icons.info_outline_rounded,
                  color: blackColor,
                  size: 8.h,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.h, top: 5.h),
            child: Text(
              widget.name,
              style: titleText.copyWith(fontSize: 20.sp),
            ),
          )
        ],
      ),
    );
  }

  Widget _mainSection() {
    final item = Provider.of<WordCloudClass>(context);

    if (item.wordCloud != null) {
      Map<String, dynamic> data = jsonDecode(item.wordCloud ?? '');
      print(item.wordCloud);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MarginHeight(height: 5.h),
          SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: data['image'],
                useOldImageOnUrlChange: false,
                placeholder: (context, url) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: blackColor,
                    ),
                  );
                },
              ),
            ),
          ),
          MarginHeight(height: 5.h),
          GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.splashScreen, (route) => false);
            },
            child: Container(
              alignment: Alignment.center,
              height: 8.h,
              width: 35.h,
              decoration: BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                'Go Back',
                style: regularText.copyWith(color: pureWhite, fontSize: 14.sp),
              ),
            ),
          )
        ],
      );
    } else {
      return Center(
        child: CircularProgressIndicator(color: blackColor),
      );
    }
  }
}
