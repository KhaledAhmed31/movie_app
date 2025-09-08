class UpComingStates {}

class UpComingInitialState extends UpComingStates {}

class UpComingLoadingState extends UpComingStates {}

class UpComingLoadedState extends UpComingStates {}

class UpComingErrorState extends UpComingStates {
  final String message;
  UpComingErrorState({required this.message});
}