import 'package:flutter/material.dart';
import '../../../../core/assets/assets.dart';
import '../../../../core/colors/app_colors.dart';
import 'custom_nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, this.onTap, required this.currentIndex});
  final void Function(int)? onTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.lightBlue, width: 1),
          top: BorderSide(color: AppColors.lightBlue, width: 2),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightBlue,
            offset: Offset(0, -1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          BottomNavigationBar(

            items: [
              CustomNavBarItem(icon: Assets.iconsHome, label: 'Home'),
              CustomNavBarItem(icon: Assets.iconsSearch, label: 'Search'),
              CustomNavBarItem(icon: Assets.iconsSave, label: 'Watchlist'),
            ],
            currentIndex: currentIndex,
            onTap: onTap,
          ),
          const Divider(color: AppColors.lightBlue, height: 1, thickness: 1),
        ],
      ),
    );
  }
}
