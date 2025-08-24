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
      var response = await apiManager.getApi(endPoint: ApiUrls.listMoviesEndpoint,parameters: {'limit': 10});
      MoviesModel result = MoviesModel.fromJson(response.data);
      return result;
    }catch(e){
      rethrow;
    }
  }
}