import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:twitter_crawling_app/core/trends_notifier.dart';
import 'package:twitter_crawling_app/screens/result_screen.dart';
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
  final _queryController = TextEditingController();
  final _nameController = TextEditingController();
  final _tweetQuantityController = TextEditingController();
  bool _isVisible = false;
  int? values;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final item = Provider.of<TrendsClass>(context, listen: false);
    item.getTrends(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<TrendsClass>(context);

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
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    _headerSection(context),
                    MarginHeight(height: 20.h),
                    _queryTextField(),
                    MarginHeight(height: 3.h),
                    _tweetQuantityTextField(),
                    MarginHeight(height: 3.h),
                    Visibility(
                      visible: _isVisible,
                      replacement: Center(
                        child: CircularProgressIndicator(
                          color: blackColor,
                        ),
                      ),
                      child: _button(),
                    ),
                    MarginHeight(height: 3.h),
                    _suggestedItem()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _button() {
    return GestureDetector(
      onTap: () {
        if ((_queryController.text.isNotEmpty &&
                _nameController.text.isNotEmpty) &&
            _tweetQuantityController.text.isNotEmpty) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ResultScreen(
                  query: _queryController.text,
                  name: _nameController.text,
                  tweetQuantity: int.parse(_tweetQuantityController.text));
            },
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Field tidak boleh kosong')));
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 5.h,
        width: 55.w,
        decoration: BoxDecoration(
            color: blackColor, borderRadius: BorderRadius.circular(100)),
        child: Text(
          'Generate Word Cloud!',
          style: regularText.copyWith(color: pureWhite),
        ),
      ),
    );
  }

  Widget _suggestedItem() {
    final item = Provider.of<TrendsClass>(context);

    if (item.trend?.trends?.length == null) {
      return Center(
        child: CircularProgressIndicator(color: blackColor),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Suggested query based on trends',
          style: regularText.copyWith(color: darkGray, fontSize: 12.sp),
          textAlign: TextAlign.center,
        ),
        MarginHeight(height: 2.h),
        Wrap(
          alignment: WrapAlignment.spaceAround,
          runSpacing: 10,
          spacing: 10,
          children: List.generate(item.trend?.trends?.length ?? 0, (index) {
            final itemQuery = item.trend?.trends?[index].query;
            final itemName = item.trend?.trends?[index].name;

            return GestureDetector(
              onTap: () {
                setState(() {
                  if (itemName != null) {
                    _queryController.text = itemQuery ?? '';
                    _nameController.text = itemName;
                  }
                });
              },
              child: Container(
                height: 10.h,
                width: 15.h,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: blackColor, borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    '$itemName',
                    style: regularText.copyWith(color: pureWhite),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }),
        )
      ],
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

  Widget _queryTextField() {
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
                controller: _nameController,
                cursorColor: lightGray,
                style: regularText.copyWith(color: pureWhite, fontSize: 13.sp),
                onChanged: (val) {
                  setState(() {
                    _queryController.text = val.replaceAll(" ", "+");
                  });
                },
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle:
                      regularText.copyWith(color: lightGray, fontSize: 13.sp),
                  hintText: "Insert your query here...",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tweetQuantityTextField() {
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
                onEditingComplete: () {
                  if ((_queryController.text.isNotEmpty &&
                          _nameController.text.isNotEmpty) &&
                      _tweetQuantityController.text.isNotEmpty) {
                    if (values! < 101) {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    }
                  }
                },
                onChanged: (value) {
                  setState(() {
                    values = int.parse(value);
                  });
                  if (value.isNotEmpty) {
                    if (int.parse(value) > 100) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'Maksimal Tweet tidak boleh lebih dari 100')));
                    }
                  }
                },
                controller: _tweetQuantityController,
                cursorColor: lightGray,
                maxLength: 3,
                style: regularText.copyWith(color: pureWhite, fontSize: 13.sp),
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: "",
                  hintStyle:
                      regularText.copyWith(color: lightGray, fontSize: 13.sp),
                  hintText: "How many tweets you want?",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
