import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:twitter_crawling_app/routes/app_routes.dart';
import 'package:twitter_crawling_app/shared/theme.dart';
import 'package:twitter_crawling_app/utils/assets_directory.dart';
import 'package:twitter_crawling_app/widgets/margin_height.dart';
import 'package:twitter_crawling_app/widgets/margin_width.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});

  final List<String> _listNameMember = [
    "Alif Ilman Nafian",
    "Arfi Triawan",
    "Azzahra Ayu Vahendra",
    "Bagus Subagja",
    "Balqis Aqilah Syahira",
    "Iman Nurohman",
    "Septian Dwi Putra Pradipta",
    "Zulfa Nursyadiyah"
  ];

  final List<String> _listPictureMember = [
    'alif.png',
    'arfi.png',
    'azzahra.png',
    'bagus-subagja.png',
    'balqis.png',
    'iman-nurohman.png',
    'septian.png',
    'zulfa-nursyadiyah.png'
  ];

  final List<String> _listRoleMember = [
    "Backend Dev",
    "Backend Dev",
    "Quality Assurance",
    "Frontend Dev",
    "UI/UX Designer",
    "Backend Dev",
    "UI/UX Designer",
    "Project Manager",
  ];

  final List<int> _listIdMember = [
    2009431,
    2002890,
    2004717,
    2008315,
    2001982,
    2005086,
    2007428,
    2009156
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: extraLightGray,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            _headerSection(context),
            _partOfHeaderSection(),
            MarginHeight(height: 10.h),
            _mainSection(),
          ],
        ),
      ),
    );
  }

  Widget _headerSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              SvgPicture.asset(svgDirIcon),
              MarginWidth(width: 3.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Us!',
                    style: regularText.copyWith(fontSize: 11.sp),
                  ),
                  Text(
                    'Introduction',
                    style: regularText.copyWith(
                        fontSize: 13.sp, fontWeight: FontWeight.w700),
                  )
                ],
              )
            ],
          ),
          MarginWidth(width: 2.w),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.topTrendsScreen);
            },
            child: Container(
              height: 5.h,
              width: 6.5.h,
              decoration: BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.arrow_forward_outlined,
                color: extraLightGray,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _partOfHeaderSection() {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, left: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ngecrawling topik apa',
            style: regularText.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'jadi topik ini mengenai',
            style: regularText.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: blackColor),
      child: Column(
        children: [
          MarginHeight(height: 2.h),
          Text(
            'Our Team',
            style: titleText.copyWith(
              color: pureWhite,
              fontSize: 20.sp,
            ),
          ),
          MarginHeight(height: 2.h),
          Container(
            width: 8.h,
            height: 0.5.h,
            decoration: BoxDecoration(
                color: pureWhite, borderRadius: BorderRadius.circular(100)),
          ),
          MarginHeight(height: 5.h),
          _memberSection(),
        ],
      ),
    );
  }

  Widget _memberSection() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return MarginHeight(height: 3.h);
      },
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _listNameMember.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 2.h, right: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 8.h,
                    width: 8.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        '$imgDir/${_listPictureMember[index]}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  MarginWidth(width: 2.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: Text(
                          _listNameMember[index],
                          style: regularText.copyWith(
                              color: pureWhite,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        _listIdMember[index].toString(),
                        style: regularText.copyWith(color: pureWhite),
                      )
                    ],
                  )
                ],
              ),
              Text(
                _listRoleMember[index],
                style: regularText.copyWith(color: darkGray, fontSize: 11.sp),
              )
            ],
          ),
        );
      },
    );
  }
}
