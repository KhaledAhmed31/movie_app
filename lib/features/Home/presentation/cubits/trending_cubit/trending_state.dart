class TrendingState {}
class TrendingInitialState extends TrendingState {}
class TrendingLoadingState extends TrendingState {}
class TrendingLoadedState extends TrendingState {}
class TrendingErrorState extends TrendingState {
  final String message;
  TrendingErrorState(this.message);
}