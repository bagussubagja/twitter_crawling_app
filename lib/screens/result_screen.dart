import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:twitter_crawling_app/shared/theme.dart';
import 'package:twitter_crawling_app/widgets/margin_height.dart';

import '../routes/app_routes.dart';
import '../utils/assets_directory.dart';
import '../widgets/margin_width.dart';

// ignore: must_be_immutable
class ResultScreen extends StatefulWidget {
  String query;
  ResultScreen({super.key, required this.query});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: extraLightGray,
      body: SafeArea(
          child: ListView(
        children: [
          _headerSection(context),
          _mainSection(),
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
              widget.query,
              style: titleText.copyWith(fontSize: 20.sp),
            ),
          )
        ],
      ),
    );
  }

  Widget _mainSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MarginHeight(height: 5.h),
        SizedBox(
          height: 30.h,
          width: 30.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              '$imgDir/demo-word-cloud.png',
              fit: BoxFit.cover,
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
  }
}
