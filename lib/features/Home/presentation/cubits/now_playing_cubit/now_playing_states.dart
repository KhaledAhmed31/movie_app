class NowPlayingStates {}

class NowPlayingInitialState extends NowPlayingStates {}

class NowPlayingLoadingState extends NowPlayingStates {}

class NowPlayingErrorState extends NowPlayingStates {
  final String message;
  NowPlayingErrorState(this.message);
}

class NowPlayingLoadedState extends NowPlayingStates {}