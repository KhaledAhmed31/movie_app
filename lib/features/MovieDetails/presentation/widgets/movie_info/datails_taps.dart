import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/font/font_manager.dart';
import '../../../../Home/presentation/widgets/tap_item.dart';
import '../../../domain/entities/movie_details_entity.dart';

class DetailsTabs extends StatefulWidget {
  const DetailsTabs({super.key, required this.movie});
  final MovieDetailsEntity movie;
  @override
  State<DetailsTabs> createState() => _DetailsTabsState();
}

class _DetailsTabsState extends State<DetailsTabs>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: TabBar(
            tabAlignment: TabAlignment.start,
            controller: tabController,
            isScrollable: true,
            labelPadding: EdgeInsets.only(bottom: 15.h, right: 28.w),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4.h,
            dividerColor: Colors.transparent,
            indicatorColor: AppColors.grey,
            overlayColor: WidgetStateProperty.all(Colors.transparent),

            onTap: (value) => tabController.animateTo(value),
            tabs: const [
              TapItem(title: 'About Movie'),
              TapItem(title: 'Review'),
              TapItem(title: 'Cast'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 24.h),
                child: Text(
                  widget.movie.overview ?? '',
                  style: FontManager.getPoppinsRegularStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              const Center(child: Text('Review')),
              const Center(child: Text('Cast')),
            ],
          ),
        ),
      ],
    );
  }
}
