class TopRatedStates {}

class TopRatedInitialState extends TopRatedStates {}

class TopRatedLoadingState extends TopRatedStates {}

class TopRatedLoadedState extends TopRatedStates {}

class TopRatedErrorState extends TopRatedStates {
  final String message;
  TopRatedErrorState(this.message);
}
