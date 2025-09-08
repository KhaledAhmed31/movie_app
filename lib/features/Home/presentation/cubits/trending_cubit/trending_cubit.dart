import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/Home/domain/entities/section_movies_entity.dart';
import 'package:movie_app/features/Home/domain/usecases/get_trending_use_case.dart';
import 'package:movie_app/features/Home/presentation/cubits/trending_cubit/trending_state.dart';
@lazySingleton
class TrendingCubit extends Cubit<TrendingState>{
  final GetTrendingUseCase _getTrendingUseCase;
  List<SectionsMovieEntity> trendingMovies = [];
  
  TrendingCubit(this._getTrendingUseCase):super(TrendingInitialState()){
    getTrendingMovies();
  }
  Future<void> getTrendingMovies()async{
    emit(TrendingLoadingState());
    final (failure, movies) = await _getTrendingUseCase();
    if(failure!=null){
      log(failure.message);
      trendingMovies = movies?.results??[];
      emit(TrendingErrorState(failure.message));
    }else{
      trendingMovies = movies?.results??[];
      emit(TrendingLoadedState());
    }
  }
}