import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:twitter_crawling_app/routes/app_routes.dart';
import 'package:twitter_crawling_app/shared/theme.dart';
import 'package:twitter_crawling_app/utils/assets_directory.dart';
import 'package:twitter_crawling_app/widgets/margin_height.dart';

import '../widgets/margin_width.dart';

class TopTrendsScreen extends StatelessWidget {
  TopTrendsScreen({super.key});

  final List<String> _trendsItem = [
    "BTS",
    "Piala Dunia",
    "Gojek",
    "Valorant",
  ];

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
            padding: EdgeInsets.only(top: 5.h, left: 5.h),
            child: Text(
              'Top Trends',
              style: titleText.copyWith(fontSize: 22.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainSection() {
    return Padding(
      padding: EdgeInsets.only(left: 5.h, right: 5.h, top: 3.h),
      child: ListView.separated(
          shrinkWrap: true,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.searchScreen);
              },
              child: Container(
                alignment: Alignment.center,
                height: 8.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: blackColor),
                child: Text(
                  _trendsItem[index],
                  textAlign: TextAlign.center,
                  style: regularText.copyWith(
                    color: pureWhite,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return MarginHeight(height: 2.h);
          },
          itemCount: _trendsItem.length),
    );
  }
}
