import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/Home/presentation/cubits/trending_cubit/trending_events.dart';

import '../../../domain/entities/section_movies_entity.dart';
import '../../../domain/usecases/get_trending_use_case.dart';
import 'trending_state.dart';

@lazySingleton
class TrendingCubit extends Bloc<TrendingEvents, TrendingState> {
  final GetTrendingUseCase _getTrendingUseCase;
  List<SectionsMovieEntity> trendingMovies = [];

  TrendingCubit(this._getTrendingUseCase) : super(TrendingInitialState()) {
    on<GetTrendingEvent>(getTrendingMovies);
    add(GetTrendingEvent());
  }

  Future<void> getTrendingMovies(GetTrendingEvent event,Emitter<TrendingState> emit) async {
    emit(TrendingLoadingState());
    final (failure, movies) = await _getTrendingUseCase();
    if (failure != null) {
      log(failure.message);
      trendingMovies = movies?.results ?? [];
      emit(TrendingErrorState(failure.message));
    } else {
      trendingMovies = movies?.results ?? [];
      emit(TrendingLoadedState());
    }
  }
}

// TrendingCubit(this._getTrendingUseCase) : super(TrendingInitialState()) {
//   getTrendingMovies();
// }
// Future<void> getTrendingMovies() async {
//   emit(TrendingLoadingState());
//   final (failure, movies) = await _getTrendingUseCase();
//   if (failure != null) {
//     log(failure.message);
//     trendingMovies = movies?.results ?? [];
//     emit(TrendingErrorState(failure.message));
//   } else {
//     trendingMovies = movies?.results ?? [];
//     emit(TrendingLoadedState());
//   }
// }

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose -- ${bloc.runtimeType}');
  }
}
