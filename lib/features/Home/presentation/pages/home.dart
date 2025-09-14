import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets/assets.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/font/font_manager.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/sectons_view.dart';
import '../widgets/trending/trending_section.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.pageController});
  final PageController pageController;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.only(right: 22.0.w, left: 22.0.w, top: 5.h),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            centerTitle: false,
            titleSpacing: 0,
            expandedHeight: 55.h,
            title: Text(
              'What do you want to watch?',
              style: FontManager.getPoppinsSemiBoldStyle(
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
          ),
          SliverFloatingHeader(
            snapMode: FloatingHeaderSnapMode.scroll,
            child: CustomSearchBar(pageController: widget.pageController),
          ),
          SliverAppBar(
            toolbarHeight: 275.h,
            flexibleSpace: const FlexibleSpaceBar(

              background: TrendingSection(),
            ),
          ),
        ],
        body: const SectonsView(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Column(
      children: [
        SizedBox(
          height: 45.h,
          width: 327.w,
          child: TextField(
            selectionWidthStyle: BoxWidthStyle.tight,
            cursorColor: AppColors.grey,
            style: FontManager.getRobotoRegularStyle(
              fontSize: 13.sp,
              color: Colors.white,
            ),
            selectionHeightStyle: BoxHeightStyle.tight,
            decoration: InputDecoration(
              hintText: 'Search',
              filled: true,
              alignLabelWithHint: true,
              hintStyle: FontManager.getPoppinsRegularStyle(
                fontSize: 14.sp,
                color: AppColors.grey,
              ),

              fillColor: AppColors.searchBarGrey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 13.h,
                horizontal: 20.w,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0.h),
                child: SvgPicture.asset(
                  Assets.iconsSearchBarSearchIcon,
                  colorFilter: const ColorFilter.mode(
                    AppColors.grey,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 66.h;

  @override
  double get minExtent => 45.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
