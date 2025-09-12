import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../Home/domain/entities/section_movies_entity.dart';
import '../../domain/repositories/search_repo_interface.dart';
import 'search_state.dart';

@lazySingleton
class SearchCubit extends Cubit<SearchState> {
  final SearchRepoInterface _searchRepoInterface;
  int currentPage = 1;
  int totalPages = 1;
  Timer? _debounce;
  List<SectionsMovieEntity> movies = [];
  SearchCubit(this._searchRepoInterface) : super(SearchInitialStete());

  Future<void> searchMovies({required String query,page=1}) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    if (query.isEmpty) {
      clear();
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 700), () async {
      emit(SearchLoadingState());
      final (failure, result) = await _searchRepoInterface.searchMovies(
        query: query,
        page: page
      );
      if (failure != null) {
        emit(SearchErrorState(failure.message));
      } else {
        currentPage = page;
        totalPages = result?.totalPages ?? 1;
        movies = result?.results ?? [];
        emit(SearchLoadedState());
      }
    });
  }

  Future<void> loadMoreMovies({required String query}) async {
    if (currentPage < totalPages) {
      emit(SearchGetMoreLoadingState());
      currentPage += 1;
      final (failure, result) = await _searchRepoInterface.searchMovies(
        query: query,
        page: currentPage,
      );
      if (failure != null) {
        emit(SearchErrorState(failure.message));
      } else {
        movies.addAll(result?.results ?? []);
        emit(SearchLoadedState());
      }
    }
  }

  void clear() {
    movies = [];
    emit(SearchInitialStete());
  }
}
