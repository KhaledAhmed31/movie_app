
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/colors/app_colors.dart';

class CustomNavBarItem extends BottomNavigationBarItem {
  CustomNavBarItem({super.key, required String icon, required super.label})
    : super(
        icon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SvgPicture.asset(
            icon,
            width: 21.74.h,
            height: 24.w,
            colorFilter: const ColorFilter.mode(
              AppColors.grey,
              BlendMode.srcIn,
            ),
          ),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SvgPicture.asset(
            icon,
            width: 21.74.h,
            height: 24.w,
            colorFilter: const ColorFilter.mode(
              AppColors.lightBlue,
              BlendMode.srcIn,
            ),
          ),
        ),
      );
}
