import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/section_movies_entity.dart';
import '../../../domain/usecases/get_now_playing_use_case.dart';
import 'now_playing_states.dart';

@lazySingleton
class NowPlayingCubit extends Cubit<NowPlayingStates> {
  final GetNowPlayingUseCase _getNowPlayingUseCase;
  int? totalPages;
  int currentPage = 1;
  List<SectionsMovieEntity> nowPlayingMovies = [];
  NowPlayingCubit(this._getNowPlayingUseCase)
    : super(NowPlayingInitialState()) {
    getNowPlaying();
  }

  Future<void> getNowPlaying([int page = 1]) async {
    emit(NowPlayingLoadingState());
    final (failure, result) = await _getNowPlayingUseCase.call(page);
    if (failure != null) {
      emit(NowPlayingErrorState(failure.message));
    } else {
      nowPlayingMovies = result?.results ?? [];
      currentPage = page;
      totalPages = result?.totalPages;
      emit(NowPlayingLoadedState());
    }
  }
}
