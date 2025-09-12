
abstract class SearchState {


}

class SearchInitialStete extends SearchState {}
class SearchLoadedState extends SearchState {}
class SearchLoadingState extends SearchState {}
class SearchGetMoreLoadingState extends SearchState {}
class SearchErrorState extends SearchState {
  final String message;
  SearchErrorState(this.message);
}

