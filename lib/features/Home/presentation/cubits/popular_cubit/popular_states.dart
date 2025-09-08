class PopularStates {}
class PopularInitialState extends PopularStates{}

class PopularLoadingState extends PopularStates{}
class PopularLoadedState extends PopularStates{}
class PopularErrorState extends PopularStates{
  final String message;
  PopularErrorState(this.message);
}