import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../cubits/popular_cubit/popular_cubit.dart';
import '../../cubits/popular_cubit/popular_states.dart';
import '../movies_grid.dart';
import '../page_indecator.dart';

class PopularView extends StatelessWidget {
  const PopularView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<PopularCubit>();
    return BlocProvider<PopularCubit>.value(
      value: cubit,
      child: BlocBuilder<PopularCubit, PopularStates>(
        builder: (context, state) {
          if (state is PopularLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.lightBlue),
            );
          } else if (state is PopularLoadedState) {
            final movies = BlocProvider.of<PopularCubit>(context).popularMovies;
            return SingleChildScrollView(
              child: Column(
                children: [
                  MoviesGrid(
                    movies: movies,
                    crossAxisSpacing: 14.w,
                    mainAxisSpacing: 18.h,
                    mainAxisExtent: 146.h,
                    maxCrossAxisExtent: 100.w,
                  ),
                  PageIndecator(
                    onTap: (index) => cubit.getPopularMovies(index),
                    pageCount: cubit.totalPages ?? 10,
                    selectedPage: cubit.currentPage,
                  ),
                ],
              ),
            );
     
          } else if (state is PopularErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
