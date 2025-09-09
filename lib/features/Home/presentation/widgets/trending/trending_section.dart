import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/font/font_manager.dart';
import '../../cubits/trending_cubit/trending_cubit.dart';
import '../../cubits/trending_cubit/trending_state.dart';
import 'trending_card.dart';
import 'package:redacted/redacted.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.0.h),
      child: BlocProvider<TrendingCubit>(
        create: (context) => getIt.get<TrendingCubit>()..getTrendingMovies(),
        child: BlocBuilder<TrendingCubit, TrendingState>(
          builder: (context, state) {
            if (state is TrendingLoadingState) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  width: 145.w,
                  height: 210.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ).redacted(context: context, redact: true),

                itemCount: 5,
              );
            } else if (state is TrendingLoadedState) {
              final movies = BlocProvider.of<TrendingCubit>(
                context,
              ).trendingMovies;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => TrendingCard(
                  index: index + 1,
                  imageUrl: movies[index].posterPath ?? '',
                  id: movies[index].id??0,
                ),

                itemCount: 5,
              );
            } else if (state is TrendingErrorState) {
              return SizedBox(
                height: 150.h,
                child: Center(
                  child: Text(
                    state.message,
                    style: FontManager.getPoppinsRegularStyle(
                      fontSize: 18.sp,
                      color: AppColors.lightBlue,
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
