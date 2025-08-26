import 'package:movies_app/models/movies_model.dart';
import '../api/api_manager.dart';
import '../constants/end_points.dart';
import 'home_repo.dart';

class HomeRepoImpelementation implements HomeRepo {
  final ApiManager apiManager = ApiManager();

  @override
  Future<MoviesModel> getMovies({int limit = 10}) async {
    try {
      var response = await apiManager.getApi(
        endPoint: ApiUrls.listMoviesEndpoint,
        parameters: {'limit': limit, "sort_by": "rating", "order_by": "desc"},
      );
      return MoviesModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Movies>> searchMovies(String query, {int limit = 20}) async {
    try {
      final response = await apiManager.getApi(
        endPoint: ApiUrls.listMoviesEndpoint,
        parameters: {"query_term": query, "limit": limit},
      );

      final data = response.data["data"];
      if (data == null || data["movies"] == null) return [];

      final List moviesJson = data["movies"];
      return moviesJson.map((e) => Movies.fromJson(e)).toList();
    } catch (e) {
      print("❌ Error in searchMovies: $e");
      return [];
    }
  }

  @override
  Future<MoviesModel> getCategoryMovies(String genre, {int limit = 10}) async {
    try {
      var response = await apiManager.getApi(
        endPoint: ApiUrls.listMoviesEndpoint,
        parameters: {
          'limit': limit,
          "sort_by": "rating",
          "order_by": "desc",
          "genre": genre,
        },
      );
      return MoviesModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
