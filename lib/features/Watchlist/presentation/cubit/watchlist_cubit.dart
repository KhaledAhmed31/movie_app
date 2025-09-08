import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/MovieDetails/domain/entities/movie_details_entity.dart';
import 'package:movie_app/features/Watchlist/data/repositories/watchlist_repo.dart';
import 'package:movie_app/features/Watchlist/domain/entity/watchlist_entity.dart';
import 'package:movie_app/features/Watchlist/presentation/cubit/watchlist_state.dart';

@singleton
class WatchlistCubit extends Cubit<WatchlistState> {
  final WatchlistRepo _watchlistRepo;
  List<WatchlistEntity> movies = [];
  WatchlistCubit(this._watchlistRepo) : super(WatchlistInitialState()) {
    getWatchlist();
  }

  Future<void> getWatchlist() async {
    emit(WatchlistLoadingState());
      final (failure, result) = await _watchlistRepo.getWatchlist();

      if (result != null) {
        movies = result;
        emit(WatchlistLoadedState());
      }else{
        emit(WatchlistErrorState(failure!.message));
      }
       
  }
  Future<void> addToWatchlist(MovieDetailsEntity movie) async {
    emit(WatchlistLoadingState());
      final (failure, result) = await _watchlistRepo.addToWatchlist(movie);

      if (result != null) {
        movies = result;
        emit(WatchlistLoadedState());
      }else{
        emit(WatchlistErrorState(failure!.message));
      }
       
  }
 Future<void> deleteFromWatchlist(MovieDetailsEntity movie) async {
    emit(WatchlistLoadingState());
      final (failure, result) = await _watchlistRepo.deleteFromWatchlist(movie);

      if (result != null) {
        movies = result;
        emit(WatchlistLoadedState());
      }else{
        emit(WatchlistErrorState(failure!.message));
      }
       
  }

}
