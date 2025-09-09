import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../cubits/now_playing_cubit/now_playing_cubit.dart';
import '../../cubits/now_playing_cubit/now_playing_states.dart';
import '../movies_grid.dart';
import '../page_indecator.dart';

class NowPlayingView extends StatelessWidget {
  const NowPlayingView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<NowPlayingCubit>();

    return BlocProvider<NowPlayingCubit>.value(
      value: cubit,
      child: BlocBuilder<NowPlayingCubit, NowPlayingStates>(
        builder: (context, state) {
          if (state is NowPlayingLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.lightBlue),
            );
          } else if (state is NowPlayingLoadedState) {
            final movies = cubit.nowPlayingMovies;
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
                    onTap: (index) => cubit.getNowPlaying(index),
                    pageCount: cubit.totalPages ?? 10,
                    selectedPage: cubit.currentPage,
                  ),
                ],
              ),
            );
          } else if (state is NowPlayingErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
