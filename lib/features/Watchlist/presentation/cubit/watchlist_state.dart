
abstract class WatchlistState {
  const WatchlistState();

}

class WatchlistInitialState extends WatchlistState {}

class WatchlistLoadingState extends WatchlistState {}

class WatchlistLoadedState extends WatchlistState {}

class WatchlistErrorState extends WatchlistState {
  final String message;
  WatchlistErrorState(this.message);
}

