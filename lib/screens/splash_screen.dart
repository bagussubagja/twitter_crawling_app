import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:twitter_crawling_app/routes/app_routes.dart';
import 'package:twitter_crawling_app/shared/theme.dart';
import 'package:twitter_crawling_app/utils/assets_directory.dart';
import 'package:twitter_crawling_app/widgets/margin_height.dart';
import 'package:twitter_crawling_app/widgets/margin_width.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            _headerSection(),
            _textAppSection(),
            _textDescAppSection(),
            _bottomSection(context)
          ],
        ),
      ),
    );
  }

  Widget _headerSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SvgPicture.asset(
                '$svgDirSplash/1.svg',
                height: 22.h,
              ),
            ),
            SvgPicture.asset(
              '$svgDirSplash/2.svg',
              height: 18.h,
            )
          ],
        ),
        MarginHeight(
          height: 3.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset(
            '$svgDirSplash/3.svg',
            height: 15.h,
          ),
        ),
        MarginHeight(height: 3.h),
        Align(
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(
            '$svgDirSplash/4.svg',
            height: 15.h,
          ),
        ),
        MarginHeight(height: 3.h),
      ],
    );
  }

  Widget _textAppSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Twitter',
              style: titleText.copyWith(color: blueColor, fontSize: 26.sp),
            ),
            MarginWidth(width: 2.w),
            Text(
              'Crawling',
              style: titleText.copyWith(fontSize: 26.sp, color: pureWhite),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.h, top: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 0.4.h,
                width: 10.h,
                decoration: BoxDecoration(
                  color: pureWhite,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              MarginHeight(height: 0.8.h),
              Container(
                height: 0.4.h,
                width: 4.h,
                decoration: BoxDecoration(
                  color: pureWhite,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _textDescAppSection() {
    return Padding(
      padding: EdgeInsets.only(left: 8.5.h),
      child: Text(
        'Wordcloud \nGenerator',
        style: titleText.copyWith(
          fontSize: 24.sp,
          color: pureWhite,
        ),
      ),
    );
  }

  Widget _bottomSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: SvgPicture.asset(
            '$svgDirSplash/5.svg',
            height: 1.h,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.aboutUsScreen);
          },
          child: Container(
            alignment: Alignment.center,
            height: 6.h,
            width: 13.h,
            decoration: BoxDecoration(
              color: pureWhite,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Start',
                  style: regularText,
                ),
                Icon(
                  Icons.arrow_forward_outlined,
                  color: blackColor,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
