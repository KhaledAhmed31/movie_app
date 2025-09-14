import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/app_colors.dart';
import 'now_playing/now_playing_view.dart';
import 'popular/popular_view.dart';
import 'tap_item.dart';
import 'top_rated/top_rated_view.dart';
import 'up_coming/up_coming_view.dart';

class SectonsView extends StatefulWidget {
  const SectonsView({super.key});

  @override
  State<SectonsView> createState() => _SectonsViewState();
}

class _SectonsViewState extends State<SectonsView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.center,
            controller: tabController,
            indicatorColor: AppColors.grey,
            labelPadding: EdgeInsets.only(bottom: 15.h, right: 6, left: 6,top: 10.h),
            isScrollable: true,
            physics: const NeverScrollableScrollPhysics(),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4.h,
            dividerColor: Colors.transparent,

            onTap: (value) => tabController.animateTo(value),
            tabs: const [
              TapItem(title: 'Now Playing'),
              TapItem(title: 'Popular'),
              TapItem(title: 'Top Rated'),
              TapItem(title: 'Upcoming'),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                NowPlayingView(),
                PopularView(),
                TopRatedView(),
                UpComingView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
