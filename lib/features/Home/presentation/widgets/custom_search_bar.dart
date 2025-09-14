import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets/assets.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/font/font_manager.dart';
import '../../../Search/presentation/cubit/search_cubit.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, this.pageController, this.controller});
  final PageController? pageController;
  final TextEditingController? controller;
  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final FocusNode focusNode;
  @override
  void initState() {
    focusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: 327.w,
      child: TextField(
        focusNode: focusNode,
        controller: widget.controller,
        cursorColor: AppColors.grey,
        style: FontManager.getRobotoRegularStyle(
          fontSize: 13.sp,
          color: Colors.white,
        ),
        onTap: () {
          if (widget.pageController != null) {
            focusNode.unfocus();
            widget.pageController?.animateToPage(
              1,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 300),
            );
          }
        },
        onTapOutside: (event) => focusNode.unfocus(),
        onChanged: (value) async {
          await context.read<SearchCubit>().searchMovies(query: value);
        },
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
    );
  }
}
