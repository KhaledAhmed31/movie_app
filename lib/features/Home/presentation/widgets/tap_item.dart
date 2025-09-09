import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/font/font_manager.dart';

class TapItem extends StatelessWidget {
  const TapItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      
      style: FontManager.getPoppinsMediumStyle(
        fontSize: 14.sp,
        color: Colors.white,
      ),
    );
  }
}
