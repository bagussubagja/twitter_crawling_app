import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:twitter_crawling_app/shared/theme.dart';
import 'package:twitter_crawling_app/widgets/margin_height.dart';

import '../routes/app_routes.dart';
import '../utils/assets_directory.dart';
import '../widgets/margin_width.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: extraLightGray,
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              _headerSection(context),
              MarginHeight(height: 30.h),
              _customTextField(),
            ],
          ),
        ),
      ),
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
        ],
      ),
    );
  }

  Widget _customTextField() {
    return Padding(
      padding: EdgeInsets.only(left: 5.h, right: 5.h),
      child: Container(
        height: 8.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: blackColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _searchController,
                cursorColor: lightGray,
                style: regularText.copyWith(color: pureWhite, fontSize: 13.sp),
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle:
                      regularText.copyWith(color: lightGray, fontSize: 13.sp),
                  hintText: "Type Something...",
                ),
                onEditingComplete: () {
                  Navigator.pushNamed(context, AppRoutes.resultScreen,
                      arguments: _searchController.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
