<<<<<<< HEAD
import 'package:movies_app/models/movies_suggestions.dart';
import 'package:movies_app/models/movies_model.dart';
import 'package:movies_app/models/movie_details.dart';
=======
import 'package:movies_app/models/movie_details.dart';
import 'package:movies_app/models/movies_suggestions.dart';

import '../models/movies_model.dart';
>>>>>>> origin/develop_amer

abstract class HomeRepo {
  Future<MoviesModel> getMovies();
  Future<MoviesModel> getCategoryMovies(String genre, {int limit = 10});
<<<<<<< HEAD

  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<SuggestedMoviesModel> getSimilarMovie(int movieId);
}
=======
  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<SuggestedMoviesModel> getSimilarMovie(int movieId);

}
>>>>>>> origin/develop_amer
