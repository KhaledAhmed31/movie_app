import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/section_movies_entity.dart';
import '../../../domain/usecases/get_top_rated_use_case.dart';
import 'top_rated_state.dart';
@lazySingleton
class TopRatedCubit extends Cubit<TopRatedStates> {
  final GetTopRatedUseCase _getTopRatedUseCase;
  List<SectionsMovieEntity> topRatedMovies = [];
  int currentPage = 1;
  int totalPages = 1;
  TopRatedCubit(this._getTopRatedUseCase) : super(TopRatedInitialState()){
    getTopRatedMovies();
  }

  Future<void> getTopRatedMovies([int page = 1]) async {
    emit(TopRatedLoadingState());
    final (failure, result) = await _getTopRatedUseCase.call(page);
    if (failure != null) {
      emit(TopRatedErrorState(failure.message));
    } else {
      currentPage = page;
      totalPages = result?.totalPages ?? 1;
      topRatedMovies = result?.results ?? [];
      emit(TopRatedLoadedState());
    }
  }
}
