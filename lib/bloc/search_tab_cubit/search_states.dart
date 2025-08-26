import '../../models/movies_model.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  final List<Movies> movies;
  SearchSuccessState(this.movies);
}

class SearchErrorState extends SearchStates {
  final String message;
  SearchErrorState(this.message);
}
