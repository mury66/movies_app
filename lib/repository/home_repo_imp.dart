import 'package:movies_app/models/movies_suggestions.dart';
import 'package:movies_app/repository/home_repo.dart';

import '../api/api_manager.dart';
import '../constants/end_points.dart';
import '../models/movies_model.dart';

class HomeRepoImpelementation implements HomeRepo{
  ApiManager apiManager = ApiManager();

  @override
  Future<MoviesModel> getMovies() async{
    try{
      var response = await apiManager.getApi(endPoint: ApiUrls.listMoviesEndpoint,
          parameters:
          {
            'limit': 10,
            "sort_by" : "year",
            "sort_by" : "rating",
            "order_by" : "desc"
          }
      );
      MoviesModel result = MoviesModel.fromJson(response.data);
      return result;
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<MoviesModel> getCategoryMovies(String genre, {int limit = 10} ) async {
    try{
      var response = await apiManager.getApi(endPoint: ApiUrls.listMoviesEndpoint,
          parameters:
          {
            'limit': limit,
            "sort_by" : "year",
            "order_by" : "desc",
            "genre" : genre
          }
      );
      MoviesModel result = MoviesModel.fromJson(response.data);
      return result;
    }catch(e){
      rethrow;
    }

  }
}