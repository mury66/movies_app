import 'package:movies_app/models/movie_details.dart';
import 'package:movies_app/models/movies_suggestions.dart';

import '../models/movies_model.dart';

abstract class HomeRepo {
  Future<MoviesModel> getMovies();
  Future<MoviesModel> getCategoryMovies(String genre, {int limit = 10});
  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<SuggestedMoviesModel> getSimilarMovie(int movieId);

}