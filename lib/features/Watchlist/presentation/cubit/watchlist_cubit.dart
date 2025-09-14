import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/mapper/watchlist_mapper.dart';
import '../../../MovieDetails/domain/entities/movie_details_entity.dart';
import '../../data/repositories/watchlist_repo.dart';
import '../../domain/entity/watchlist_entity.dart';
import 'watchlist_state.dart';

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
    } else {
      emit(WatchlistErrorState(failure!.message));
    }
  }

  Future<void> addToWatchlist(MovieDetailsEntity movie) async {
    emit(WatchlistLoadingState());
    final (failure, result) = await _watchlistRepo.addToWatchlist(movie);
    if (failure == null) {
      movies.add(movie.toWatchlistEntity());
      emit(WatchlistLoadedState());
    } else {
      emit(WatchlistErrorState(failure.message));
    }
  }

  Future<void> deleteFromWatchlist(MovieDetailsEntity movie) async {
    emit(WatchlistLoadingState());
    final (failure, result) = await _watchlistRepo.deleteFromWatchlist(movie);

    if (failure == null) {
      movies.removeWhere((element) => element.id == movie.id);
      log(movies.toString());
      emit(WatchlistLoadedState());
    } else {
      emit(WatchlistErrorState(failure.message));
    }
  }
}
