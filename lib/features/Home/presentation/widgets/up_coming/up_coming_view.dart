import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/di/dependency_injection.dart';
import 'package:movie_app/features/Home/presentation/cubits/up_coming/up_coming_cubit.dart';
import 'package:movie_app/features/Home/presentation/cubits/up_coming/up_coming_states.dart';
import 'package:movie_app/features/Home/presentation/widgets/movies_grid.dart';
import 'package:movie_app/features/Home/presentation/widgets/page_indecator.dart';

class UpComingView extends StatelessWidget {
  const UpComingView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<UpComingCubit>();
    return BlocProvider<UpComingCubit>.value(
      value: cubit,
      child: BlocBuilder<UpComingCubit, UpComingStates>(
        builder: (context, state) {
          if (state is UpComingLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.lightBlue),
            );
          } else if (state is UpComingLoadedState) {
            final movies = BlocProvider.of<UpComingCubit>(
              context,
            ).upComingMovies;
            return  SingleChildScrollView(
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
                    onTap: (index) => cubit.getUpComingMovies(index),
                    pageCount: cubit.totalPages ,
                    selectedPage: cubit.currentPage,
                  ),
                ],
              ),
            );
     
          } else if (state is UpComingErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
