import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../cubits/top_rated_cubit/top_rated_cubit.dart';
import '../../cubits/top_rated_cubit/top_rated_state.dart';
import '../movies_grid.dart';
import '../page_indecator.dart';

class TopRatedView extends StatelessWidget {
  const TopRatedView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<TopRatedCubit>();
    return BlocProvider<TopRatedCubit>.value(
      value:cubit,
      child: BlocBuilder<TopRatedCubit, TopRatedStates>(
        builder: (context, state) {
          if (state is TopRatedLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.lightBlue),
            );
          } else if (state is TopRatedLoadedState) {
            final movies = BlocProvider.of<TopRatedCubit>(
              context,
            ).topRatedMovies;
            return SingleChildScrollView(
              child: Column(
                children: [
                  MoviesGrid(
                    movies: movies,
                    crossAxisSpacing: 14.w,
                    mainAxisSpacing: 18.h,
                    mainAxisExtent: 146.h,
                    maxCrossAxisExtent: 3,
                  ),
                  PageIndecator(
                    onTap: (index) => cubit.getTopRatedMovies(index),
                    pageCount: cubit.totalPages ,
                    selectedPage: cubit.currentPage,
                  ),
                ],
              ),
            );
     
          } else if (state is TopRatedErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
