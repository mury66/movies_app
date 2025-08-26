import 'package:movies_app/models/movies_suggestions.dart';

import '../models/movies_model.dart';

abstract class HomeRepo {
  Future<MoviesModel> getMovies();
  Future<MoviesModel> getCategoryMovies(String genre, {int limit = 10});
}