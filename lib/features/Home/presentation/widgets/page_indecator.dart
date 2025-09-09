import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/font/font_manager.dart';

class PageIndecator extends StatefulWidget {
  const PageIndecator({
    super.key,
    required this.pageCount,
    required this.onTap,
    required this.selectedPage,
  });
  final int pageCount;
  final int selectedPage;
  final void Function(int index) onTap;
  @override
  State<PageIndecator> createState() => _PageIndecatorState();
}

class _PageIndecatorState extends State<PageIndecator> {
  late final ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo((widget.selectedPage - 1) * 50.w);
    });
    super.initState();
  }

  @override
  dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.h),
      child: SizedBox(
        height: 40.h,
        width: MediaQuery.of(context).size.width - 40.w,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 10.w),
          scrollDirection: Axis.horizontal,
          controller: scrollController,

          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              widget.onTap(index + 1);
            },
            child: SizedBox(
              width: 40.w,
              child: Card(
                color: AppColors.lightBlue.withValues(alpha: .2),
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    style: FontManager.getPoppinsMediumStyle(
                      fontSize: 14.sp,
                      color: (widget.selectedPage == index + 1)
                          ? AppColors.lightBlue
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          itemCount: widget.pageCount,
        ),
      ),
    );
  }
}
