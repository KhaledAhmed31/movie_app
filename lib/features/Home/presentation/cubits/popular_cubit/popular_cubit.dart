import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/Home/domain/entities/section_movies_entity.dart';
import 'package:movie_app/features/Home/domain/usecases/get_popular_use_case.dart';
import 'package:movie_app/features/Home/presentation/cubits/popular_cubit/popular_states.dart';
@lazySingleton
class PopularCubit extends Cubit<PopularStates> {
  final GetPopularUseCase _getPopularUseCase;
  List<SectionsMovieEntity> popularMovies = [];
  int currentPage = 1;
  int? totalPages;
  PopularCubit(this._getPopularUseCase) : super(PopularInitialState()){
    getPopularMovies();
  }

  Future<void> getPopularMovies([int page = 1]) async {
    emit(PopularLoadingState());
    final (failure, result) = await _getPopularUseCase.call(page);
    if (failure != null) {
      emit(PopularErrorState(failure.message));
    } else {
      currentPage = page;
      totalPages = result?.totalPages;
      popularMovies = result?.results ?? [];
      emit(PopularLoadedState());
    }
  }
}
